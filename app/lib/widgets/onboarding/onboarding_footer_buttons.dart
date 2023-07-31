import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingFooterButtons extends StatelessWidget {
  final Function() onRegisterClick;
  final Function() onLoginClick;
  const OnBoardingFooterButtons({
    Key? key,
    required this.onRegisterClick,
    required this.onLoginClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var halfWidth = MediaQuery.of(context).size.width * 0.5;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DanaTheme.loginPadding),
      width: double.infinity,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('')),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onRegisterClick,
                    child: Center(
                      child: Text(
                        S.of(context).screenOnBoardingRegister,
                        style: DanaTheme.textCta(DanaTheme.paletteWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: DanaTheme.paletteWhite.withOpacity(.2),
            ),
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: onLoginClick,
              child: Container(
                width: halfWidth,
                child: Center(
                  child: Text(
                    S.of(context).screenOnBoardingLogin,
                    style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
