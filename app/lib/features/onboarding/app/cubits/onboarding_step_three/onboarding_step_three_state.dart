part of 'onboarding_step_three_cubit.dart';

@freezed
class OnboardingStepThreeState with _$OnboardingStepThreeState {
  const factory OnboardingStepThreeState({
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    @Default(GenreForm.pure()) GenreForm genre,
  }) = _OnboardingStepThreeState;
}
