import 'package:app/core/enums/questionare_enum.dart';
import 'package:app/models/mood_question/inner_question_statement_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/models/user_mood/user_mood_question_model.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_mood_state.freezed.dart';

@freezed
class UserMoodState with _$UserMoodState {
  const factory UserMoodState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default([]) List<UserMood> userMoods,
    String? errorMessage,
    QuestionnairesModel? questionnaire,
    UserMood? userMoodToday,
    @Default(-1) int emotion,
    int? moodTrackerTutorialSeenCount,
    @Default('') String moodTextToday,
    QuestionareEnum? questionnareEnum,
    int? emotionSelected,
  }) = _UserMoodState;
}
