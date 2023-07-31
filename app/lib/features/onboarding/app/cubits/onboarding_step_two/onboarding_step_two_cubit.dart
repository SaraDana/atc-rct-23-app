import 'package:app/core/di/locator.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_two_state.dart';
part 'onboarding_step_two_cubit.freezed.dart';

class OnboardingStepTwoCubit extends Cubit<OnboardingStepTwoState> {
  OnboardingStepTwoCubit() : super(const OnboardingStepTwoState());

  void init() {
    final InitialProfileCubit initialProfileCubit =
        locator<InitialProfileCubit>();
if (initialProfileCubit.state.birthday != null)
    updateBirthdate(initialProfileCubit.state.birthday!);
  }

  void updateBirthdate(String birthdate) {
    final value = BirthDateForm.dirty(birthdate);
    emit(
      state.copyWith(
        birthdate: value,
        formzStatus: Formz.validate(
          [
            state.birthdate,
          ],
        ),
      ),
    );
    locator<OnboardingFormCubit>().updateSecondStep(value.valid);
  }
}
