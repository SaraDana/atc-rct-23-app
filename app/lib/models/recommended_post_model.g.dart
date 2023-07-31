// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedPostModel _$RecommendedPostModelFromJson(Map json) =>
    RecommendedPostModel(
      publication: json['publication'] == null
          ? null
          : Publication.fromJson(
              Map<String, dynamic>.from(json['publication'] as Map)),
      day: json['day'] as int?,
    );

Map<String, dynamic> _$RecommendedPostModelToJson(
        RecommendedPostModel instance) =>
    <String, dynamic>{
      'publication': instance.publication?.toJson(),
      'day': instance.day,
    };
