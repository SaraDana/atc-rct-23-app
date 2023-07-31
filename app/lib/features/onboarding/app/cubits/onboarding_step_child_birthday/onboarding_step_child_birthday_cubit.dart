import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_text/onboarding_step_child_text_cubit.dart';
import 'package:app/features/onboarding/app/ui/widgets/onboarding_step_child_text.dart';
import 'package:app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_child_birthday_state.dart';
part 'onboarding_step_child_birthday_cubit.freezed.dart';

class OnboardingStepChildBirtDayCubit
    extends Cubit<OnboardingStepChildBirtDayState> {
  OnboardingStepChildBirtDayCubit() : super(OnboardingStepChildBirtDayState()) {
    setInitial();
  }

  setInitial() {
    print("setInitial workded");
    emit(state.copyWith(childDates: {}));
  }

  updateChildBirthDate(int index, String time) {
    Map<String, dynamic> updatedChildDates = Map.from(state.childDates ?? {});

    if (updatedChildDates.containsKey(index.toString())) {
      updatedChildDates[index.toString()]['date'] = time;
      emit(state.copyWith(childDates: updatedChildDates, isUpdated: true));
    } else {
      updatedChildDates[index.toString()] = {'date': time};
      emit(state.copyWith(childDates: updatedChildDates, isUpdated: true));
    }

    emit(state.copyWith(isUpdated: false));

    if (state.childDates?.length ==
        locator<OnboardingStepChildTextCubit>().state.childCount) {
      locator<OnboardingFormCubit>().updateChildBirtDayStep(true);
    }
  }

  String textFormsHintTextByIndex(index, context) {
    if (index == 0) return S.of(context).firstChildTextFieldHintText;
    if (index == 1) return S.of(context).secondChildTextFieldHintText;
    if (index == 2) return S.of(context).thirdChildTextFieldHintText;
    if (index == 3) return S.of(context).fourthChildTextFieldHintText;

    return "";
  }

  String? getKey() {
    if (state.childDates?.length ==
        locator<OnboardingStepChildTextCubit>().state.childCount.value)
      return 'childBirthDates';

    return null;
  }

  List? getValue() {
    List values = [];
    if (state.childDates?.length ==
        locator<OnboardingStepChildTextCubit>().state.childCount.value) {
      state.childDates?.forEach((key, value) {
        values.add(value);
      });
      return values;
    }
    return null;
  }
}
