import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/features/edit_profile/domain/models/edit_profile_data.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_form_state.dart';
part 'onboarding_form_cubit.freezed.dart';

class OnboardingFormCubit extends Cubit<OnboardingFormState> {
  OnboardingFormCubit() : super(const OnboardingFormState());
  init() async {
    emit(state.copyWith(status: StatusCubit.LOADING));
    final InitialProfileCubit initialProfileCubit =
        locator<InitialProfileCubit>();
    final NewUserModel? user = await FirebaseUserRepository().getUserByEmail();

    final int currentStep = await checkActualStep(user);
    try {
      emit(state.copyWith(
        editProfileData: EditProfileData(
          name: initialProfileCubit.state.name,
          genre: initialProfileCubit.state.genre,
          birthday: initialProfileCubit.state.birthday,
          location: initialProfileCubit.state.location,
          lastPeriod: initialProfileCubit.state.lastPeriod,
          childBirthDate: initialProfileCubit.state.childBirthDate,
        ),
        status: StatusCubit.SUCCESS,
        currentStep: currentStep,
        profileMoment: stringToInitialProfileMoment(user?.profileMoment ?? ''),
      ));
    } catch (e) {}
  }

  Future<int> checkActualStep(NewUserModel? user) async {
    int? currentStep;
    if (user == null) return 0;
    final isNameValid = _checkIfStringIsValid(user.name);
    final isBirthdayValid = _checkIfStringIsValid(user.birthday);
    final isGenreValid = _checkIfStringIsValid(user.genre);
    final isProfileMomentValid = _checkIfStringIsValid(user.profileMoment);
    // final isProfileMotherExperienceValid =
    //     _checkIfStringIsValid(user.profileMotherExperience);
    // final isProfileContentTypeValid =
    //     user.profileContentType != null && user.profileContentType!.isNotEmpty;
    // final childOrPeriodDateValid =  _checkValidPeriodOrChildBirthDate(stringToInitialProfileMoment(user.profileMoment ?? ''), user);

    if (!isNameValid) return 0;
    if (!isBirthdayValid) return 1;
    if (!isGenreValid) return 2;
    //if(!isProfileMomentValid)
    return 3;
  }

  void addStep() {
    if (state.currentStep == null) {
      return emit(state.copyWith(currentStep: 0));
    }

    emit(state.copyWith(currentStep: state.currentStep! + 1));
  }

  void removeStep() {
    if (state.currentStep == null) {
      return emit(state.copyWith(currentStep: 0));
    }
    emit(state.copyWith(currentStep: state.currentStep! - 1));
  }

  _checkIfStringIsValid(String? value) {
    if (value == null) return false;
    if (value.isEmpty) return false;
    return true;
  }

  void updateFirstStep(bool isValid) {
    emit(state.copyWith(isValidFirstStep: isValid));
  }

  void updateSecondStep(bool isValid) {
    emit(state.copyWith(isValidSecondStep: isValid));
  }

  void updateThirdStep(bool isValid) {
    emit(state.copyWith(isValidThirdStep: isValid));
  }

  void updateFourthStep(bool isValid, InitialProfileMoment profileMoment) {
    emit(state.copyWith(
        isValidFourthStep: isValid, profileMoment: profileMoment));
  }

  void updateFifthStep(bool isValid) {
    emit(state.copyWith(isValidFifthStep: isValid));
  }

  void updateSixthStep(bool isValid) {
    emit(state.copyWith(isValidSixthStep: isValid));
  }

  void updateSeventhStep(bool isValid) {
    emit(state.copyWith(isValidSeventhStep: isValid));
  }

  void updateChildCountStep(bool isValid) {
    emit(state.copyWith(isValidChildCountStep: isValid));
  }

  void updateChildTextStep(bool isValid) {
    emit(state.copyWith(isValidChildTextStep: isValid));
  }

  void updateChildBirtDayStep(bool isValid) {
    emit(state.copyWith(isValidChildBirtdayStep: isValid));
  }

  navigateTo(int step) {
    emit(state.copyWith(currentStep: step));
  }

  updateUser(String key, dynamic value) {
    locator<InitialProfileCubit>().setUserByEmail(data: {
      'updatedAt': Timestamp.now(),
      key: value,
    });
  }

  // here add all conditions to update
  bool get iCanUpdated => true; //state.formzStatus.isValid;
}
