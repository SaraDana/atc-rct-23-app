part of 'toggle_answer_subcomment_cubit.dart';

class ToggleAnswerSubcommentState {
  final bool answerSubcomment;
  ToggleAnswerSubcommentState({
    required this.answerSubcomment,
  });
  factory ToggleAnswerSubcommentState.initial() {
    return ToggleAnswerSubcommentState(answerSubcomment: false);
  }

  ToggleAnswerSubcommentState copyWith({bool? answerSubcomment}) {
    return ToggleAnswerSubcommentState(
      answerSubcomment: answerSubcomment ?? this.answerSubcomment,
    );
  }
}
