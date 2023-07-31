part of 'complete_comment_cubit.dart';

class CompleteCommentState {
  final bool showCompleteComment;
  CompleteCommentState({
    required this.showCompleteComment,
  });
  factory CompleteCommentState.initial() {
    return CompleteCommentState(showCompleteComment: false);
  }

  CompleteCommentState copyWith({bool? showCompleteComment}) {
    return CompleteCommentState(
      showCompleteComment: showCompleteComment ?? this.showCompleteComment,
    );
  }
}
