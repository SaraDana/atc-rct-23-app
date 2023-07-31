import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_eight_state.dart';
part 'onboarding_step_eight_cubit.freezed.dart';

class OnboardingStepEightCubit extends Cubit<OnboardingStepEightState> {
  OnboardingStepEightCubit() : super(const OnboardingStepEightState());

  void updateContentHelp(InitialProfileHelp helpType) {
    final List<InitialProfileHelp> list = [...state.contentHelpList];
    if (list.contains(helpType)) {
      list.remove(helpType);
    } else if(list.length < state.maxSelected) {
      list.add(helpType);
    }
    emit(state.copyWith(contentHelpList: list));
    locator<OnboardingFormCubit>().updateSeventhStep(list.isNotEmpty);
  }

  FieldValue getValueForFirebase() {    List<dynamic> result = [];
    for (var x in state.contentHelpList) {
      result.add({"value": InitialProfileHelpToString(x)});
    }
    return FieldValue.arrayUnion(result);
  }
}

