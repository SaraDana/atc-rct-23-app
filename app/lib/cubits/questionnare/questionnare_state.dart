import 'package:app/core/enums/questionare_enum.dart';
import 'package:app/models/mood_question/inner_question_statement_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/models/user_mood/user_mood_question_model.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionnare_state.freezed.dart';

@freezed
class QuestionnareState with _$QuestionnareState {
  const factory QuestionnareState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default(false) bool saveButtonIsActive,
    @Default(false) bool questionnareComplated,
    String? errorMessage,
    QuestionnairesModel? questionnaire,
    List<QuestionStatementModel>? statements,
    QuestionareEnum? questionnareEnum,
  }) = _QuestionnareState;
}
