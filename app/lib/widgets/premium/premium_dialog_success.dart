import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/l10n.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';
import '../../utils/screen_size.dart';

class PremiumDialogSuccess extends StatefulWidget {
  @override
  _PremiumDialogSuccessState createState() => _PremiumDialogSuccessState();
}

class _PremiumDialogSuccessState extends State<PremiumDialogSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: DanaTheme.paletteFPink,
            height: getScreenHeight(context),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 60,
                      child: Padding(
                          padding: EdgeInsets.all(DanaTheme.bodyPadding),
                          child: Column(children: [
                            Container(
                              height: 20,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: buildSvgImage('ic_close.svg', 22))
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    S
                                        .of(context)
                                        .widgetPremiumDialogSuccessTitle,
                                    style: DanaTheme.textMarketingHeadline(
                                        DanaTheme.paletteDarkBlue),
                                    textAlign: TextAlign.start)),
                            Container(
                              height: 20,
                            ),
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: S
                                      .of(context)
                                      .widgetPremiumDialogSuccessDescription1,
                                  style: DanaTheme.textBody(
                                      DanaTheme.paletteDarkBlue)),
                              TextSpan(
                                  text: S
                                      .of(context)
                                      .widgetPremiumDialogSuccessDescription2,
                                  style: DanaTheme.textBody(
                                      DanaTheme.paletteDarkBlue)),
                              TextSpan(
                                  text: ' ' +
                                      S
                                          .of(context)
                                          .widgetPremiumDialogSuccessDescription3,
                                  style: DanaTheme.textCta(
                                      DanaTheme.paletteDarkBlue))
                            ])),
                          ]))),
                  Expanded(
                      flex: 40,
                      child: Stack(children: [
                        SvgPicture.asset(
                            'assets/images/dana_premium_success.svg',
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 200, left: 20, right: 20),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(162),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 19,
                                          offset: Offset(0, 4),
                                          color: DanaTheme.paletteOrange
                                              .withOpacity(.2),
                                          spreadRadius: 0)
                                    ]),
                                width: double.infinity,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(120),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          DanaTheme.paletteOrange, // foreground
                                    ),
                                    child: Text(
                                        S.of(context).premiumDialogSuccessStart,
                                        style: DanaTheme.textCta(
                                            DanaTheme.paletteWhite)),
                                    onPressed: () => _onStartClick(),
                                  ),
                                )))
                      ]))
                ])));
  }

  _onStartClick() {
    Navigator.pop(context);
  }
}
