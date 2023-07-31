// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map json) => QuestionModel(
      title: json['title'] as String?,
      innerQuestions: (json['innerQuestions'] as List<dynamic>?)
          ?.map((e) =>
              InnerQuestionModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      questionId: json['questionId'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      max: json['max'] as int?,
      min: json['min'] as int?,
      isOptional: json['isOptional'] as bool?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ActionModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      categoryInvestment: (json['categoryInvestment'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CategoryInvestment.fromJson(
                  Map<String, dynamic>.from(e as Map)))
          .toList(),
    )..shortTitle = json['shortTitle'] as String?;

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'shortTitle': instance.shortTitle,
      'innerQuestions':
          instance.innerQuestions?.map((e) => e.toJson()).toList(),
      'questionId': instance.questionId,
      'type': instance.type,
      'description': instance.description,
      'max': instance.max,
      'min': instance.min,
      'isOptional': instance.isOptional,
      'actions': instance.actions?.map((e) => e?.toJson()).toList(),
      'categoryInvestment':
          instance.categoryInvestment?.map((e) => e?.toJson()).toList(),
    };
