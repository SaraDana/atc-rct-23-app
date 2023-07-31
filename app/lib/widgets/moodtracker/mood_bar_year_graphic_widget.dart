import 'package:app/models/user_mood_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/moodtracker.utils.dart';
import 'package:app/widgets/moodtracker/mood_select_date_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodBarYearGraphicWidget extends StatelessWidget {
  final List<UserMood> userMoods;

  final int touchedIndex = -1;

  const MoodBarYearGraphicWidget({Key? key, required this.userMoods})
      : super(key: key);

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style =
        TextStyle(color: Color.fromRGBO(50, 38, 76, 0.8), fontSize: 14);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'E';
        break;
      case 1:
        text = 'F';
        break;
      case 2:
        text = 'M';
        break;
      case 3:
        text = 'A';
        break;
      case 4:
        text = 'M';
        break;
      case 5:
        text = 'J';
        break;
      case 6:
        text = 'J';
        break;
      case 7:
        text = 'A';
        break;
      case 8:
        text = 'S';
        break;
      case 9:
        text = 'O';
        break;
      case 10:
        text = 'N';
        break;
      case 11:
        text = 'D';
        break;

      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      child: Text(text, style: style),
      axisSide: meta.axisSide,
    );
  }

  BarChartGroupData generateGroup(
    BuildContext context,
    int x,
    int value1,
    int value2,
    int value3,
    int value4,
    int value5,
  ) {
    int sum = value1 + value2 + value3 + value4 + value5;

    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 31,
            color: Color(0xFFF0ECE4),
          ),
          color: isTouched ? DanaTheme.paletteOrange : DanaTheme.whiteColor,
          borderSide: isTouched
              ? BorderSide(color: DanaTheme.paletteOrange, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          toY: sum.toDouble(),
          width: MoodTrackerUtils().barWidthYearGraphic(context),
          borderRadius: BorderRadius.all(Radius.circular(6)),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value1.toDouble(),
              Color(0xffffECE9),
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1.toDouble(),
              value1.toDouble() + value2,
              const Color(0xffffD9D3),
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1.toDouble() + value2,
              value1.toDouble() + value2 + value3,
              const Color(0xffffC7BD),
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1.toDouble() + value2 + value3,
              value1.toDouble() + value2 + value3 + value4,
              const Color(0xffffB4A7),
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1.toDouble() + value2 + value3 + value4,
              value1.toDouble() + value2 + value3 + value4 + value5,
              const Color(0xffffA191),
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
           
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        color: DanaTheme.whiteColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, bottom: 30, top: 20),
                      child: Container(
                        width: 20,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/images/emoticon_${5.toString()}_unselected.svg',
                                height: 20,
                                fit: BoxFit.fitHeight,
                              ),
                              SvgPicture.asset(
                                'assets/images/emoticon_${4.toString()}_unselected.svg',
                                height: 20,
                                fit: BoxFit.fitHeight,
                              ),
                              SvgPicture.asset(
                                'assets/images/emoticon_${3.toString()}_unselected.svg',
                                height: 20,
                                fit: BoxFit.fitHeight,
                              ),
                              SvgPicture.asset(
                                'assets/images/emoticon_${2.toString()}_unselected.svg',
                                height: 20,
                                fit: BoxFit.fitHeight,
                              ),
                              SvgPicture.asset(
                                'assets/images/emoticon_${1.toString()}_unselected.svg',
                                height: 20,
                                fit: BoxFit.fitHeight,
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          borderData: FlBorderData(
                            show: false,
                          ),
                          gridData: FlGridData(show: false),
                          alignment: BarChartAlignment.center,
                          minY: 0,
                          groupsSpace: 4,
                          titlesData: FlTitlesData(
                            show: true,
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                reservedSize: 0,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 32,
                                getTitlesWidget: bottomTitles,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                getTitlesWidget:
                                    MoodTrackerUtils().getBarGraphicTitles,
                                interval: 5,
                                reservedSize: 0,
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                interval: 1,
                                reservedSize: 0,
                              ),
                            ),
                          ),
                          barGroups: MoodTrackerUtils()
                              .mainItemsYearGraphic(userMoods: userMoods)
                              .entries
                              .map((e) => generateGroup(
                                  context,
                                  e.key,
                                  e.value[0],
                                  e.value[1],
                                  e.value[2],
                                  e.value[3],
                                  e.value[4]))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
