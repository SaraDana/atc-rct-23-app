import 'package:flutter_bloc/flutter_bloc.dart';
part 'toggle_show_answer_state.dart';

class ToggleShowAnswerCubit extends Cubit<ToggleShowAnswerState> {
  ToggleShowAnswerCubit() : super(ToggleShowAnswerState.initial());

  void toggleAnswer() {
    if (state.showAnswer == true) {
      emit(state.copyWith(showAnswer: false));
    } else {
      emit(state.copyWith(showAnswer: true));
    }
  }
}
