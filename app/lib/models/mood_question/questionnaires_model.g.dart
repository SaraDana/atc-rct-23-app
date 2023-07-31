// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaires_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionnairesModel _$QuestionnairesModelFromJson(Map json) =>
    QuestionnairesModel(
      userQuestionnaireId: json['userQuestionnaireId'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) =>
              QuestionModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      statements: (json['statements'] as List<dynamic>?)
          ?.map((e) => QuestionStatementModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      redirectUrl: json['redirectUrl'] as String?,
    )
      ..questionnaireId = json['questionnaireId'] as String?
      ..isFinished = json['isFinished'] as bool?;

Map<String, dynamic> _$QuestionnairesModelToJson(
        QuestionnairesModel instance) =>
    <String, dynamic>{
      'questionnaireId': instance.questionnaireId,
      'userQuestionnaireId': instance.userQuestionnaireId,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
      'statements': instance.statements?.map((e) => e.toJson()).toList(),
      'redirectUrl': instance.redirectUrl,
      'isFinished': instance.isFinished,
    };
