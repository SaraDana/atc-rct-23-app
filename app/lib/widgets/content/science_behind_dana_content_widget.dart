//IMPORTM EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';

class ScienceBehindDanaContentWidget extends StatelessWidget {
  const ScienceBehindDanaContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
              text: '', style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '', style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
        ],
      ),
    );
  }
}
