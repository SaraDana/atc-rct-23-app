import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inner_question_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class InnerQuestionModel {
  String? shortTitle;
  String? title;
  String? questionId;
  String? type;
  String? description;

  InnerQuestionModel(
      {this.shortTitle,
      this.title,
      this.questionId,
      this.type,
      this.description});

  factory InnerQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$InnerQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$InnerQuestionModelToJson(this);
}
