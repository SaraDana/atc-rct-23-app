// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      creationDate: (json['creation_date'] as num).toDouble(),
      updateDate: (json['update_date'] as num).toDouble(),
      message: json['message'] as String,
      url: json['url'] as String,
      id: json['id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      read: json['is_read'] as bool,
      userName: json['notification_responsible_user_name'] as String,
      multipleUsersNotification: json['is_multiple_users_notification'] as bool,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'creation_date': instance.creationDate,
      'update_date': instance.updateDate,
      'message': instance.message,
      'url': instance.url,
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'is_read': instance.read,
      'notification_responsible_user_name': instance.userName,
      'is_multiple_users_notification': instance.multipleUsersNotification,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.LIKE: 'LIKE',
  NotificationType.COMMENT: 'COMMENT',
};
