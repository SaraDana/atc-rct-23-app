import 'package:app/models/mood_question/inner_question_statement_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questionnaires_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class QuestionnairesModel {
  String? questionnaireId;
  String? userQuestionnaireId;
  List<QuestionModel>? questions;
  List<QuestionStatementModel>? statements;
  String? redirectUrl;
  bool? isFinished;

  QuestionnairesModel(
      {this.userQuestionnaireId, this.questions, this.statements,this.redirectUrl});
  factory QuestionnairesModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionnairesModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnairesModelToJson(this);


}
