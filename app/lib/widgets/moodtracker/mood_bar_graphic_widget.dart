import 'package:app/models/user_mood_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/moodtracker.utils.dart';
import 'package:app/widgets/moodtracker/mood_select_date_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoodBarGraphicWidget extends StatefulWidget {
  final List<UserMood> userMoods;
  const MoodBarGraphicWidget({Key? key, required this.userMoods})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MoodBarGraphicWidgetState();
}

class MoodBarGraphicWidgetState extends State<MoodBarGraphicWidget> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        color: DanaTheme.whiteColor,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        mainBarData(userMoods: widget.userMoods),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartData mainBarData({required List<UserMood> userMoods}) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: DanaTheme.paletteDarkBlue,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String statusMood;
              switch (group.x.toInt()) {
                case 0:
                  statusMood = 'Fatal';
                  break;
                case 1:
                  statusMood = 'Triste';
                  break;
                case 2:
                  statusMood = 'Meh';
                  break;
                case 3:
                  statusMood = 'Bien';
                  break;
                case 4:
                  statusMood = 'Increíble';
                  break;

                default:
                  throw Error();
              }
              return BarTooltipItem(
                statusMood + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: DanaTheme.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: MoodTrackerUtils().getBarGraphicTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 5,
            showTitles: true,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: MoodTrackerUtils().showingBarGraphicGroupsForMonth(
        touchedIndex: touchedIndex,
        trackingUserMoodBarGraphic: userMoods,
      ),
      gridData: FlGridData(show: false),
    );
  }
}
