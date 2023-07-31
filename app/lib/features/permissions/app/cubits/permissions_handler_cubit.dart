import 'package:app/core/utils/permissions_utils.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/data/services/push_notifications.dart';
import 'package:app/features/permissions/app/cubits/permissions_handler_state.dart';
import 'package:app/utils/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHandlerCubit extends Cubit<PermissionsHandlerState> {
  PermissionsHandlerCubit({
    required this.permissionUtils,
  }) : super(const PermissionsHandlerState());

  final PermissionUtils permissionUtils;

  Future<void> init() async {
    final isNotificationsAllowed =
        await permissionUtils.isNotificationAllowed();
    final isNotificationsAllowedLocal = PreferenceUtils.getEnableNotification();
    if (isNotificationsAllowedLocal == null) {
      await Permission.notification
          .request()
          .then((value) => changePermission(value.isGranted));
      return;
    }
    if (isNotificationsAllowedLocal == false) {
      changePermission(false);
    } else {
      changePermission(isNotificationsAllowed);
    }
  }

  void requestNotifications() async {
    await permissionUtils.requestNotification();
    init();
  }

  Future<void> changePermission(bool value) async {
    if (value != PreferenceUtils.getEnableNotification()) {
      await _checkIfNavigateToSettings(value);
      PreferenceUtils.setEnableNotification(value);
      await PushNotificationService.changePermission(value);
    }

    emit(
      state.copyWith(
        isNotificationsAllowed: value,
      ),
    );
  }

  Future<void> _checkIfNavigateToSettings(bool value) async {
    final isNotificationsAllowed =
        await permissionUtils.isNotificationAllowed();
    final isNotificationsAllowedLocal = PreferenceUtils.getEnableNotification();
    if (!isNotificationsAllowed &&
        isNotificationsAllowedLocal == false &&
        value == true) {
      _openSettings();
    }
  }

  void _openSettings() => permissionUtils.openSettings();
}
