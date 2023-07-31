part of 'comments_number_cubit.dart';

class CommentsNumberState {
  final int number;
  CommentsNumberState({
    required this.number,
  });
  factory CommentsNumberState.initial() {
    return CommentsNumberState(number: 4);
  }

  CommentsNumberState copyWith({int? number}) {
    return CommentsNumberState(
      number: number ?? this.number,
    );
  }
}
