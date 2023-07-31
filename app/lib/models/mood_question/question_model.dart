import 'package:app/models/category_investment_model.dart';
import 'package:app/models/mood_question/action_model.dart';
import 'package:app/models/mood_question/inner_question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class QuestionModel {
  String? title;
  String? shortTitle;
  List<InnerQuestionModel>? innerQuestions;
  String? questionId;
  String? type;
  String? description;
  int? max;
  int? min;
  bool? isOptional;
  List<ActionModel?>? actions;
  List<CategoryInvestment?>? categoryInvestment;
  QuestionModel({
    this.title,
    this.innerQuestions,
    this.questionId,
    this.type,
    this.description,
    this.max,
    this.min,
    this.isOptional,
    this.actions,
    this.categoryInvestment,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
