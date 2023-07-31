import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_four/onboarding_step_four_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'onboarding_step_five_state.dart';
part 'onboarding_step_five_cubit.freezed.dart';

class OnboardingStepFiveCubit extends Cubit<OnboardingStepFiveState> {
  OnboardingStepFiveCubit() : super(const OnboardingStepFiveState());

  void init() {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    InitialProfileMoment? profileMoment =
        locator<OnboardingStepFourCubit>().state.profileMoment;
    emit(state.copyWith(
      profileMoment: profileMoment ?? InitialProfileMoment.NONE_OF_THE_ABOVE,
      formzStatus: FormzStatus.submissionSuccess,
    ));

    if (state.profileMoment == InitialProfileMoment.I_AM_ALREADY_MOTHER)
      locator<OnboardingFormCubit>()
          .updateFifthStep(state.childBirthDate.valid);
    else if (state.profileMoment == InitialProfileMoment.I_AM_PREGNANT)
      locator<OnboardingFormCubit>().updateFifthStep(state.lastPeriod.valid);
    else {
      locator<OnboardingFormCubit>().updateFifthStep(false);
    }
  }

  void updateChildBirthDate(String birthDate) {
    final value = BirthDateForm.dirty(birthDate);
    emit(
      state.copyWith(
        childBirthDate: value,
        formzStatus: Formz.validate(
          [
            value,
          ],
        ),
      ),
    );
    locator<OnboardingFormCubit>().updateFifthStep(value.valid);
  }

  void updateLastPeriodDate(String lastPeriodDate) {
    final value = BirthDateForm.dirty(lastPeriodDate);
    emit(
      state.copyWith(
        lastPeriod: value,
        formzStatus: Formz.validate(
          [
            value,
          ],
        ),
      ),
    );
    locator<OnboardingFormCubit>().updateFifthStep(value.valid);
  }

  String getKey() {
    if (state.childBirthDate.valid)
      return 'childBirthDate';
    else if (state.lastPeriod.valid) return 'lastPeriod';
    return '';
  }

  DateTime getValue() {
    try {
      DateFormat formatter = DateFormat("dd-MM-yyyy");

      if (state.childBirthDate.valid)
        return formatter.parse(state.childBirthDate.value);
      else if (state.lastPeriod.valid)
        return formatter.parse(state.lastPeriod.value);

      return DateTime.now();
    } catch (e) {
      return DateTime.now();
    }
  }
}
