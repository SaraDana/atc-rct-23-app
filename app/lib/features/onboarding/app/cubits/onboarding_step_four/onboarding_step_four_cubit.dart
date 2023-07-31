import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_four_state.dart';
part 'onboarding_step_four_cubit.freezed.dart';

class OnboardingStepFourCubit extends Cubit<OnboardingStepFourState> {
  OnboardingStepFourCubit() : super(OnboardingStepFourState());

  void updateProfileMoment(InitialProfileMoment profileMoment) {
    emit(
      state.copyWith(
        profileMoment: profileMoment,
      ),
    );
    locator<OnboardingFormCubit>().updateFourthStep(true, profileMoment);
  }

}
