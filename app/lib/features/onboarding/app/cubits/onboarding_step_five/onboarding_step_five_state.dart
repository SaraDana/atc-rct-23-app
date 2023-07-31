part of 'onboarding_step_five_cubit.dart';

@freezed
class OnboardingStepFiveState with _$OnboardingStepFiveState {
  const factory OnboardingStepFiveState({
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    @Default(BirthDateForm.pure()) BirthDateForm lastPeriod,
    @Default(BirthDateForm.pure()) BirthDateForm childBirthDate,
    @Default(InitialProfileMoment.NONE_OF_THE_ABOVE)
        InitialProfileMoment profileMoment,
  }) = _OnboardingStepFiveState;
}
