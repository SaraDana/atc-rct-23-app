import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';

class AuthFooterWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String clickedText;
  const AuthFooterWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.clickedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      left: 0,
      child: Container(
        height: 200,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              transform: Matrix4.translationValues(0.0, 0.25, 0.0),
              width: getScreenWidth(context),
              color: DanaTheme.paletteFPink,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/images/bg_auth_footer.svg',
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: 80),
                color: Colors.transparent,
                width: double.infinity,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: text,
                          style: DanaTheme.textSmallTextBold(
                              DanaTheme.paletteDarkBlue),
                        ),
                        TextSpan(
                          text: clickedText,
                          style: DanaTheme.textSmallTextBold(
                              DanaTheme.paletteOrange,
                              underline: true),
                          recognizer: TapGestureRecognizer()..onTap = onTap,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
