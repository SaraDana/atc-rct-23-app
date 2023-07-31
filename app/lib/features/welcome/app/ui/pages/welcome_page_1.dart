//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//IMPORT LOCAL APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/styles/styles.dart';
import 'package:app/utils/screen_size.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DanaTheme.paletteDarkBlue,
      width: getScreenWidth(context),
      child: Column(
        children: [
          Expanded(
            flex: 20,
            child: Stack(
              children: [
                Container(color: DanaTheme.paletteFBrown),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 5,
                    color: DanaTheme.paletteDarkBlue,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(height: 0),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(height: 0),
                    ),
                    Expanded(
                      flex: 38,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, 0.25, 0.0),
                        child: SvgPicture.asset(
                          'assets/images/dana_onboarding_page_1.svg',
                          width: getScreenWidth(context),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              S.of(context).screenOnBoarding1Title,
              textAlign: TextAlign.center,
              style: kTitleStyleOnboarding,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(height: 10),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(S.of(context).screenOnBoarding1Description,
                  style: kBodyStyleOnboarding, textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}
