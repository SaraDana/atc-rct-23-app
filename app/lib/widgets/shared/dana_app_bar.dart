import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DanaAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: DanaTheme.mediumPadding, bottom: DanaTheme.mediumPadding),
        child: AppBar(
          title: Center(
              child: SvgPicture.asset('assets/images/logo.svg',
                  height: 35, fit: BoxFit.cover)),
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          backgroundColor: DanaTheme.paletteWhite,
        ));
  }
}
