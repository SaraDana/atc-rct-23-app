import 'package:flutter/material.dart';

getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getScreenWidthWithPadding(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var padding = MediaQuery.of(context).padding;
  return screenWidth - padding.top - padding.bottom;
}

getScreenHeightWithPadding(BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).padding;
  return screenHeight - padding.top - padding.bottom;
}
