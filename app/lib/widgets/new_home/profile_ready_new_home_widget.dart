//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class ProfileReadyNewHomeWidget extends StatelessWidget {
  const ProfileReadyNewHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      margin: EdgeInsets.only(left: 10, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(162),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: Container(
          color: DanaTheme.lightGrayColor,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.check, color: DanaTheme.paletteOrange),
            Container(width: 10),
            Text(S.of(context).screenHomePageChipProfileReady,
                style: DanaTheme.textCta(DanaTheme.paletteOrange)),
            Container(width: 10),
          ]),
        ),
      ),
    );
  }
}
