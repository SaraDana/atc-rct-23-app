import 'package:flutter/material.dart';
import 'package:app/styles/dana_theme.dart';

class MoodtrackerSectionSubtitleWidget extends StatelessWidget {
  final double interSectionMargin;
  final String text;
  const MoodtrackerSectionSubtitleWidget({
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
        style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
      ),
    );
  }
}
