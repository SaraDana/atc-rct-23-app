//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/account/onboarding_profile_body_widget.dart';
import 'package:app/widgets/account/onboarding_profile_image_widget.dart';

class InitialProfilePageOnBoarding extends StatefulWidget {
  @override
  _InitialProfilePageOnBoardingState createState() =>
      _InitialProfilePageOnBoardingState();
}

class _InitialProfilePageOnBoardingState
    extends State<InitialProfilePageOnBoarding> {
  dynamic widgetNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteDarkBlue,
      body: Container(
        color: DanaTheme.paletteDarkBlue,
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 28,
              child: OnBoardingProfileImageWidget(),
            ),
            Expanded(
              flex: 22,
              child: OnboardinProfileBodyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
