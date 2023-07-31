import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class MoodtrackerSectionTitleWidget extends StatelessWidget {
  final double interSectionMargin;
  final String text;
  const MoodtrackerSectionTitleWidget({
    Key? key,
    required this.interSectionMargin,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: interSectionMargin),
      child: Text(
        text,
        style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
      ),
    );
  }
}
