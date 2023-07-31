//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';

class FooterButtonsProfile2Widget extends StatelessWidget {
  final Function() onPreviousTap;
  final Function() onNextTap;
  const FooterButtonsProfile2Widget({
    Key? key,
    required this.onPreviousTap,
    required this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DanaTheme.paletteDarkBlue,
      padding: EdgeInsets.all(0),
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            color: DanaTheme.paletteFPink,
            transform: Matrix4.translationValues(0.0, -0.1, 0.0),
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/images/bg_unit_detail_footer.svg',
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: onPreviousTap,
                        child: Container(
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: DanaTheme.paletteWhite,
                              child: buildSvgImage('ic_previous.svg', 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: onNextTap,
                      child: Container(
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(180),
                          child: Container(
                            color: DanaTheme.paletteWhite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                        S
                                            .of(context)
                                            .screenInitialProfilePagesButtonNext,
                                        style: DanaTheme.textCta(
                                            DanaTheme.paletteDarkBlue))),
                                Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: buildSvgImage('ic_next.svg', 8))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
