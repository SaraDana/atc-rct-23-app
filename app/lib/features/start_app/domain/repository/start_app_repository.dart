import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class StartAppRepository {
  bool isFirstInit();
  bool getUserLogged();
  StreamController<User?> user();
}
