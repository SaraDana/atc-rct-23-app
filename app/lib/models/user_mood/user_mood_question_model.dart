import 'package:app/models/user_mood/user_mood_question_badge_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_mood_question_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserMoodQuestion {
  String? question;
  int? id;
  List<UserMoodQuestionBadge>? badges;

  UserMoodQuestion({this.id, this.question,this.badges});

  factory UserMoodQuestion.fromJson(Map<String, dynamic> json) =>
      _$UserMoodQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$UserMoodQuestionToJson(this);
}
