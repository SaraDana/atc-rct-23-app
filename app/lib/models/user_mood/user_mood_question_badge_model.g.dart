// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mood_question_badge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMoodQuestionBadge _$UserMoodQuestionBadgeFromJson(Map json) =>
    UserMoodQuestionBadge(
      id: json['id'] as int?,
      title: json['title'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$UserMoodQuestionBadgeToJson(
        UserMoodQuestionBadge instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'isSelected': instance.isSelected,
    };
