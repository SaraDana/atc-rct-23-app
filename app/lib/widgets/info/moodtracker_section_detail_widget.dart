import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class MoodtrackerSectionDetailWidget extends StatelessWidget {
  final double intraSectionMargin;
  final String text;
  const MoodtrackerSectionDetailWidget({
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
        style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
      ),
    );
  }
}
