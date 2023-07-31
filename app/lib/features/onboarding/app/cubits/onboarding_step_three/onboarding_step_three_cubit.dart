import 'package:app/core/di/locator.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_three_state.dart';
part 'onboarding_step_three_cubit.freezed.dart';

class OnboardingStepThreeCubit extends Cubit<OnboardingStepThreeState> {
  OnboardingStepThreeCubit() : super(const OnboardingStepThreeState());

  void init() {
    final InitialProfileCubit initialProfileCubit =
        locator<InitialProfileCubit>();
    if (initialProfileCubit.state.genre != null)
      updateGenre(initialProfileCubit.state.genre!.name);
  }

  void updateGenre(String genre) {
    final value = GenreForm.dirty(genre);
    emit(
      state.copyWith(
        genre: value,
        formzStatus: Formz.validate(
          [
            value,
          ],
        ),
      ),
    );
    locator<OnboardingFormCubit>().updateThirdStep(value.valid);
  }
}
