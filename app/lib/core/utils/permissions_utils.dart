import 'dart:io';

import 'package:flutter/widgets.dart' show VoidCallback;
import 'package:permission_handler/permission_handler.dart';

enum PermissionHandler {
  camera,
  storage,
  notification,
}

class PermissionUtils {
  /** Request Methods */

  Future<void> validatePermission(
    VoidCallback enableEvent,
    PermissionHandler permission,
  ) async {
    if (permission == PermissionHandler.camera) {
      if (!await (_requestPermission(
        Permission.camera,
      ))) {
        return;
      }
      enableEvent();
    } else if (permission == PermissionHandler.storage) {
      if (!await (requestStorage())) {
        return;
      }

      enableEvent();
    } else if (permission == PermissionHandler.notification) {
      if (!await (requestNotification())) {
        return;
      }

      enableEvent();
    }
  }

  Future<bool> requestLocation() =>
      _requestPermission(Permission.locationWhenInUse);

  Future<bool> requestCamera() => _requestPermission(Permission.camera);

  Future<bool> requestStorage() => _requestPermission(
        Platform.isAndroid ? Permission.storage : Permission.photos,
      );
  Future<bool> requestNotification() => _requestPermission(
        Permission.notification,
      );

  /** Check Methods */

  Future<bool> isLocationAllowed() =>
      _isPermissionAllowed(Permission.locationWhenInUse);

  Future<bool> isCameraAllowed() => _isPermissionAllowed(Permission.camera);
  Future<bool> isNotificationAllowed() =>
      _isPermissionAllowed(Permission.notification);

  /** Others Methods */

  Future<void> openSettings() async {
    await openAppSettings();
  }

  /** Common Methods */

  Future<bool> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();

    if (status.isGranted || status.isLimited) {
      return true;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    return false;
  }

  Future<bool> _isPermissionAllowed(Permission permission) async {
    try {
      final status = await permission.status;

      return (status.isGranted || status.isLimited);
    } catch (e) {
      Exception(e);
    }

    return false;
  }
}
