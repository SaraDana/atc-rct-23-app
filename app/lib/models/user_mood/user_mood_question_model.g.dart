// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mood_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMoodQuestion _$UserMoodQuestionFromJson(Map json) => UserMoodQuestion(
      id: json['id'] as int?,
      question: json['question'] as String?,
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => UserMoodQuestionBadge.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$UserMoodQuestionToJson(UserMoodQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'id': instance.id,
      'badges': instance.badges?.map((e) => e.toJson()).toList(),
    };
