import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/dana_theme.dart';

class SocialPinWidget extends StatelessWidget {
  const SocialPinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xCFFFFFFF),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/ic_pin.svg', width: 12),
          SizedBox(width: 6),
          Text(
            'Pineado',
            style: DanaTheme.textWheelNumber(DanaTheme.paletteDarkBlue),
          ),
        ],
      ),
    );
  }
}
