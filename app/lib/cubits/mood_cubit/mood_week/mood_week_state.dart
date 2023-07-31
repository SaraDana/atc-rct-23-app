part of 'mood_week_cubit.dart';

class MoodWeekState {
  final int moodWeekNumber;
  final int moodMonthNumber;
  final int moodYearNumber;
  const MoodWeekState({
    required this.moodWeekNumber,
    required this.moodMonthNumber,
    required this.moodYearNumber,
  });

  factory MoodWeekState.initial() {
    return MoodWeekState(
      moodWeekNumber: DateTime.now().weekOfYear,
      moodMonthNumber: DateTime.now().month,
      moodYearNumber: DateTime.now().year,
    );
  }

  MoodWeekState copyWith({
    int? counter,
    int? month,
    int? year,
  }) {
    return MoodWeekState(
      moodWeekNumber: counter ?? this.moodWeekNumber,
      moodMonthNumber: month ?? this.moodMonthNumber,
      moodYearNumber: year ?? this.moodYearNumber,
    );
  }
}
