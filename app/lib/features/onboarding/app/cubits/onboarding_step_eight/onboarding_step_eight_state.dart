part of 'onboarding_step_eight_cubit.dart';

@freezed
class OnboardingStepEightState with _$OnboardingStepEightState {
  const factory OnboardingStepEightState({
    @Default([]) List<InitialProfileHelp> contentHelpList,
    @Default(3) int maxSelected,
  }) = _OnboardingStepEightState;
}
