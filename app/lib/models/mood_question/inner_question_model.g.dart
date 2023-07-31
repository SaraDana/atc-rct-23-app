// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inner_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InnerQuestionModel _$InnerQuestionModelFromJson(Map json) => InnerQuestionModel(
      shortTitle: json['shortTitle'] as String?,
      title: json['title'] as String?,
      questionId: json['questionId'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$InnerQuestionModelToJson(InnerQuestionModel instance) =>
    <String, dynamic>{
      'shortTitle': instance.shortTitle,
      'title': instance.title,
      'questionId': instance.questionId,
      'type': instance.type,
      'description': instance.description,
    };
