//IMPORT EXTERN APP
import 'dart:async';
import 'dart:io';
import 'package:app/app.dart';
import 'package:app/core/utils/life_cycle_manager.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/features/permissions/app/cubits/permissions_handler_cubit.dart';
import 'package:app/models/purchases/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

//IMPORT INTERN APP
import 'package:app/data/services/dana_analytics_service.dart';
import 'models/unit_bookmarked.dart';
import 'core/di/locator.dart';
import 'data/services/push_notifications.dart';
import 'utils/globals.dart';
import 'utils/navigation.dart';
import 'utils/preferences.dart';
import 'utils/timeago_custom_messages.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    await PreferenceUtils.init();
    await DanaAnalyticsService.initAnalytics();

    await _initRevenue();
    setupLocator();
    NavigationUtils.init();
    locator<PurchasesCubit>();

    unitBookmarkController = StreamController<List<UnitWithImage?>>.broadcast();
    timeago.setLocaleMessages('es', TimeagoCustomMessages());
    timeago.setLocaleMessages('en', TimeagoCustomMessages());

    DanaAnalyticsService.trackOpenApp();
    await PushNotificationService.init();
    await locator<PermissionsHandlerCubit>().init();

    runApp(LifeCycleManager(child: MyApp()));
  }, (error, stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

_initRevenue() async {
  await Purchases.setDebugLogsEnabled(true);
  if (Platform.isIOS) {
    await Purchases.configure(PurchasesConfiguration(appleApiKey));
    return;
  }
  await Purchases.configure(PurchasesConfiguration(googleApiKey));
}
