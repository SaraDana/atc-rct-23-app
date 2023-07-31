part of 'subcomments_number_cubit.dart';

class SubcommentsNumberState {
  final int number;
  SubcommentsNumberState({
    required this.number,
  });
  factory SubcommentsNumberState.initial() {
    return SubcommentsNumberState(number: 1);
  }

  SubcommentsNumberState copyWith({int? number}) {
    return SubcommentsNumberState(
      number: number ?? this.number,
    );
  }
}
