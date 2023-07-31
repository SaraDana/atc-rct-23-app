import 'package:flutter/material.dart';

final double radiusXL = 40.0;

class AppBoxDecoration {
  static BoxDecoration topBorderRounded = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radiusXL),
      topRight: Radius.circular(radiusXL),
    ),
  );
}
