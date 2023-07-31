part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default([]) List<NotificationModel> notifications,
    @Default(false) bool hasReachedMax,
    @Default(0)  int numberUnread,
  }) = _Initial;
}
