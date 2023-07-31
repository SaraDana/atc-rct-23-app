// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcomment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subcomment _$SubcommentFromJson(Map json) => Subcomment(
      id: json['id'] as String?,
      idComment: json['idComment'] as String?,
      comment: json['comment'] == null
          ? null
          : Comment.fromJson(Map<String, dynamic>.from(json['comment'] as Map)),
    );

Map<String, dynamic> _$SubcommentToJson(Subcomment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idComment': instance.idComment,
      'comment': instance.comment?.toJson(),
    };
