import 'package:json_annotation/json_annotation.dart';

part 'recommended_program_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class RecommendedProgramModel {
  String? programPath;
  String? programId;
  DateTime? timestamp;

  RecommendedProgramModel({
    this.programPath,
    this.programId,
    this.timestamp,
  });

  factory RecommendedProgramModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedProgramModelToJson(this);
}
