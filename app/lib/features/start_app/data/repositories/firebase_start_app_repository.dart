import 'dart:async';

import 'package:app/features/start_app/domain/repository/start_app_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseStartAppRepository extends StartAppRepository {
  final StreamController<User?> _userSubscription =
      StreamController<User?>.broadcast();
  @override
  bool getUserLogged() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  bool isFirstInit() {
    return false;
    // return localStorageService.isFirstInit();
  }

  @override
  StreamController<User?> user() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _userSubscription.add(user);
    });

    return _userSubscription;
  }

  //
  // @override

}
