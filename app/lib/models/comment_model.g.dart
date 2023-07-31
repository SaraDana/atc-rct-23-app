// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map json) => Comment(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String?,
      text: json['text'] as String?,
      date: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['date'], const TimestampConverter().fromJson),
      likedBy:
          (json['likedBy'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userName: json['userName'] as String? ?? '',
      userSpecialistRole: json['userSpecialistRole'] as String? ?? '',
      reportedBy: (json['reportedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'text': instance.text,
      'date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.date, const TimestampConverter().toJson),
      'likedBy': instance.likedBy,
      'userName': instance.userName,
      'userSpecialistRole': instance.userSpecialistRole,
      'reportedBy': instance.reportedBy,
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
