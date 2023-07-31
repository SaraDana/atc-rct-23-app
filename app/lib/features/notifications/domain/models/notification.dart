// ignore_for_file: invalid_annotation_target

import 'package:app/features/notifications/domain/enums/notification_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'creation_date') required double creationDate,
    @JsonKey(name: 'update_date') required double updateDate,
    required String message,
    required String url,
    required String id,
    required NotificationType type,
    @JsonKey(name: 'is_read') required bool read,
    @JsonKey(name: "notification_responsible_user_name")
        required String userName,
    @JsonKey(name: 'is_multiple_users_notification')
        required bool multipleUsersNotification,
  }) = _Notification;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
