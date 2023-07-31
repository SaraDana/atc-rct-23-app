import 'package:app/core/di/locator.dart';
import 'package:app/cubits/category_investment/category_investment_cubit.dart';
import 'package:app/cubits/category_investment/category_investment_state.dart';
import 'package:app/features/auth/app/cubits/recover_password/recover_password_state.dart';
import 'package:app/models/category_investment_model.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/moodtracker.utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodBarVinculosGraphicWidget extends StatefulWidget {
  final List<UserMood> userMoods;
  const MoodBarVinculosGraphicWidget({Key? key, required this.userMoods})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MoodBarGraphicWidgetState();
}

class MoodBarGraphicWidgetState extends State<MoodBarVinculosGraphicWidget> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryInvestmentCubit, CategoryInvestmentState>(
      bloc: locator<CategoryInvestmentCubit>(),
      builder: (context, state) {
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
                          child: state.categoryInvestmentEnum ==
                                  CategoryInvestmentEnum.Loading
                              ? Center(
                                  child: const CircularProgressIndicator(
                                    color: DanaTheme.paletteFOrange,
                                  ),
                                )
                              : BarChart(
                                  mainBarData(
                                      categoryInvestment:
                                          state.categoryInvestmentList,
                                      userMoods: widget.userMoods),
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
      },
    );

    ;
  }

  BarChartData mainBarData(
      {required List<CategoryInvestment> categoryInvestment,
      required List<UserMood> userMoods}) {
    return BarChartData(
      maxY: 100,
      barTouchData: BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
            fitInsideHorizontally: true,
            fitInsideVertically: true,
            tooltipBgColor: DanaTheme.paletteDarkBlue,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '',
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
            getTitlesWidget: (value, meta) {
              return MoodTrackerUtils().getBarGraphicVinculosTitles(value, meta,
                  categoryInvestment: categoryInvestment);
            },
            reservedSize:80.h,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 20,
            showTitles: true,
            reservedSize: 25,
            getTitlesWidget: MoodTrackerUtils().getBarGraphicVinculosLeftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
              width: 1, color: DanaTheme.paletteDarkBlue.withOpacity(.2)),
          left: BorderSide(
              width: 1, color: DanaTheme.paletteDarkBlue.withOpacity(.2)),
        ),
      ),
      barGroups: MoodTrackerUtils().showingBarGraphicGroups(
        touchedIndex: touchedIndex,
        categoryInvestment: categoryInvestment,
      ),
      gridData: FlGridData(
          show: true, drawHorizontalLine: true, drawVerticalLine: false),
    );
  }
}
