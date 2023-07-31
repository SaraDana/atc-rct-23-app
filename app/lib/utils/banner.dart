import 'dart:async';

import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../data/repositories/banner/firebase_banner_repository.dart';
import '../data/services/dana_analytics_service.dart';
import '../models/banner_model.dart';
import '../utils/preferences.dart';
import 'globals.dart';

class BannerUtils {
  static CustomBanner? banner;
  static Timer? timer;
  static int timesDisplayed = 0;
  static int sessions = -1;
  static late int lastDisplay;
  static late bool answered;

  static Future<void> init() async {
    bannerStreamController = StreamController<CustomBanner?>.broadcast();

    // get banners / banner / popupScreens
    final banners = await FirebaseBannerRepository().getBanners();

    if (banners.isEmpty) {
      return;
    }

    final currentBanner = banners.firstWhere((element) => element.isEnabled!,
        orElse: () => CustomBanner());
    if (currentBanner.id == null) return;

    final currentBannerScreens =
        await FirebaseBannerRepository().getBannerScreens(currentBanner.id);

    // set banner with popupScreens information
    banner = currentBanner.copyWith(popupScreens: currentBannerScreens);

    // get banner preferences
    timesDisplayed =
        PreferenceUtils.getInt(banner!.id! + PREF_TIMES_DISPLAYED) ?? 0;
    sessions = PreferenceUtils.getInt(banner!.id! + PREF_SESSIONS) ?? -1;
    lastDisplay = PreferenceUtils.getInt(banner!.id! + PREF_LAST_DISPLAY) ?? 0;
    answered = PreferenceUtils.getBool(banner!.id! + PREF_ANSWERED);

    // update banner preferences
    sessions++;
    PreferenceUtils.setInt(banner!.id! + PREF_SESSIONS, sessions);

    return;
  }

  static void close() {
    bannerStreamController?.close();
  }

  static StreamController<CustomBanner?>? getStream() => bannerStreamController;

  /*
  maxTimesDisplayed -> si se ha enseñado el banner más de estas veces (se haya
    contestado o se haya hecho dismiss del banner), ya no se muestra más.
  sessionsBetweenDisplays -> si hace menos de este número de sesiones desde la
    última vez que se enseñó el banner, no se puede mostrar.
  secondsBetweenDisplays -> si hace menos de X segundos desde la última vez que
    se enseñó el banner, no se puede mostrar.
  screenSecondsUntilDisplay -> retraso en la propia screen para enseñar el banner.
  canBeAnsweredMultipleTimes -> permite contestar a lo mismo diferentes veces
    (de momento, sobreescribe la respuesta). Si es que no y ya se ha contestado,
    el banner no se muestra.
  */
  static void checkVisibility(String page) {
    // reload PREF_ANSWERED
    if (banner == null) {
     // debugPrint('no banner available');
      return;
    }
    answered = PreferenceUtils.getBool(banner!.id! + PREF_ANSWERED);

    // check banner.isEnabled
    if (!banner!.isEnabled!) {
      debugPrint('banner disabled');
      return;
    }

    // check banner.displayInScreens
    if (banner!.displayInScreens!.indexOf(page) == -1) {
      debugPrint('banner screen not valid');
      return;
    }

    // check canBeAnsweredMultipleTimes
    if (answered && !banner!.canBeAnsweredMultipleTimes!) {
      debugPrint('banner answered and not allowed to answer multiple times');
      return;
    }

    // check sessionsBetweenDisplays
    if (sessions > 0 && sessions <= banner!.sessionsBetweenDisplays! + 1) {
      debugPrint(
          'banner not pass ${sessions - 1} sessionsBetweenDisplays ${banner!.sessionsBetweenDisplays}');
      return;
    }

    // check maxTimesDisplayed
    if (timesDisplayed > banner!.maxTimesDisplayed!) {
      debugPrint(
          'banner reachs $timesDisplayed maxTimesDisplayed ${banner!.maxTimesDisplayed}');
      return;
    }

    // secondsBetweenDisplays
    final currentSeconds =
        (DateTime.now().millisecondsSinceEpoch / 1000).round();
    if (lastDisplay + banner!.secondsBetweenDisplays! > currentSeconds) {
      debugPrint('banner not reach secondsBetweenDisplays');
      return;
    }
    //Send analytics
    DanaAnalyticsService.trackBannerView(page, banner?.name ?? 'null');

    show();
  }

  static void show() {
    timer?.cancel();

    // delay screenSecondsUntilDisplay
    debugPrint(
        'showing banner with a delay of ${banner!.screenSecondsUntilDisplay}');
    timer =
        new Timer(Duration(seconds: banner!.screenSecondsUntilDisplay!), () {
      // update preferences
      timesDisplayed++;
      sessions = 1;
      lastDisplay = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      PreferenceUtils.setInt(
          banner!.id! + PREF_TIMES_DISPLAYED, timesDisplayed);
      PreferenceUtils.setInt(banner!.id! + PREF_SESSIONS, sessions);
      PreferenceUtils.setInt(banner!.id! + PREF_LAST_DISPLAY, lastDisplay);

      // show banner
      bannerStreamController!.sink.add(banner);
    });
  }

  static void dismiss() {
    //Send analytics
    DanaAnalyticsService.trackDismissBanner(banner?.name ?? 'null');
    bannerStreamController!.sink.add(null);
  }

  // Only used in dev. stage
  static void clearPrefs() async {
    final banners = await FirebaseBannerRepository().getBanners();
    banners.forEach((banner) {
      PreferenceUtils.setInt(banner.id! + PREF_TIMES_DISPLAYED, 0);
      PreferenceUtils.setInt(banner.id! + PREF_SESSIONS, -1);
      PreferenceUtils.setInt(banner.id! + PREF_LAST_DISPLAY, 0);
      PreferenceUtils.setBool(banner.id! + PREF_ANSWERED, false);
    });
  }
}
