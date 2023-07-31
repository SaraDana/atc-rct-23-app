import 'package:firebase_analytics/firebase_analytics.dart';

import '../../features/user/domain/models/new_user_model.dart';

class FirebaseAnalyticsManager {
  static final FirebaseAnalytics _firebaseAnalytics =
      FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticNavigatorObserver() {
    return FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);
  }

  updateUserInfo(NewUserModel user) {
    _firebaseAnalytics.setUserProperty(name: 'userId', value: user.id);
  }

  void logLogin(String method) {
    _firebaseAnalytics.logLogin();
  }

  void logSignUp(String method) {
    _firebaseAnalytics.logSignUp(signUpMethod: method);
  }

  void logOnBoardingCompleted() {
    _firebaseAnalytics.logEvent(name: 'onboarding_completed');
  }
}
