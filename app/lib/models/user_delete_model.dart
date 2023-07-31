import 'package:json_annotation/json_annotation.dart';

part 'user_delete_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserDeleteModel {
  final dynamic requestDate;
  final String? userId;

  UserDeleteModel({this.requestDate, this.userId});

  factory UserDeleteModel.fromJson(Map<String, dynamic> json) =>
      _$UserDeleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDeleteModelToJson(this);
}
