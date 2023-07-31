// Copyright 2021 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'navigation_analytics_tracker.dart';

typedef ScreenNameExtractor = String? Function(RouteSettings settings);

String? defaultNameExtractor(RouteSettings settings) => settings.name;

typedef RouteFilter = bool Function(Route<dynamic>? route);

bool defaultRouteFilter(Route<dynamic>? route) => route is PageRoute;

class DanaRouteObserver extends NavigatorObserver {

  DanaRouteObserver({
    this.nameExtractor = defaultNameExtractor,
    this.routeFilter = defaultRouteFilter,
    Function(PlatformException error)? onError,
  }) : _onError = onError;

  final NavigationAnalyticsTracker analyticsTracker = new NavigationAnalyticsTracker();
  final ScreenNameExtractor nameExtractor;
  final RouteFilter routeFilter;
  final void Function(PlatformException error)? _onError;

  void _sendScreenView(Route<dynamic> route) {
    final String? screenName = nameExtractor(route.settings);
    if(route.settings.arguments != null){
      final Map<String,String> extra = route.settings.arguments as Map<String,String>;
      if (screenName != null) {
        NavigationAnalyticsTracker.trackNavigation(screenName, extra);
      }
    }

  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    //if (routeFilter(route)) {
      _sendScreenView(route);
    //}
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
    //&& routeFilter(newRoute)) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null &&
        routeFilter(previousRoute) &&
        routeFilter(route)) {
      //_sendScreenView(previousRoute);
    }
  }
}
