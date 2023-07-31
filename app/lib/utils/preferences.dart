import 'dart:convert';

import 'package:app/data/services/push_notifications.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/constants.dart';
import '../models/unit_bookmarked.dart';

class PreferenceUtils {
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  //sets
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs!.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs!.setStringList(key, value);

  //gets
  static bool getBool(String key, {bool defValue = false}) =>
      _prefs!.getBool(key) ?? defValue;

  static double? getDouble(String key) => _prefs!.getDouble(key);

  static int? getInt(String key) => _prefs!.getInt(key);

  static String? getString(String key) => _prefs!.getString(key);

  static List<String>? getStringList(String key) => _prefs!.getStringList(key);

  //deletes..
  static Future<bool> remove(String key) async => await _prefs!.remove(key);

  // static Future<bool> clear() async => await _prefs.clear();

  static Future<void> removeAll() async {
    final keys = _prefs!.getKeys();
    keys.map((key) {
      if (key != UNIT_BOOKMARKED) {
        remove(key);
      }
    });
  }

  static setUnitBookmarked(List<UnitBookmarked?> unitBookmarkedList) async {
    late var value;
    value = json.encode(unitBookmarkedList);

    final p = _prefs!;
    p.setString(UNIT_BOOKMARKED, value);
  }

  static List<UnitBookmarked?> getUnitBookmarked() {
    final p = _prefs!;
    final jsonString = p.getString(UNIT_BOOKMARKED);

    if (jsonString == null) {
      return [];
    }

    final jsonList = jsonDecode(jsonString);

    final List<UnitBookmarked?> unitBookmarkedList = List<UnitBookmarked?>.from(
        jsonList.map((json) => UnitBookmarked.fromJson(json)));

    return unitBookmarkedList;
  }

  static bool? getEnableNotification() {


    return _prefs?.getBool(NOTIFICATIONS);
  }

  static void setEnableNotification(bool value) {
    _prefs?.setBool(NOTIFICATIONS, value);
    PushNotificationService.changePermission(value);
  }

  static bool getAutoPlay() {
    final bool? value = _prefs?.getBool(AUTO_PLAY);

    if (value == null) {
      return true;
    }

    return value;
  }

  static getNumberOfTimesInAppReviewShown() {
    final int? value = _prefs?.getInt(NUMBER_OF_TIMES_IN_APP_REVIEW_SHOWN);

    if (value == null) {
      return 0;
    }

    return value;
  }


  static getNumberOfNotifications() {
    final int? value = _prefs?.getInt(NUMBER_OF_NOTIFICATIONS);

    if (value == null) {
      return 0;
    }

    return value;
  }

  static removeNumberOfNotifications() {
    _prefs?.remove(NUMBER_OF_NOTIFICATIONS);
  }

  static incrementNotification() {
    final int numberOfNotifications = getNumberOfNotifications();
    setNotificationNumber(numberOfNotifications + 1);
  }
  static decrementNotification() {
    final int numberOfNotifications = getNumberOfNotifications();
    setNotificationNumber(numberOfNotifications - 1);


  }
  static setNotificationNumber(int value) {

    _prefs?.setInt(NUMBER_OF_NOTIFICATIONS, value);
    FlutterAppBadger.updateBadgeCount(value);
  }
}
