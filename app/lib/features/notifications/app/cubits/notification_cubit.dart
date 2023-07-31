import 'package:app/core/enums/status_cubit.dart';
import 'package:app/features/notifications/domain/models/notification.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:app/utils/preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationCubit({
    required this.notificationRepository,
  }) : super(NotificationState()) {
    emit(state.copyWith(
        numberUnread: PreferenceUtils.getNumberOfNotifications()));
  }
  static const _limit = 15;

  Future<void> _getNotifications() async {
    if (state.hasReachedMax) return;
    try {
      final List<NotificationModel> list =
          await notificationRepository.getNotifications(
        offset: state.notifications.length,
        limit: _limit,
      );

      final hasReachedMax = list.length < _limit;
      final List<NotificationModel> updateList = [
        ...state.notifications,
        ...list
      ];
      updateList.sort((a, b) => b.creationDate.compareTo(a.creationDate));
      emit(state.copyWith(
        status: StatusCubit.SUCCESS,
        notifications: updateList,
        hasReachedMax: hasReachedMax,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: StatusCubit.ERROR,
      ));
    }
  }

  void refreshNotifications() {
    emit(state.copyWith(
      status: StatusCubit.LOADING,
      notifications: [],
      hasReachedMax: false,
    ));
    _getNotifications();
  }

  void fetchMoreNotifications() {
    markNotificationsAsRead();
    if (state.status != StatusCubit.SUCCESS) return;
    if (state.hasReachedMax) return;
    emit(state.copyWith(
      status: StatusCubit.LOADING,
    ));
    _getNotifications();
  }

  void getUnreadNotifications() async {
    final int numberUnread = await notificationRepository.totalNotifications();
    emit(state.copyWith(
      numberUnread: numberUnread,
    ));

    PreferenceUtils.setNotificationNumber(numberUnread);
  }

  void incrementNotificationNumber() {
    emit(state.copyWith(
      numberUnread: state.numberUnread + 1,
    ));
    PreferenceUtils.setNotificationNumber(state.numberUnread + 1);
  }

  void markNotificationsAsRead() async {
    await notificationRepository.markNotificationsAsRead();
    emit(state.copyWith(
      numberUnread: 0,
    ));
    PreferenceUtils.setNotificationNumber(0);
    FlutterAppBadger.removeBadge();
  }
}
