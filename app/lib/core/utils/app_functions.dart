import 'dart:io';

import 'package:app/config/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class AppFunctions {
  static Future<void> onOpenStorePressed() async {
    if (Platform.isAndroid) {
      await launchUrlString(ANDROID_STORE_URL);
    } else if (Platform.isIOS) {
      await launchUrlString(IOS_STORE_URL);
    }
  }
}
