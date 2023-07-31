// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Publication _$PublicationFromJson(Map json) => Publication(
      creatorId: json['creatorId'] as String?,
      id: json['id'] as String?,
      likedBy:
          (json['likedBy'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bookmarkedBy: (json['bookmarkedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publicationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['publicationDate'], const TimestampConverter().fromJson),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      socialSections: (json['socialSections'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      type: json['type'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      subcomments: (json['subcomments'] as List<dynamic>?)
          ?.map((e) => Subcomment.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      backgroundImage: json['backgroundImage'] as String? ?? '',
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          const [],
      percentages: (json['percentages'] as Map?)?.map(
            (k, e) => MapEntry(k as String, e as int),
          ) ??
          const {},
          commentsCount: json['cmsCommentCount'] as int?,
    );

Map<String, dynamic> _$PublicationToJson(Publication instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'id': instance.id,
      'likedBy': instance.likedBy,
      'bookmarkedBy': instance.bookmarkedBy,
      'publicationDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.publicationDate, const TimestampConverter().toJson),
      'tags': instance.tags,
      'socialSections': instance.socialSections,
      'title': instance.title,
      'type': instance.type,
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'subcomments': instance.subcomments?.map((e) => e.toJson()).toList(),
      'percentages': instance.percentages,
      'backgroundImage': instance.backgroundImage,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
