import 'package:json_annotation/json_annotation.dart';

part 'question_statement_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class QuestionStatementModel {
  String? questionId;
  dynamic value;
  List<QuestionStatementModel>? innerStatements;

  QuestionStatementModel({
    this.questionId,
    this.value,
    this.innerStatements,
  });

  factory QuestionStatementModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionStatementModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionStatementModelToJson(this);
}
