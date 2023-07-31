import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*Widget _buildFullscrenImage({String assetName = 'fullscreen.jpg'}) {
  return Image.asset(
    '$ASSETS_IMAGES/$assetName',
    fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  );
}*/

Widget buildImage(String assetName, [double width = 350]) {
  return Image.asset('$ASSETS_IMAGES/$assetName', width: width);
}

Widget buildSvgImage(
  String assetName, [
  double width = 350,
  BoxFit? fit,
]) {
  return SvgPicture.asset(
    '$ASSETS_IMAGES/$assetName',
    width: width,
    fit: fit ?? BoxFit.contain,
  );
}

Widget buildColoredSvgImage(String assetName, Color color,
    [double width = 350]) {
  return SvgPicture.asset('$ASSETS_IMAGES/$assetName',
      color: color, width: width);
}

Widget buildSvgIcon(String assetName, [double width = 15]) {
  return SvgPicture.asset('$ASSETS_IMAGES/$assetName', width: width);
}
