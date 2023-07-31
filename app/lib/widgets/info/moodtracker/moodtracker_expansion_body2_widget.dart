import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class MoodTrackerExpansionBody2 extends StatelessWidget {
  final double intraSectionMargin;
  final double listItemsMargin;
  const MoodTrackerExpansionBody2({
    Key? key,
    required this.intraSectionMargin,
    required this.listItemsMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
                  S.of(context).moodTrackerExpansionBody2Text,
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
            )),
      ],
    );
  }
}
