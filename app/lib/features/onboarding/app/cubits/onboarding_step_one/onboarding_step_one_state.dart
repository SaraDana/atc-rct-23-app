part of 'onboarding_step_one_cubit.dart';

@freezed
class OnboardingStepOneState with _$OnboardingStepOneState {
  const factory OnboardingStepOneState({
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    @Default(FirstNameForm.pure()) FirstNameForm name,
  }) = _OnboardingStepOneState;
}
