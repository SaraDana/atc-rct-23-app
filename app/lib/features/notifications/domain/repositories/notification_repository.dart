import 'package:app/features/notifications/domain/models/notification.dart';

abstract class NotificationRepository {
  Future< List<NotificationModel>> getNotifications({int limit = 15, int offset = 0});
  Future< void> markNotificationsAsRead();
  Future<int> totalNotifications();
}