// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionModel _$ActionModelFromJson(Map json) => ActionModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      relevance: json['relevance'] as String?,
      extraData: json['extraData'] as String?,
    );

Map<String, dynamic> _$ActionModelToJson(ActionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'relevance': instance.relevance,
      'extraData': instance.extraData,
    };
