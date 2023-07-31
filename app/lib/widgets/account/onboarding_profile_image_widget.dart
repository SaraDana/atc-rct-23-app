//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';

class OnBoardingProfileImageWidget extends StatelessWidget {
  const OnBoardingProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      color: DanaTheme.paletteFBrown,
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: Container(height: 5, color: DanaTheme.paletteDarkBlue)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 7, child: Container(color: Colors.transparent)),
              Expanded(
                flex: 6,
                child: SizedBox(
                  child: Center(
                    child: SvgPicture.asset('assets/images/logo.svg',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(),
              ),
              Expanded(
                flex: 34,
                child: Container(
                  transform: Matrix4.translationValues(0.0, 1, 0.0),
                  child: SvgPicture.asset(
                      'assets/images/dana_onboarding_profile_test.svg',
                      width: getScreenWidth(context),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomLeft),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
