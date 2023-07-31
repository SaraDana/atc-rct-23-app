import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_form/onboarding_form_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_seven_state.dart';
part 'onboarding_step_seven_cubit.freezed.dart';

class OnboardingStepSevenCubit extends Cubit<OnboardingStepSevenState> {
  OnboardingStepSevenCubit() : super(const OnboardingStepSevenState());

  void updateContentType(InitialProfileContentType contentType) {
    final List<InitialProfileContentType> list = [...state.contentTypeList];
    if (list.contains(contentType)) {
      list.remove(contentType);
    } else {
      list.add(contentType);
    }
    emit(state.copyWith(contentTypeList: list));
    locator<OnboardingFormCubit>().updateSeventhStep(list.isNotEmpty);
  }

  FieldValue getValueForFirebase() {
    List<dynamic> result = [];
    for (var x in state.contentTypeList) {
      result.add({"value": InitialProfileContentTypeToString(x)});
    }
    return FieldValue.arrayUnion(result);
  }
}
