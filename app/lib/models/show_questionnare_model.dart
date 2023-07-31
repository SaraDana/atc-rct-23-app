// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';


part 'show_questionnare_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ShowQuestionnareModel {
  String? questionnaireId;
  String? reason;

  ShowQuestionnareModel({
    this.questionnaireId,
    this.reason,
  });

  factory ShowQuestionnareModel.fromJson(Map<String, dynamic> json) =>
      _$ShowQuestionnareModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowQuestionnareModelToJson(this);
}
