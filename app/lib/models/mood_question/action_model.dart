import 'package:json_annotation/json_annotation.dart';

part 'action_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ActionModel {
  String? id;
  String? title;
  String? type;
  String? relevance;
  String? extraData;

  ActionModel({this.id, this.title, this.type, this.relevance,this.extraData});

  factory ActionModel.fromJson(Map<String, dynamic> json) =>
      _$ActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActionModelToJson(this);
}
