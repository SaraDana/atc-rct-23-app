part of 'toggle_show_answer_cubit.dart';

class ToggleShowAnswerState {
  final bool showAnswer;

  ToggleShowAnswerState({
    required this.showAnswer,
  });

  factory ToggleShowAnswerState.initial() {
    return ToggleShowAnswerState(showAnswer: false);
  }

  ToggleShowAnswerState copyWith({bool? showAnswer}) {
    return ToggleShowAnswerState(
      showAnswer: showAnswer ?? this.showAnswer,
    );
  }
}
