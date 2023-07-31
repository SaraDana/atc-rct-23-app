import 'dart:async';
import 'package:app/config/constants.dart';

class NavigationUtils {
  // ignore: close_sinks
  static StreamController<UserNavigationEvents>? _events;

  // call this method from iniState() function of mainApp().
  static init() {
    _events = StreamController<UserNavigationEvents>.broadcast();
    return _events;
  }

  static StreamController? getStream() => _events;

  static close() {
    _events!.close();
  }
}
