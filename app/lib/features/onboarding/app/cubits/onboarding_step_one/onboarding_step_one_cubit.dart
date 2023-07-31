import 'package:app/core/di/locator.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_one_state.dart';
part 'onboarding_step_one_cubit.freezed.dart';

class OnboardingStepOneCubit extends Cubit<OnboardingStepOneState> {
  OnboardingStepOneCubit() : super(const OnboardingStepOneState());

  void init() {
    final InitialProfileCubit initialProfileCubit =
        locator<InitialProfileCubit>();
    if (initialProfileCubit.state.name != null)
      updateName(initialProfileCubit.state.name!);
  }

  void updateName(String name) {
    final value = FirstNameForm.dirty(name);
    emit(
      state.copyWith(name: value),
    );
    locator<OnboardingFormCubit>().updateFirstStep(value.valid);
  }
}
