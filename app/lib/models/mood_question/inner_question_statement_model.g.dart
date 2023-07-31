// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inner_question_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InnerQuestionStatementModel _$InnerQuestionStatementModelFromJson(Map json) =>
    InnerQuestionStatementModel(
      questionId: json['questionId'] as String?,
      value: json['value'] as bool?,
      innerStatements: (json['innerStatements'] as List<dynamic>?)
          ?.map((e) => QuestionStatementModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$InnerQuestionStatementModelToJson(
        InnerQuestionStatementModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'value': instance.value,
      'innerStatements':
          instance.innerStatements?.map((e) => e.toJson()).toList(),
    };
