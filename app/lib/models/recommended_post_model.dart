import 'package:app/models/publication_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'recommended_post_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class RecommendedPostModel {
  Publication? publication;
  int? day;
  RecommendedPostModel({
    this.publication,
    this.day,
  });

  factory RecommendedPostModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedPostModelToJson(this);
}
