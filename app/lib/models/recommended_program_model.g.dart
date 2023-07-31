// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedProgramModel _$RecommendedProgramModelFromJson(Map json) =>
    RecommendedProgramModel(
      programPath: json['programPath'] as String?,
      programId: json['programId'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$RecommendedProgramModelToJson(
        RecommendedProgramModel instance) =>
    <String, dynamic>{
      'programPath': instance.programPath,
      'programId': instance.programId,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
