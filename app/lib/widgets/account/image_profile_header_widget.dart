import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageProfileHeader extends StatelessWidget {
  const ImageProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DanaTheme.paletteFPink,
      height: 50,
      width: double.infinity,
      child: SvgPicture.asset(
        'assets/images/bg_tracking_header.svg',
        height: 100,
        alignment: Alignment.topCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
