//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//IMPORT INTERN APP
import 'package:app/utils/screen_size.dart';

class HeaderBackgroundUnitDetailWidget extends StatelessWidget {
  const HeaderBackgroundUnitDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 70,
      width: getScreenWidth(context),
      child: SvgPicture.asset(
        'assets/images/bg_unit_detail_header.svg',
        alignment: Alignment.topCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
