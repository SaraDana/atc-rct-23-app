import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_mood_question_badge_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserMoodQuestionBadge {
  String? title;
  int? id;
  bool isSelected;

  UserMoodQuestionBadge({this.id, this.title,this.isSelected = false});

  factory UserMoodQuestionBadge.fromJson(Map<String, dynamic> json) =>
      _$UserMoodQuestionBadgeFromJson(json);

  Map<String, dynamic> toJson() => _$UserMoodQuestionBadgeToJson(this);
}
