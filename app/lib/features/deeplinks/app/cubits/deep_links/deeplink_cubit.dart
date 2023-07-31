import 'dart:async';

import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_state.dart';
import 'package:app/features/deeplinks/domain/constants/deep_link_constants.dart';
import 'package:app/features/deeplinks/domain/enums/deep_link_type.dart';
import 'package:app/features/deeplinks/domain/repositories/deep_link_repository.dart';
import 'package:app/utils/deeplink.utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../data/services/dana_analytics_service.dart';

class DeeplinkCubit extends Cubit<DeeplinkState> {
  final DeepLinkRepository firebaseDeepLinkRepository;
  final DeepLinkRepository uniLinksDeepLinkRepository;
  final DeepLinkRepository facebookDeepLinkRepository;
  DeeplinkCubit({
    required this.firebaseDeepLinkRepository,
    required this.uniLinksDeepLinkRepository,
    required this.facebookDeepLinkRepository,
  }) : super(DeeplinkState()) {
    facebookDeepLinkRepository.getLinks().listen((uri) async {
      _checkIfOpen(uri);
    });
    firebaseDeepLinkRepository.getLinks().listen((uri) async {
      _checkIfOpen(uri);
    });
    uniLinksDeepLinkRepository.getLinks().listen((uri) async {
      _checkIfOpen(uri);
    });
  }

  init() async {
    final Uri? firebaseUri = await firebaseDeepLinkRepository.getInitialLink();
    final Uri? uniLinksUri = await uniLinksDeepLinkRepository.getInitialLink();
    final Uri? facebookUri = await facebookDeepLinkRepository.getInitialLink();

    if (firebaseUri != null) {
      await _checkIfOpen(firebaseUri);
    } else if (uniLinksUri != null) {
      await _checkIfOpen(uniLinksUri);
    } else if (facebookUri != null) {
      await _checkIfOpen(facebookUri);
    } else {
      await checkPendingDynamicLink();
    }
  }

  _checkIfOpen(Uri deeplink) async {
    if (deeplink != state.deeplinkInQueue) {
      await openLink(deeplink: deeplink);
    }
  }

  bool _isDeeplinkUrl(Uri url) {
    if (url.path != "" && !url.toString().startsWith("https://")) {
      url = Uri.parse("https://${url.toString()}");
    }

    if (!hostDeepLinksDana.contains(url.host)) {
      return false;
    }

    for (String deeplinkPath in deeplinkUrlPaths) {
      if (urlFollowsPath(url, deeplinkPath)) return true;
    }
    return false;
  }

  Future<void> checkPendingDynamicLink() async {
    if (state.deeplinkInQueue != null) {
      await openLink(deeplink: state.deeplinkInQueue!);
    }
  }

  trackDeepLink(
      Uri deepLink, bool isDeeplink, String? contentType, String? contentId) {
    Map<String, Object?> urlParameters = {};
    deepLink.queryParametersAll.forEach((key, value) {
      urlParameters[key] = value;
    });

    Map<String, Object?> properties = {
      'url': deepLink.toString(),
      'is_deeplink': isDeeplink,
      'content_type': contentType,
      'content_id': contentId,
      "url_parameters": urlParameters,
    };

    DanaAnalyticsService.trackOpenLink(properties);
  }

  Future<void> openLink({required Uri deeplink}) async {
    deeplink.normalizePath();

    if (goRouter.location.contains('initialProfileOnboarding') ||
        goRouter.location.contains('welcome')) {
      return emit(state.copyWith(
          deeplinkInQueue: deeplink, status: StatusCubit.INITIAL));
    }
    // check url has nothing to do with our deeplinks -> ask OS to open url
    bool isDeeplink = _isDeeplinkUrl(deeplink);
    if (!isDeeplink) {
      debugPrint("We have some problem in deeplink type");

      trackDeepLink(deeplink, false, null, null);
      //launchUrl(deeplink); this is making our deeplinks jump each time
      emit(state.copyWith(
        deeplinkInQueue: null,
        status: StatusCubit.ERROR,
      ));
      _restartState();
      return;
    }

    if (deeplink != "" && !deeplink.toString().startsWith("https://")) {
      deeplink = Uri.parse("https://${deeplink.toString()}");
    }
    if (urlFollowsPath(deeplink, programUrlPath)) {
      String? id = getParamFromUrlPath(deeplink, programUrlPath, "id");
      if (id == null) {
        trackDeepLink(deeplink, true, 'program', null);
        emit(state.copyWith(
          status: StatusCubit.ERROR,
          //errorMessage:S.of(context).deeplinkErrorMissingParamInPath
        ));
        _restartState();
        return;
      }
      final bool forceNavigate =
          state.deeplink != null && !state.deeplink!.contains(id);
      trackDeepLink(deeplink, true, 'program', id);
      emit(
        state.copyWith(
          deeplink: id,
          deepLinkType: DeepLinkType.PROGRAM,
          status: StatusCubit.SUCCESS,
          forceNavigate: forceNavigate,
        ),
      );
      _restartState();
      return;
    } else if (urlFollowsPath(deeplink, programUrlPathEmpty)) {
      emit(
        state.copyWith(
          deeplink: "",
          deepLinkType: DeepLinkType.PROGRAM,
          status: StatusCubit.SUCCESS,
          deeplinkInQueue: null,
        ),
      );
      trackDeepLink(deeplink, true, 'program', null);
      _restartState();
      return;
    } else if (urlFollowsPath(deeplink, moodTrackerUrlPath)) {
      trackDeepLink(deeplink, true, 'moodtracker', null);
      emit(state.copyWith(
        deeplink: "",
        deepLinkType: DeepLinkType.MOODTRACKER,
        status: StatusCubit.SUCCESS,
        forceNavigate: true,
      ));

      return;
    } else if (urlFollowsPath(deeplink, consultationUrlPath)) {
      trackDeepLink(deeplink, true, consultationUrlPath, null);
      emit(state.copyWith(
        deeplink: "",
        deepLinkType: DeepLinkType.CONSULTATION,
        status: StatusCubit.SUCCESS,
        forceNavigate: true,
      ));

      return;
    } else if (urlFollowsPath(deeplink, myProgressUrlPath)) {
      String? tabId = getParamFromUrlPath(deeplink, myProgressUrlPath, "index");
      if (tabId == null) {
        trackDeepLink(deeplink, true, 'myProgress', null);
        emit(
          state.copyWith(status: StatusCubit.SUCCESS),
        );
        return;
      }
      trackDeepLink(deeplink, true, 'myProgress', tabId);
      final bool forceNavigate =
          state.deeplink != null && !state.deeplink!.contains(tabId);

      emit(
        state.copyWith(
          deeplink: tabId,
          deepLinkType: DeepLinkType.MY_PROGRESS,
          status: StatusCubit.SUCCESS,
          forceNavigate: forceNavigate,
        ),
      );
      _restartState();
      return;
    } else if (urlFollowsPath(deeplink, publicationUrlPath)) {
      String? id = getParamFromUrlPath(deeplink, publicationUrlPath, "id");
      if (id == null) {
        trackDeepLink(deeplink, true, 'publication', null);
        emit(state.copyWith(
          status: StatusCubit.ERROR,
          //errorMessage:S.of(context).deeplinkErrorMissingParamInPath
        ));
        return;
      }
      trackDeepLink(deeplink, true, 'publication', id);
      final bool forceNavigate =
          state.deeplink != null && !state.deeplink!.contains(id);

      emit(
        state.copyWith(
          deeplink: id,
          deepLinkType: DeepLinkType.PUBLICATION,
          status: StatusCubit.SUCCESS,
          forceNavigate: forceNavigate,
        ),
      );
      _restartState();
      return;
    } else if (urlFollowsPath(deeplink, publicationUrlPathEmpty)) {
      emit(
        state.copyWith(
          deeplink: deeplink.toString(),
          deepLinkType: DeepLinkType.PUBLICATION,
          status: StatusCubit.SUCCESS,
          deeplinkInQueue: null,
        ),
      );
      _restartState();
      return;
    }
  }

  _restartState() {
    emit(state.copyWith(
      status: StatusCubit.INITIAL,
      deeplinkInQueue: null,
      forceNavigate: false,
    ));
  }
}
