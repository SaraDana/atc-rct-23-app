import 'package:app/core/error/failures.dart';
import 'package:app/models/mood_question/inner_question_statement_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/models/show_questionnare_model.dart';
import 'package:dartz/dartz.dart';

abstract class QuestionRepository {
  Future<Either<Failure, QuestionnairesModel?>> startQuestionnare(
      String? userId, String? email, String countyCode,
      {String? questionnaireCode, String? questionnareId, String? reason});
  Future<Either<Failure, QuestionnairesModel>> answerQuestion(
      String? userQuestionnaireId, String? userId, String? email,
      {List<QuestionStatementModel?>? statement,
      required bool tryEndQuestionnaire});
  // get user mood for today.
  Future<Either<Failure, QuestionnairesModel?>> vitalityTrackerForTheDay(
      String? userId, String? email);
  Future<Either<Failure, QuestionnairesModel?>> endQuestionnaire(
      String? questionnaireCode, String? userId, String? email);

  Future<Either<Failure, ShowQuestionnareModel>> getQuestionnaireIdToShow(
      String? userId, String? email);
}
