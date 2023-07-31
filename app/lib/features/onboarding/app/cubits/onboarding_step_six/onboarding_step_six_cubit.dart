import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_six_state.dart';
part 'onboarding_step_six_cubit.freezed.dart';

class OnboardingStepSixCubit extends Cubit<OnboardingStepSixState> {
  OnboardingStepSixCubit() : super(const OnboardingStepSixState());

  void init() {
    final InitialProfileCubit initialProfileCubit =
    locator<InitialProfileCubit>();
    if (initialProfileCubit.state.initialProfileMotherExperience != null)
      updateMotherExperience(initialProfileCubit.state.initialProfileMotherExperience!);
  }

  void updateMotherExperience(InitialProfileMotherExperience motherExperience) {
    emit(state.copyWith(motherExperience: motherExperience));
    locator<OnboardingFormCubit>().updateSixthStep(true);
  }
}
