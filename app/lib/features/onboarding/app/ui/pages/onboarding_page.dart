import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/layouts/carrousel_layout.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_birthday/onboarding_step_child_birthday_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_text/onboarding_step_child_text_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_eight/onboarding_step_eight_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_five/onboarding_step_five_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_four/onboarding_step_four_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_one/onboarding_step_one_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_six/onboarding_step_six_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_three/onboarding_step_three_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_two/onboarding_step_two_cubit.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboardin_step_six.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_child_birthday.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_child_count.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_child_text.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_eight.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_five.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_four.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_one.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_three.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_two.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/onboarding_step_child_count/onboarding_step_child_count_cubit.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: DanaTheme.paletteFPink,
          body: BlocBuilder<OnboardingFormCubit, OnboardingFormState>(
            bloc: locator<OnboardingFormCubit>()..init(),
            builder: (context, state) {
              if (state.currentStep == null) {
                return CircularProgressIndicator();
              }
              return CarouselLayout(
                isOnboardingQuestionnare: true,
                onTapBack: () => locator<OnboardingFormCubit>().removeStep(),
                actualStep: state.currentStep!,
                content: [
                  WidgetWithCallback(
                      title: S.of(context).screenInitialProfilePage1Title,
                      widget: OnboardingStepOne(),
                      validation: state.isValidFirstStep,
                      onTap: () {
                        locator<OnboardingFormCubit>().updateUser('name',
                            locator<OnboardingStepOneCubit>().state.name.value);
                        locator<OnboardingFormCubit>().addStep();
                      }),
                  WidgetWithCallback(
                      title: S.of(context).screenInitialProfilePage2Title,
                      widget: OnboardingStepTwo(),
                      validation: state.isValidSecondStep,
                      onTap: () {
                        locator<OnboardingFormCubit>().updateUser(
                            'birthday',
                            locator<OnboardingStepTwoCubit>()
                                .state
                                .birthdate
                                .value);
                        locator<OnboardingFormCubit>().addStep();
                      }),
                  //2
                  WidgetWithCallback(
                      title: S.of(context).screenInitialProfilePage3Title,
                      widget: OnboardingStepThree(),
                      validation: state.isValidThirdStep,
                      onTap: () {
                        locator<OnboardingFormCubit>().updateUser(
                            'genre',
                            locator<OnboardingStepThreeCubit>()
                                .state
                                .genre
                                .value);
                        locator<OnboardingFormCubit>().addStep();
                      }),
                  WidgetWithCallback(
                      title: S.of(context).screenInitialProfilePage4Title,
                      widget: OnboardingStepFour(),
                      validation: state.isValidFourthStep,
                      onTap: () {
                        locator<OnboardingFormCubit>().updateUser(
                            'profileMoment',
                            initialProfileMomentToString(
                                locator<OnboardingStepFourCubit>()
                                    .state
                                    .profileMoment));
                        locator<OnboardingFormCubit>().addStep();
                      }),
                  if (state.profileMoment ==
                          InitialProfileMoment.I_AM_PREGNANT ||
                      state.profileMoment ==
                          InitialProfileMoment.I_AM_ALREADY_MOTHER)
                    WidgetWithCallback(
                      widget: OnboardingStepFive(),
                      validation: state.isValidFifthStep,
                      onTap: () {
                        locator<OnboardingFormCubit>().updateUser(
                          locator<OnboardingStepFiveCubit>().getKey(),
                          locator<OnboardingStepFiveCubit>().getValue(),
                        );
                        locator<OnboardingFormCubit>().addStep();
                      },
                    ),
                  if (state.profileMoment ==
                          InitialProfileMoment.LOOKING_TO_GET_PREGNANT ||
                      state.profileMoment ==
                          InitialProfileMoment.I_AM_PREGNANT ||
                      state.profileMoment ==
                          InitialProfileMoment.I_AM_ALREADY_MOTHER)
                    WidgetWithCallback(
                      title: S.of(context).iHaveMoreThanOneChild,
                      widget: OnboardingStepChildCountPage(),
                      validation: state.isValidChildCountStep,
                      onTap: () {
                        String? key =
                            locator<OnboardingStepChildCountCubit>().getKey();
                        String? value =
                            locator<OnboardingStepChildCountCubit>().getValue();

                        if (key != null && value != null) {
                          locator<OnboardingFormCubit>().updateUser(key, value);
                          locator<OnboardingFormCubit>().addStep();
                        }
                      },
                    ),

                  if (locator<OnboardingStepChildCountCubit>()
                              .state
                              .selectedIndex ==
                          1 &&
                      (state.profileMoment ==
                              InitialProfileMoment.LOOKING_TO_GET_PREGNANT ||
                          state.profileMoment ==
                              InitialProfileMoment.I_AM_PREGNANT ||
                          state.profileMoment ==
                              InitialProfileMoment.I_AM_ALREADY_MOTHER))
                    WidgetWithCallback(
                      title: S.of(context).iHaveMoreChild,
                      widget: OnboardingStepChildText(),
                      validation: state.isValidChildTextStep,
                      onTap: () {
                        String? key =
                            locator<OnboardingStepChildTextCubit>().getKey();
                        int? value =
                            locator<OnboardingStepChildTextCubit>().getValue();

                        if (key != null && value != null) {
                          locator<OnboardingFormCubit>().updateUser(key, value);
                          locator<OnboardingStepChildBirtDayCubit>()
                              .setInitial();
                          locator<OnboardingFormCubit>().addStep();
                        }
                      },
                    ),
                  if (locator<OnboardingStepChildCountCubit>()
                              .state
                              .selectedIndex ==
                          1 &&
                      (state.profileMoment ==
                              InitialProfileMoment.LOOKING_TO_GET_PREGNANT ||
                          state.profileMoment ==
                              InitialProfileMoment.I_AM_PREGNANT ||
                          state.profileMoment ==
                              InitialProfileMoment.I_AM_ALREADY_MOTHER))
                    WidgetWithCallback(
                      title: S.of(context).iHaveMoreChild,
                      widget: OnboardingStepChildBirthDay(),
                      validation: state.isValidChildTextStep,
                      onTap: () {
                        String? key =
                            locator<OnboardingStepChildBirtDayCubit>().getKey();
                        List? value = locator<OnboardingStepChildBirtDayCubit>()
                            .getValue();

                        if (key != null && value != null) {
                          locator<OnboardingFormCubit>().updateUser(key, value);
                          locator<OnboardingFormCubit>().addStep();
                        }
                      },
                    ),

                  if (state.profileMoment !=
                          InitialProfileMoment.NONE_OF_THE_ABOVE &&
                      state.profileMoment !=
                          InitialProfileMoment.I_AM_A_HEALTH_PROFESSIONAL &&
                      state.profileMoment !=
                          InitialProfileMoment.I_AM_THE_MOTHERS_PARTNER)
                    WidgetWithCallback(
                      title: S
                          .of(context)
                          .screenInitialProfilePage4MotherExperienceTitle,
                      widget: OnboardingStepSix(),
                      validation: state.isValidSixthStep,
                      onTap: () {
                        locator<OnboardingFormCubit>().updateUser(
                            'profileMotherExperience',
                            InitialProfileMotherExperienceToString(
                                locator<OnboardingStepSixCubit>()
                                    .state
                                    .motherExperience));
                        locator<OnboardingFormCubit>().addStep();
                      },
                    ),

                  WidgetWithCallback(
                    title: S.of(context).screenInitialProfilePage5Title,
                    widget: OnboardingStepEight(),
                    validation: state.isValidSeventhStep,
                    onTap: () {
                      locator<OnboardingFormCubit>().updateUser(
                          'profileHelp',
                          locator<OnboardingStepEightCubit>()
                              .getValueForFirebase());
                      DanaAnalyticsService.trackOnboardingComplete();
                      if (state.profileMoment ==
                              InitialProfileMoment.LOOKING_TO_GET_PREGNANT ||
                          state.profileMoment ==
                              InitialProfileMoment.I_AM_PREGNANT ||
                          state.profileMoment ==
                              InitialProfileMoment.I_AM_ALREADY_MOTHER) {
                        goRouter.goNamed(AppRoutes.succesDialogPage1.name);
                      } else {
                        context.goNamed(AppRoutes.succesDialogPage2.name);
                      }
                    },
                  ),
                ],
                nextStepButtonText:
                    S.of(context).screenInitialProfilePagesButtonNext,
                previousStepButtonText: '',
              );
            },
          ),
        ),
      ),
    );
  }
}
