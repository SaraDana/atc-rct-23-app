import 'package:app/core/di/locator.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_child_text_state.dart';
part 'onboarding_step_child_text_cubit.freezed.dart';

class OnboardingStepChildTextCubit extends Cubit<OnboardingStepChildTextState> {
  OnboardingStepChildTextCubit() : super(OnboardingStepChildTextState());

  void updateCount(int count) {
    final value = ChildCountForm.dirty(count);
    emit(
      state.copyWith(childCount: value),
    );

    locator<OnboardingFormCubit>().updateChildTextStep(value.valid);
  }

  String? getKey() {
    if (state.childCount.valid) return 'childCount';
    return null;
  }

  int? getValue() {
    if (state.childCount.valid) {
      return state.childCount.value;
    }
    return null;
  }
}
