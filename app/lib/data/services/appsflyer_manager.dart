import 'dart:io';

import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import '../../cubits/purchases/purchases_cubit.dart';
import '../../core/di/locator.dart';

const devKey = "jVbeQZXAvjxLXWfwY4HPnL";
const androidAppId = "rct-23.dana.app";
const iosAppId = "id1559706974";

class AppsFlyerManager {
  late AppsflyerSdk appsflyerSdk;

  void init() {
    Map appsFlyerOptions = {
      "afDevKey": devKey,
      "afAppId": Platform.isIOS ? iosAppId : androidAppId,
      "isDebug": true,
    };

    appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
    appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );
  }

  updateUserInfo(NewUserModel user) {
    if (user.id == null) return;
    appsflyerSdk.setCustomerUserId(user.id!);
    locator<PurchasesCubit>().updateUserAttribute('\$appsflyerId', user.id!);
  }

  sendAnalyticToAppsflyer(String eventName,
      {Map<String, dynamic>? properties}) {
    appsflyerSdk.logEvent(eventName, properties);
  }
}
