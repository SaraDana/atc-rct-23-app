import 'dart:math';

import 'package:app/config/constants.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/core/utils/device_info/device_info.dart';
import 'package:app/core/utils/remote_config/app_version_config.dart';
import 'package:app/core/utils/remote_config/remote_config.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/data/services/firebase_crachlytics_manager.dart';
import 'package:app/features/start_app/app/cubit/start_app_state.dart';
import 'package:app/features/start_app/domain/repository/start_app_repository.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/utils/banner.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:version/version.dart';

import '../../../../data/services/push_notifications.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit({
    required StartAppRepository startAppRepository,
    required DanaRemoteConfig remoteConfig,
    required AppDeviceInfo deviceInfo,
  })  : _remoteConfig = remoteConfig,
        _startAppRepository = startAppRepository,
        _deviceInfo = deviceInfo,
        super(StartAppState());
  final DanaRemoteConfig _remoteConfig;
  final AppDeviceInfo _deviceInfo;

  final StartAppRepository _startAppRepository;

  Future<void> init() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      AppVersionConfig appVersionConfig = await checkVersion();
      if (appVersionConfig.needShowUpdate) {
        emit(state.copyWith(
          appVersionConfig: appVersionConfig,
        ));
        return;
      }
      _startAppRepository.user().stream.listen((User?  user) async {
        bool showOnboarding = false;

        if (user != null) {
          try {
            await BannerUtils.init();
          } catch (e) {
            FirebaseCrashyticsManager().sendGenericError(e.toString());
          }
          try {
            await _checkIfIsNewUser(user);
            final NewUserModel _user = await getUserByEmailUntilSuccess();
            showOnboarding = await _checkIfOnboardingIsRequired(_user);
            final int date = _remoteConfig.dateForTestAB;
            if (_user.premiumGroupB == null &&
                date > 0 &&
                _user.createdAt!.isAfter(timeStampToDateTime(date))) {
              _user.premiumGroupB = await updatePremiumGroup();
            }

            try {
              DanaAnalyticsService.updateUserInfo('${user.email}');
              if (_user.id != null) {
                PushNotificationService.updateUserInfo(PushNotificationUserInfo(
                    _user.id!,
                    _user.name)); // here we don't know the user's name
              }
            } catch (e) {
              FirebaseCrashyticsManager().sendGenericError(e.toString());
            }

            locator<PurchasesCubit>().updateUserInfo();

            await registerCubits();
          } catch (e) {
            FirebaseCrashyticsManager().sendGenericError(e.toString());
          }
        }

        emit(StartAppState(
          isLogged: user != null,
          appVersionConfig: appVersionConfig,
          showOnboarding: showOnboarding,
        ));
      });
    } catch (e) {
      FirebaseCrashyticsManager().sendGenericError(e.toString());
    }
  }

  void oneSecondDelay() {
    // Create variable whit 1 second of delay to show splash screen
    bool oneSecondDelay = false;
    //Create delay and change oneSecondDelay to true
    Future.delayed(Duration(seconds: 1), () {
      if (!oneSecondDelay) {
        oneSecondDelay = true;
        //emit(state.copyWith(waitOneSecond: oneSecondDelay));
      }
    });
  }

  Future<void> _checkIfIsNewUser(User user) async {
    print("_checkIfIsNewUser çaluştu");
    FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .where('email', isEqualTo: user.email)
        .get()
        .then((doc) async {
      if (doc.docs.length == 0) {
        await FirebaseUserRepository().createNewUser(user);
      }
    });
  }

  setQuestionnaireId(String? questionnareId) {
    emit(state.copyWith(questionnareId: questionnareId));
  }

  Future<bool> updatePremiumGroup() async {
    bool isPremiumGroupB =
        Random().nextDouble() > _remoteConfig.premiumGroupCoefficient;
    await FirebaseUserRepository()
        .setUserByEmail(data: {'premiumGroupB': isPremiumGroupB});

    return isPremiumGroupB;
  }

  Future<AppVersionConfig> checkVersion() async {
    try {
      await _remoteConfig.init();
      final remoteVersion = await _remoteConfig.getVersions();
      final String currentBuild = _deviceInfo.getCurrentVersion;

      final minVersionStr = remoteVersion['minVersion'].toString();

      Version currentVersion = Version.parse(currentBuild);
      Version minVersion = Version.parse(minVersionStr);

      return AppVersionConfig(
        isLatestVersion: false,
        isVersionNotAllowed: false,
        needShowUpdate: (currentVersion < minVersion),
      );
    } catch (e) {
      return AppVersionConfig(
          isLatestVersion: false,
          isVersionNotAllowed: false,
          needShowUpdate: false);
    }
  }

  Future<bool> checkIfOnboardingIsRequired(NewUserModel user) =>
      _checkIfOnboardingIsRequired(user);

  Future<bool> _checkIfOnboardingIsRequired(NewUserModel user) async {
    print("_checkIfOnboardingIsRequired BU ÇALIŞTU");
    final InitialProfileMoment profileMoment =
        stringToInitialProfileMoment(user.profileMoment ?? '');

    if (profileMoment == InitialProfileMoment.I_AM_PREGNANT &&
        user.lastPeriod == null) {
      return true;
    }
    if (profileMoment == InitialProfileMoment.I_AM_ALREADY_MOTHER &&
        user.childBirthDate == null) {
      return true;
    }
    if (isNullOrEmpty(user.name) ||
        isNullOrEmpty(user.birthday) ||
        isNullOrEmpty(user.genre) ||
        (profileMotherExperienceMustBeFilled(user.profileMoment) &&
            isNullOrEmpty(user.profileMotherExperience)) ||
        isNullOrEmpty(user.profileMoment)) {
      return true;
    }

    return false;
  }

  bool profileMotherExperienceMustBeFilled(String? profileMoment) {
    if (profileMoment == InitialProfileMoment.LOOKING_TO_GET_PREGNANT.name ||
        profileMoment == InitialProfileMoment.I_AM_PREGNANT.name ||
        profileMoment == InitialProfileMoment.I_AM_ALREADY_MOTHER.name)
      return true;

    return false;
  }

  Future<NewUserModel> getUserByEmailUntilSuccess() async {
    while (true) {
      NewUserModel? user = await FirebaseUserRepository().getUserByEmail();
      if (user != null) return user;
      await Future.delayed(Duration(milliseconds: 200));
    }
  }
}

bool isNullOrEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return true;
  }
  return false;
}
