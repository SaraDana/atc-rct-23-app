import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:flutter/material.dart';

class MoodTodaySuccessWidget extends StatefulWidget {
  @override
  _MoodTodaySuccessWidgetState createState() => _MoodTodaySuccessWidgetState();
}

class _MoodTodaySuccessWidgetState extends State<MoodTodaySuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: DanaTheme.cardElevation,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DanaTheme.cardBorderRadius),
        ),
        child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(children: <Widget>[
              Expanded(
                  flex: 2,
                  child: buildSvgImage('ic_mood_question_success.svg', 40)),
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          child: Text(S.of(context).homePageMoodTodaySuccess,
                              style: DanaTheme.bodyText1))
                    ],
                  ))
            ])));
  }
}
