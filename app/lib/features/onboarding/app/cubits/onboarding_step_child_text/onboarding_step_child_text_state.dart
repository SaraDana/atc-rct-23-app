part of 'onboarding_step_child_text_cubit.dart';

@freezed
class OnboardingStepChildTextState with _$OnboardingStepChildTextState {
  const factory OnboardingStepChildTextState({
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    @Default(ChildCountForm.pure()) ChildCountForm childCount,
  }) = _OnboardingStepChildTextState;
}
