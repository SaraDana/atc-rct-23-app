import 'dart:async';

import 'package:app/features/start_app/domain/repository/start_app_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MockApiUserSessionRepository extends StartAppRepository {
  @override
  bool getUserLogged() {
    return true;
  }

  @override
  bool isFirstInit() {
    return true;
  }

  @override
  StreamController<User?> user() {
    // TODO: implement user
    throw UnimplementedError();
  }

  // @override
  // Future<AppVersionConfig?> checkVersion() async {
  //   return AppVersionConfig(
  //     isLatestVersion: true,
  //     needShowUpdate: false,
  //     isVersionNotAllowed: false,
  //   );
  // }
}
