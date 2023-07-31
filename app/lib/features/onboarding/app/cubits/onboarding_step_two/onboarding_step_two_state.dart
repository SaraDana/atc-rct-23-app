part of 'onboarding_step_two_cubit.dart';

@freezed
class OnboardingStepTwoState with _$OnboardingStepTwoState {
  const factory OnboardingStepTwoState({
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    @Default(BirthDateForm.pure()) BirthDateForm birthdate,
  }) = _OnboardingStepTwoState;
}
