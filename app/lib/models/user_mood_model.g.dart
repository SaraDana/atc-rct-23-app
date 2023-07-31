// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMood _$UserMoodFromJson(Map json) => UserMood(
      id: json['id'] as String?,
      rate: json['rate'] as int?,
      comment: json['comment'] as String?,
      at: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$UserMoodToJson(UserMood instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'comment': instance.comment,
      'at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.at, const TimestampConverter().toJson),
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
