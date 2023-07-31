//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';

class MoodtrackerSectionDetailBoldWidget extends StatelessWidget {
  final double intraSectionMargin;
  final String text;
  const MoodtrackerSectionDetailBoldWidget({
    Key? key,
    required this.intraSectionMargin,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: intraSectionMargin),
      child: Text(
        text,
        style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
      ),
    );
  }
}
