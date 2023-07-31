import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../models/banner_model.dart';
import '../models/program_model.dart';
import '../models/unit_bookmarked.dart';

StreamController<List<UnitWithImage?>?>? unitBookmarkController;
StreamController<CustomBanner?>? bannerStreamController;

double calculateProgramProgress(Program program, int userUnits) {
  if (program.unitsRefs != null && program.unitsRefs!.length > 0) {
    return userUnits * 1 / program.unitsRefs!.length;
  }
  return 0.toDouble();
}

final pageSize = 5;
dynamic lastDoc;

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
