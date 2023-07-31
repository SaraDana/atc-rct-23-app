import 'dart:async';

import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/features/permissions/app/cubits/permissions_handler_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;

  const LifeCycleManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  DateTime _startTime = DateTime.now();
  int totalTimeInSeconds = 0;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      await calculateElapsedTime(_startTime);
      await eventOfInterestHappened();
    }

    if (state == AppLifecycleState.resumed) {
      setState(() {
        _startTime = DateTime.now();
      });
      locator<PermissionsHandlerCubit>().init();
      return;
    }
    super.didChangeAppLifecycleState(state);
  }

  eventOfInterestHappened() async {
    if (FirebaseAuth.instance.currentUser != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt("numberOfSeconds", totalTimeInSeconds);
    }
  }

  calculateElapsedTime(DateTime startedTime) {
    setState(() {
      totalTimeInSeconds =
          totalTimeInSeconds + DateTime.now().difference(startedTime).inSeconds;
    });
  }

  void initialize() {
    if (!isInitialized) {
      eventOfInterestHappenedStarted();
      isInitialized = true;
    }
  }

  void eventOfInterestHappenedStarted() async {
    if (FirebaseAuth.instance.currentUser != null) {
      //started event
      await locator<InterestedEventCubit>()
          .eventOfInterestHappened(EventOfInterestedType.START_APP_SESSION, {});

      // timestamp
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? totalTimeInSeconds = await prefs.getInt("numberOfSeconds");
      if (totalTimeInSeconds != null) {
        await locator<InterestedEventCubit>().eventOfInterestHappened(
            EventOfInterestedType.FINISHED_APP_SESSION, {
          "numberOfSeconds": totalTimeInSeconds.toString(),
        });

        prefs.remove("numberOfSeconds");
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
