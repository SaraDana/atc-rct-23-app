import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/moodtracker.utils.dart';
import 'package:app/widgets/moodtracker/mood_select_date_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:week_of_year/week_of_year.dart';

class MoodGraphicWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    DanaTheme.paletteFPink,
    Colors.white,
  ];

  final bool showAvg = false;

  final List<UserMood> userMoods;

  MoodGraphicWidget({
    Key? key,
    required this.userMoods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              color: DanaTheme.bgCardColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 12, bottom: 12),
              child: Column(
                children: [
                  Expanded(
                    child: LineChart(
                      // showAvg
                      // ? MoodTrackerUtils().avgData(gradientColors)
                      _mainData(
                        gradientColors: gradientColors,
                        userMoods: userMoods,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData _mainData({
    required List<Color> gradientColors,
    required List<UserMood> userMoods,
  }) {
    List<FlSpot> trackingUserMoodsList = [];

    for (var i = 0; i < userMoods.length; i++) {
      trackingUserMoodsList.add(FlSpot(
        userMoods[i].at!.weekday.toDouble(),
        userMoods[i].rate!.toDouble(),
      ));
    }
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: DanaTheme.paletteGrey,
            strokeWidth: 0.5,
          );
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
        /* bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: MoodTrackerUtils().bottomTitleWidgets,
          ),
        ),*/
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: MoodTrackerUtils().leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          top: BorderSide(color: DanaTheme.bgCardColor, width: 1),
          bottom: BorderSide(color: const Color(0xff37434d), width: 1),
          left: BorderSide(color: const Color(0xff37434d), width: 1),
          right: BorderSide(color: DanaTheme.bgCardColor, width: 1),
        ),
      ),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: trackingUserMoodsList,
          isCurved: true,
          color: Color.fromRGBO(255, 161, 145, 1),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: trackingUserMoodsList.length <= 1 ? true : false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.8))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
