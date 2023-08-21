import 'dart:developer';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/features/notifications/app/cubits/notification_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/utils/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../core/di/locator.dart';

class PushNotificationService {
  // Platform messages are asynchronous, so we initialize in an async method.
  static Future<void> init() async {
    // if (!mounted) return;

    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId('2114cbee-c07b-4cd0-a8c4-ea0a240aefab');
    OneSignal.shared.setLaunchURLsInApp(false);
    // OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print(
          "Received notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
      _handleNotificationReceived(event.notification);
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      locator<DeeplinkCubit>().openLink(
          deeplink: Uri.parse(result.notification.additionalData?["link"]));

      print(
          "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
      print('user gets registered with OneSignal and gets a user ID');
      var onesignalUserId = changes.to.userId;
      shareOneSignalUserIdWithAnalytics(onesignalUserId);
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges emailChanges) {
      // will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
      print('will be called whenever then user\'s email subscription changes');
    });

    var status = await OneSignal.shared.getDeviceState();
    shareOneSignalUserIdWithAnalytics(status?.userId);
  }

  static void shareOneSignalUserIdWithAnalytics(String? onesignalUserId) {
    DanaAnalyticsService.setExternalId("\$onesignal_user_id", onesignalUserId);
    if (onesignalUserId != null) {
      locator<PurchasesCubit>()
          .updateUserAttribute('\$onesignalId', onesignalUserId);
      locator<InitialProfileCubit>()
          .updateOneSignalId(oneSignalId: onesignalUserId);
    }
  }

  // For each of the above functions, you can also pass in a
  // reference to a function as well:
  static void _handleNotificationReceived(OSNotification notification) {
    print('_handleNotificationReceived -> $notification');
    if (notification.additionalData?["increments_badge_count"] == true) {
      locator<NotificationCubit>().incrementNotificationNumber();
    }
  }

  static Future<void> changePermission(bool enable) async {
    if (enable) {
      await OneSignal.shared.disablePush(false);
    } else {
      OneSignal.shared.disablePush(true);
    }
  }

  static void updateUserInfo(PushNotificationUserInfo user) {
    if(user.name != null) {
      OneSignal.shared.sendTag('danaUserName', user.name);
    }
    OneSignal.shared.setExternalUserId(user.userId).then((results) {
      //shareUserIdWithAnalytics(userId);
    }).catchError((error) {
      log(error.toString());
    });
  }
}

class PushNotificationUserInfo {
  String? name;
  late String userId;

  PushNotificationUserInfo(String userId, String? name){
    this.name = name;
    this.userId = userId;
  }
}
