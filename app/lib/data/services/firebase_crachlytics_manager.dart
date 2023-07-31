import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashyticsManager {
  static final FirebaseCrashlytics _firebaseCrashlytics =
      FirebaseCrashlytics.instance;

  loginUnknownError(String message) {
    StackTrace stackTrace = StackTrace.fromString(message);
    _firebaseCrashlytics.recordError("Problem during login", stackTrace);
  }

  sendGenericError(String message){
    StackTrace stackTrace = StackTrace.fromString(message);
    _firebaseCrashlytics.recordError("Generic error", stackTrace);
  }
}
