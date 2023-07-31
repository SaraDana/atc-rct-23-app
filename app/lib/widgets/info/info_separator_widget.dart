//IMPORT EXTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoSeparatorWidget extends StatelessWidget {
  final double height;
  const InfoSeparatorWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      width: double.infinity,
      child: SvgPicture.asset(
        'assets/images/bg_tracking_header_inverted.svg',
        color: DanaTheme.paletteFPink,
        height: 100,
        alignment: Alignment.topCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
