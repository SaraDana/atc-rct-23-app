part of 'onboarding_form_cubit.dart';

@freezed
class OnboardingFormState with _$OnboardingFormState {
  const factory OnboardingFormState({
    EditProfileData? editProfileData,
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    InitialProfileMoment? profileMoment,
    @Default(false) bool showPregnantWeeks,
    @Default(false) bool showMotherMonths,
    int? currentStep,
    @Default(false) bool isValidFirstStep,
    @Default(false) bool isValidSecondStep,
    @Default(false) bool isValidThirdStep,
    @Default(false) bool isValidFourthStep,
    @Default(false) bool isValidFifthStep,
    @Default(false) bool isValidSixthStep,
    @Default(false) bool isValidSeventhStep,
    @Default(false) bool isValidChildCountStep,
    @Default(false) bool isValidChildTextStep,
    @Default(false) bool isValidChildBirtdayStep,
  }) = _OnboardingFormState;
}
