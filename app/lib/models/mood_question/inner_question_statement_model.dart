import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inner_question_statement_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class InnerQuestionStatementModel {
  String? questionId;
  bool? value;
  List<QuestionStatementModel>? innerStatements;

  InnerQuestionStatementModel({
    this.questionId,
    this.value,
    this.innerStatements,
  });

  factory InnerQuestionStatementModel.fromJson(Map<String, dynamic> json) =>
      _$InnerQuestionStatementModelFromJson(json);

  Map<String, dynamic> toJson() => _$InnerQuestionStatementModelToJson(this);
}
