part of 'change_page_cubit.dart';

class ChangePageState {
  final int index;
  const ChangePageState({required this.index});

  factory ChangePageState.initial() {
    return const ChangePageState(index: 0);
  }

  ChangePageState copyWith({
    int? index,
  }) {
    return ChangePageState(index: index ?? this.index);
  }
}
