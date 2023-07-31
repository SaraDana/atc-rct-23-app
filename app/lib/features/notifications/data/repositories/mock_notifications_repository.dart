import 'package:app/features/notifications/domain/enums/notification_type.dart';
import 'package:app/features/notifications/domain/models/notification.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';

class MockNotificationsRepository implements NotificationRepository {
  @override
  Future<List<NotificationModel>> getNotifications(
      {int limit = 15, int offset = 0})  async {
    final NotificationModel yesterday = NotificationModel(
      creationDate: 1677655357,
      updateDate: 1620000000,
      message: 'A Lucía de Pedro le gustó tu menasje: “sería una maravilla estar...',
      url: 'https://www.google.com',
      type: NotificationType.LIKE,
      read: false,
      userName: 'Jose Luis',
      multipleUsersNotification: true,
      id: '1'
    );
    final NotificationModel today = NotificationModel(
      creationDate: 1677741757,
      updateDate: 1620000000,
      message: 'A Lucía de Pedro le gustó tu menasje: “sería una maravilla estar...',
      url: 'https://www.google.com',
      type: NotificationType.LIKE,
      read: false,
      userName: 'Lucía de Pedro',
      multipleUsersNotification: false,
        id: '1'

    );
    final NotificationModel old = NotificationModel(
      creationDate: 1677482557,
      updateDate: 1620000000,
      message: 'A Lucía de Pedro le gustó tu menasje: “sería una maravilla estar...',
      url: 'https://www.google.com',
      type: NotificationType.LIKE,
      read: false,
      userName: 'Antonio',
      multipleUsersNotification: false,
        id: '1'

    );
    final List<NotificationModel> list = [


    ];
    for(int i = 0; i < 35; i++) {
      list.add(today);
      list.add(yesterday);
      list.add(old);
    }

    await Future.delayed(Duration(seconds: 0));
    return Future.value(list.sublist(offset, offset + limit));

  }

  @override
  Future<void> markNotificationsAsRead() {
    // TODO: implement markNotificationsAsRead
    throw UnimplementedError();
  }

  @override
  Future<int> totalNotifications() async {
    return  100;
  }
}
