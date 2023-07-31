import 'package:app/core/utils/device_info/device_info.dart';
import 'package:app/core/utils/permissions_utils.dart';
import 'package:app/core/utils/remote_config/remote_config.dart';
import 'package:app/cubits/category_investment/category_investment_cubit.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_week/mood_week_cubit.dart';
import 'package:app/cubits/myprogress/cubit/myprogress_cubit.dart';
import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/cubits/publications/publications_cubit.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/question_new_home/question_new_home_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/cubits/unit_program/unit_program_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/data/repositories/moodtracker/firebase_moodtracker_repository.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/features/auth/app/cubits/recover_password/recover_password_cubit.dart';
import 'package:app/features/auth/app/cubits/sign_in/sign_in_cubit.dart';
import 'package:app/features/auth/app/cubits/sign_up/sign_up_cubit.dart';
import 'package:app/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:app/features/community/app/cubits/community_cubit.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/features/deeplinks/data/repositories/facebook_deep_link_repository.dart';
import 'package:app/features/deeplinks/data/repositories/firebase_deep_link_repository.dart';
import 'package:app/features/deeplinks/data/repositories/uni_deep_link_repository.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
import 'package:app/features/generic_questionnare/cubit/onboarding_questionnare/generic_questionnare_cubit.dart';
import 'package:app/features/in_app_review/app/cubits/in_app_review_cubit.dart';
import 'package:app/features/midwife/app/cubit/midwife_cubit.dart';
import 'package:app/features/notifications/app/cubits/notification_cubit.dart';
import 'package:app/features/notifications/data/repositories/firebase_notifications_repository.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_birthday/onboarding_step_child_birthday_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_count/onboarding_step_child_count_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_text/onboarding_step_child_text_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_eight/onboarding_step_eight_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_five/onboarding_step_five_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_four/onboarding_step_four_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_one/onboarding_step_one_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_seven/onboarding_step_seven_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_six/onboarding_step_six_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_three/onboarding_step_three_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_two/onboarding_step_two_cubit.dart';
import 'package:app/features/permissions/app/cubits/permissions_handler_cubit.dart';
import 'package:app/features/start_app/app/cubit/start_app_cubit.dart';
import 'package:app/features/start_app/data/repositories/firebase_start_app_repository.dart';
import 'package:app/features/units/app/cubit/user_units/user_units_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/repositories/purchases/revenue_cat_purchases_repository.dart';
import 'package:app/repositories/user_premium/firebase_user_premium_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton<DanaRemoteConfig>(
    () => RemoteConfigImpl(),
  );
  locator.registerLazySingleton<AppDeviceInfo>(
    () => DeviceInfoImpl()..init(),
  );

  await registerCubits();
}

registerCubits() async {
  _registerSingleton(SignInCubit(
      authRepository: FirebaseAuthRepository(),
      userRepository: FirebaseUserRepository()));
  _registerSingleton(SignUpCubit(
      authRepository: FirebaseAuthRepository(),
      userRepository: FirebaseUserRepository()));
  _registerSingleton(RecoverPasswordCubit(
    authRepository: FirebaseAuthRepository(),
  ));

  _registerSingleton(
      InterestedEventCubit());

  _registerSingleton(MyprogressCubit(userRepository: FirebaseUserRepository()));

  _registerSingleton(StartAppCubit(
    deviceInfo: locator<AppDeviceInfo>(),
    remoteConfig: locator<DanaRemoteConfig>(),
    startAppRepository: FirebaseStartAppRepository()..user(),
  ));
  _registerSingleton(DeeplinkCubit(
    firebaseDeepLinkRepository: FirebaseDeepLinkRepository(),
    uniLinksDeepLinkRepository: UniDeepLinkRepository(),
    facebookDeepLinkRepository: FacebookDeepLinkRepository(),
  ));
  _registerSingleton(
      UserPremiumCubit(userPremiumRepository: FirebaseUserPremiumRepository()));

  _registerSingleton(InitialProfileCubit());

  _registerSingleton(OnboardingFormCubit());
  _registerSingleton(OnboardingStepOneCubit());
  _registerSingleton(OnboardingStepTwoCubit());
  _registerSingleton(OnboardingStepThreeCubit());
  _registerSingleton(OnboardingStepFourCubit());
  _registerSingleton(OnboardingStepFiveCubit());
  _registerSingleton(OnboardingStepSixCubit());
  _registerSingleton(OnboardingStepSevenCubit());
  _registerSingleton(OnboardingStepEightCubit());
  _registerSingleton(OnboardingStepChildCountCubit());
  _registerSingleton(OnboardingStepChildTextCubit());
  _registerSingleton(OnboardingStepChildBirtDayCubit());
  _registerSingleton(GenericQuestionnareCubit());
  _registerSingleton(QuestionNewHomeCubit());
  _registerSingleton(MidWifeCubit());
  _registerSingleton(PublicationsCubit());


  
  _registerSingleton(NotificationCubit(
      notificationRepository: FirebaseNotificationsRepository()));
  _registerSingleton(EditProfileCubit());
  _registerSingleton(
      InAppReviewCubit(remoteConfig: locator<DanaRemoteConfig>()));

  _registerSingleton(PurchasesCubit(
      purchasesRepository: RevenueCatPurchasesRepository(),
      userRepository: FirebaseUserRepository()));
  _registerSingleton(
      PermissionsHandlerCubit(permissionUtils: PermissionUtils()));

  _registerSingleton(
      CommunityCubit(repository: FirebasePublicationRepository()));
  if (!locator.isRegistered<ProgramCubit>()) {
    locator.registerFactory(() => ProgramCubit());
  }
  if (!locator.isRegistered<UnitProgramCubit>()) {
    locator.registerFactory(() => UnitProgramCubit());
  }
  if (!locator.isRegistered<UserUnitsCubit>()) {
    locator.registerFactory(() => UserUnitsCubit());
  }
  _registerSingleton(
      UserMoodCubit(moodtrackerRepository: FirebaseMoodtrackerRepository())
        ..userMoodInit(isTrackerTutorialSeenInc: true));

  _registerSingleton(QuestionnareCubit());
  _registerSingleton(MoodFilterCubit());

  _registerSingleton(CategoryInvestmentCubit());
  _registerSingleton(MoodWeekCubit());
}

resetUserInfoCubits() {
  /*locator.unregister<UserPremiumCubit>();
  locator.unregister<UserMoodCubit>();
  locator.unregister<InitialProfileCubit>();
  locator.unregister<PurchasesCubit>();
  locator.unregister<EditProfileCubit>();*/

  locator<UserPremiumCubit>().reset();
  locator<UserMoodCubit>().reset();
  locator<InitialProfileCubit>().reset();
  locator<PurchasesCubit>().reset();
  locator<EditProfileCubit>().reset();
}

void _registerSingleton<T extends Cubit<dynamic>>(T cubit) {
  if (!locator.isRegistered<T>()) {
    locator.registerSingleton<T>(cubit);
  }
}
