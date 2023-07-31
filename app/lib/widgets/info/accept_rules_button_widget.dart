//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT LOCAL APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class AcceptRulesButtonWidget extends StatelessWidget {
  const AcceptRulesButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(162),
          boxShadow: [
            BoxShadow(
              blurRadius: 19,
              offset: Offset(0, 4),
              color: DanaTheme.paletteOrange.withOpacity(.2),
              spreadRadius: 0,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Container(
            color: DanaTheme.paletteOrange,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(S.of(context).pageCommunityRulesAccept,
                    style: DanaTheme.textCta(DanaTheme.paletteWhite)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
