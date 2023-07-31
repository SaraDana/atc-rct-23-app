part of 'change_comment_cubit.dart';

class ChangeCommentState {
  final Comment comment;
  ChangeCommentState({
    required this.comment,
  });
  factory ChangeCommentState.initial() {
    return ChangeCommentState(comment: Comment());
  }

  ChangeCommentState copyWith({Comment? comment}) {
    return ChangeCommentState(
      comment: comment ?? this.comment,
    );
  }
}
