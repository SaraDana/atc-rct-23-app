part of 'question_new_home_cubit.dart';

class QuestionNewHomeState {
  final bool initialProfile;
  final bool showMoodQuestion;
  final bool showProfileQuestion;
  const QuestionNewHomeState({
    required this.initialProfile,
    required this.showMoodQuestion,
    required this.showProfileQuestion,
  });

  factory QuestionNewHomeState.initial() {
    return QuestionNewHomeState(
      initialProfile: true,
      showMoodQuestion: false,
      showProfileQuestion: true,
    );
  }

  QuestionNewHomeState copyWith(
      {bool? initialProfile,
      bool? showMoodQuestion,
      bool? showProfileQuestion}) {
    return QuestionNewHomeState(
      initialProfile: initialProfile ?? this.initialProfile,
      showMoodQuestion: showMoodQuestion ?? this.showMoodQuestion,
      showProfileQuestion: showProfileQuestion ?? this.showProfileQuestion,
    );
  }
}
