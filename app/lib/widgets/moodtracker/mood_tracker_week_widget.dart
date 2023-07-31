import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:flutter/material.dart';

// !IMPORTANT this class does nothing right now
// when this is implemented, the initials for the week days should be localized

class MoodTrackerWeekWidget extends StatefulWidget {
  @override
  _MoodTrackerWeekWidgetState createState() => _MoodTrackerWeekWidgetState();
}

class _MoodTrackerWeekWidgetState extends State<MoodTrackerWeekWidget> {
  var todayDate = DateTime.now();
  var weekDates = [7];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(S.of(context).widgetMoodTrackerWeekTitle, style: DanaTheme.title2),
      Text(S.of(context).widgetMoodTrackerWeekSubtitle,
          style: DanaTheme.subtitle2),
      Card(
          elevation: DanaTheme.cardElevation,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DanaTheme.cardBorderRadius),
          ),
          child: Container(
              padding: EdgeInsets.all(16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('L'),
                    buildSvgImage('emoticon_1.svg', 30)
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('M'),
                    buildSvgImage('emoticon_1.svg', 30)
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('X'),
                    buildSvgImage('emoticon_empty.svg', 30)
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('J'),
                    buildSvgImage('emoticon_1.svg', 30)
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('V'),
                    buildSvgImage('emoticon_5.svg', 30)
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('S'),
                    buildSvgImage('emoticon_5.svg', 30)
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(children: [
                    Text('D'),
                    buildSvgImage('emoticon_empty.svg', 30)
                  ]),
                ),
              ])))
    ]);
  }
}
