// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionStatementModel _$QuestionStatementModelFromJson(Map json) =>
    QuestionStatementModel(
      questionId: json['questionId'] as String?,
      value: json['value'],
      innerStatements: (json['innerStatements'] as List<dynamic>?)
          ?.map((e) => QuestionStatementModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$QuestionStatementModelToJson(
        QuestionStatementModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'value': instance.value,
      'innerStatements':
          instance.innerStatements?.map((e) => e.toJson()).toList(),
    };
