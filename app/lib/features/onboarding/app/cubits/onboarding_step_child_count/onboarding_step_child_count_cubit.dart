import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_child_count_state.dart';
part 'onboarding_step_child_count_cubit.freezed.dart';

class OnboardingStepChildCountCubit
    extends Cubit<OnboardingStepChildCountState> {
  OnboardingStepChildCountCubit()
      : super(const OnboardingStepChildCountState());

  setChildCountSelection(int selectedIndex) {
    emit(state.copyWith(selectedIndex: selectedIndex));

    locator<OnboardingFormCubit>().updateChildCountStep(true);
  }

  String? getKey() {
    if (state.selectedIndex != null) return 'childCountSelection';
    return null;
  }

  String? getValue() {
    if (state.selectedIndex != null) {
      if (state.selectedIndex == 0) {
        return "PRIMER_HIJO_A";
      } else {
        return "TENGO_MAS_HIJOS";
      }
    }
    return null;
  }
}
