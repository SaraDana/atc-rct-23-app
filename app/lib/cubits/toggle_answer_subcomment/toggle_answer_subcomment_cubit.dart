import 'dart:developer';

import 'package:bloc/bloc.dart';

part 'toggle_answer_subcomment_state.dart';

class ToggleAnswerSubcommentCubit extends Cubit<ToggleAnswerSubcommentState> {
  ToggleAnswerSubcommentCubit() : super(ToggleAnswerSubcommentState.initial());

  void canAnswer() {
    final newState = state.copyWith(answerSubcomment: true);
    log('${newState.answerSubcomment}');
    emit(newState);
  }

  void notCanAnswer() {
    final newState = state.copyWith(answerSubcomment: false);
    emit(newState);
  }
}
