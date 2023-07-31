import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class MoodTodayQuestionWidget extends StatefulWidget {
  @override
  _MoodTodayQuestionWidgetState createState() =>
      _MoodTodayQuestionWidgetState();
}

class _MoodTodayQuestionWidgetState extends State<MoodTodayQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: DanaTheme.cardElevation,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DanaTheme.cardBorderRadius),
        ),
        child: Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Expanded(flex: 2, child: buildSvgImage('emotions.svg', 150)),
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(S.of(context).widgetMoodTodayQuestionTitle,
                          style: DanaTheme.title3),
                      Flexible(
                          child: Text(
                              S.of(context).widgetMoodTodayQuestionDescription,
                              style: DanaTheme.bodyText1))
                    ],
                  ))
            ])));
  }
}
