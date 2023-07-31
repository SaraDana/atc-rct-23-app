//IMPORT EXTERN APP
import 'dart:math';

import 'package:app/models/category_investment_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

//IMPORT INTERN APP
import 'package:app/cubits/mood_cubit/mood_week/mood_week_cubit.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/models/user_mood_model.dart';

class MoodTrackerUtils {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('L', style: style);
        break;
      case 2:
        text = const Text('M', style: style);
        break;
      case 3:
        text = const Text('M', style: style);
        break;
      case 4:
        text = const Text('J', style: style);
        break;
      case 5:
        text = const Text('V', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      case 7:
        text = const Text('D', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    int number;
    switch (value.toInt()) {
      case 1:
        number = 1;

        break;
      case 2:
        number = 2;
        break;
      case 3:
        number = 3;
        break;
      case 4:
        number = 4;
        break;
      case 5:
        number = 5;
        break;
      default:
        return Container();
    }

    return SvgPicture.asset(
      'assets/images/emoticon_${number.toString()}_unselected.svg',
      // 'assets/images/emoticon_${widget.userMood.rate.toString()}_unselected.svg',
      height: 20,
      fit: BoxFit.fitHeight,
    );

    // Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget weekOfMonthMood(BuildContext context, {required int value}) {
    switch (value) {
      case 0:
        return textOfWeekMood(context,
            monthOfWeek: 'Enero', numberOfWeek: value);
      case 1:
      case 2:
      case 3:
      case 4:
        return textOfWeekMood(context,
            monthOfWeek: 'Enero', numberOfWeek: value);
      case 5:
      case 6:
      case 7:
      case 8:
        return textOfWeekMood(context,
            monthOfWeek: 'Febrero', numberOfWeek: value);
      case 9:
      case 10:
      case 11:
      case 12:
        return textOfWeekMood(context,
            monthOfWeek: 'Marzo', numberOfWeek: value);
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        return textOfWeekMood(context,
            monthOfWeek: 'Abril', numberOfWeek: value);
      case 18:
      case 19:
      case 20:
      case 21:
        return textOfWeekMood(context,
            monthOfWeek: 'Mayo', numberOfWeek: value);
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
        return textOfWeekMood(context,
            monthOfWeek: 'Junio', numberOfWeek: value);
      case 27:
      case 28:
      case 29:
      case 30:
        return textOfWeekMood(context,
            monthOfWeek: 'Julio', numberOfWeek: value);
      case 31:
      case 32:
      case 33:
      case 34:
        return textOfWeekMood(context,
            monthOfWeek: 'Agosto', numberOfWeek: value);
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        return textOfWeekMood(context,
            monthOfWeek: 'Septiembre', numberOfWeek: value);
      case 40:
      case 41:
      case 42:
      case 43:
        return textOfWeekMood(context,
            monthOfWeek: 'Octubre', numberOfWeek: value);
      case 44:
      case 45:
      case 46:
      case 47:

      case 48:
        return textOfWeekMood(context,
            monthOfWeek: 'Noviembre', numberOfWeek: value);
      case 49:
      case 50:
      case 51:
      case 52:
        return textOfWeekMood(context,
            monthOfWeek: 'Diciembre', numberOfWeek: value);
      case 53:
    }
    return Container();
  }

  Widget monthOfYearMood(BuildContext context, {required int value}) {
    switch (value) {
      case 0:
        return onlyMonth(monthOfYear: 'Diciembre');
      case 1:
        return onlyMonth(monthOfYear: 'Enero');
      case 2:
        return onlyMonth(monthOfYear: 'Febrero');
      case 3:
        return onlyMonth(monthOfYear: 'Marzo');
      case 4:
        return onlyMonth(monthOfYear: 'Abril');
      case 5:
        return onlyMonth(monthOfYear: 'Mayo');
      case 6:
        return onlyMonth(monthOfYear: 'Junio');
      case 7:
        return onlyMonth(monthOfYear: 'Julio');
      case 8:
        return onlyMonth(monthOfYear: 'Agosto');
      case 9:
        return onlyMonth(monthOfYear: 'Septiembre');
      case 10:
        return onlyMonth(monthOfYear: 'Octubre');
      case 11:
        return onlyMonth(monthOfYear: 'Noviembre');
      case 12:
        return onlyMonth(monthOfYear: 'Diciembre');
      case 13:
    }
    return Container();
  }

  Widget textOfWeekMood(BuildContext context,
      {required int numberOfWeek, required String monthOfWeek}) {
    return Text('Semana ' +
        numberOfWeek.toString() +
        ' - ' +
        monthOfWeek +
        ' - ' +
        context.read<MoodWeekCubit>().state.moodYearNumber.toString());
  }

  Widget textMonthOfYearMood(BuildContext context,
      {required String monthOfYear}) {
    return Text(monthOfYear +
        ' - ' +
        context.read<MoodWeekCubit>().state.moodYearNumber.toString());
  }

  Widget onlyMonth({required String monthOfYear}) {
    return Text(monthOfYear);
  }

  Widget onlyYear(BuildContext context) {
    return Text(context.read<MoodWeekCubit>().state.moodYearNumber.toString());
  }

  Widget numberMonthToSpanishText(BuildContext context,
      {required int month,
      required TextStyle style,
      required String otherText}) {
    switch (month) {
      case 1:
        return Text(
          "Enero" + otherText,
          style: style,
        );
      case 2:
        return Text(
          "Febrero" + otherText,
          style: style,
        );
      case 3:
        return Text(
          "Marzo" + otherText,
          style: style,
        );
      case 4:
        return Text(
          "Abril" + otherText,
          style: style,
        );
      case 5:
        return Text(
          "Mayo" + otherText,
          style: style,
        );
      case 6:
        return Text(
          "Junio" + otherText,
          style: style,
        );
      case 7:
        return Text(
          "Julio" + otherText,
          style: style,
        );
      case 8:
        return Text(
          "Agosto" + otherText,
          style: style,
        );
      case 9:
        return Text(
          "Septiembre" + otherText,
          style: style,
        );
      case 10:
        return Text(
          "Octubre" + otherText,
          style: style,
        );
      case 11:
        return Text(
          "Noviembre" + otherText,
          style: style,
        );
      case 12:
        return Text(
          "Diciembre" + otherText,
          style: style,
        );
      default:
        return Text("");
    }
  }

  Widget getBarGraphicTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = SvgPicture.asset(
          'assets/images/emoticon_${1.toString()}_color.svg',
          height: 20,
          fit: BoxFit.fitHeight,
        );
        break;
      case 1:
        text = SvgPicture.asset(
          'assets/images/emoticon_${2.toString()}_color.svg',
          height: 20,
          fit: BoxFit.fitHeight,
        );
        break;
      case 2:
        text = SvgPicture.asset(
          'assets/images/emoticon_${3.toString()}_color.svg',
          height: 20,
          fit: BoxFit.fitHeight,
        );
        break;
      case 3:
        text = SvgPicture.asset(
          'assets/images/emoticon_${4.toString()}_color.svg',
          height: 20,
          fit: BoxFit.fitHeight,
        );
        break;
      case 4:
        text = SvgPicture.asset(
          'assets/images/emoticon_${5.toString()}_color.svg',
          height: 20,
          fit: BoxFit.fitHeight,
        );
        break;

      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget getBarGraphicVinculosTitles(double value, TitleMeta meta,
      {required List<CategoryInvestment> categoryInvestment}) {
    String text =
        categoryInvestment[value.toInt()].category!.categoryName ?? "";
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12,
      child: Container(
        width: 50.w,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: DanaTheme.bannerTitle2.copyWith(fontSize: 11.sp),
        ),
      ),
    );
  }

  Widget getBarGraphicVinculosLeftTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.w400,
      fontSize: 8.sp,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text("${value.toInt()}% ", style: style),
    );
  }

  List<BarChartGroupData> showingBarGraphicGroups(
      {required int touchedIndex,
      required List<CategoryInvestment> categoryInvestment}) {
    return categoryInvestment.map((e) {
      return makeBarGraphicGroupData(
          categoryInvestment.indexOf(e), e.percentage ?? 0);
    }).toList();
  }

  List<BarChartGroupData> showingBarGraphicGroupsForMonth(
          {required int touchedIndex,
          required List<UserMood> trackingUserMoodBarGraphic}) =>
      List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeBarGraphicGroupDataForMonth(
              0,
              trackingUserMoodBarGraphic
                  .where((UserMood userMood) => userMood.rate == 1)
                  .toList()
                  .length
                  .toDouble(),
              isTouched: i == touchedIndex,
              barColor: Color.fromRGBO(255, 236, 233, 1),
            );
          case 1:
            return makeBarGraphicGroupDataForMonth(
              1,
              trackingUserMoodBarGraphic
                  .where((UserMood userMood) => userMood.rate == 2)
                  .toList()
                  .length
                  .toDouble(),
              isTouched: i == touchedIndex,
              barColor: Color.fromRGBO(255, 217, 211, 1),
            );
          case 2:
            return makeBarGraphicGroupDataForMonth(
              2,
              trackingUserMoodBarGraphic
                  .where((UserMood userMood) => userMood.rate == 3)
                  .toList()
                  .length
                  .toDouble(),
              isTouched: i == touchedIndex,
              barColor: Color.fromRGBO(255, 199, 189, 1),
            );
          case 3:
            return makeBarGraphicGroupDataForMonth(
              3,
              trackingUserMoodBarGraphic
                  .where((UserMood userMood) => userMood.rate == 4)
                  .toList()
                  .length
                  .toDouble(),
              isTouched: i == touchedIndex,
              barColor: Color.fromRGBO(255, 180, 167, 1),
            );
          case 4:
            return makeBarGraphicGroupDataForMonth(
              4,
              trackingUserMoodBarGraphic
                  .where((UserMood userMood) => userMood.rate == 5)
                  .toList()
                  .length
                  .toDouble(),
              isTouched: i == touchedIndex,
              barColor: Color.fromRGBO(255, 168, 155, 1),
            );

          default:
            return throw Error();
        }
      });

  BarChartGroupData makeBarGraphicGroupData(
    int x,
    double y, {
    double width = 9,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: x == 0
              ? DanaTheme.paletteLightBlue
              : x == 1
                  ? DanaTheme.paletteDanaPink
                  : x == 2
                      ? DanaTheme.paletteYellow
                      : x == 3
                          ? DanaTheme.paletteGreen
                          : DanaTheme.paletteGrey,
          width: width.sp,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          backDrawRodData: BackgroundBarChartRodData(
            show: false,
            toY: 15,
            color: DanaTheme.paletteGreyTonesLightGrey20,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  BarChartGroupData makeBarGraphicGroupDataForMonth(
    int x,
    double y, {
    bool isTouched = false,
    required Color barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? DanaTheme.paletteOrange : barColor,
          width: width,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: isTouched
              ? BorderSide(color: DanaTheme.paletteOrange, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: false,
            toY: 15,
            color: DanaTheme.paletteGreyTonesLightGrey20,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Map<int, List<int>> mainItemsYearGraphic(
      {required List<UserMood> userMoods}) {
    Map<int, List<int>> finalValues = {
      0: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 1)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 1)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 1)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 1)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 1)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      1: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 2)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 2)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 2)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 2)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 2)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      2: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 3)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 3)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 3)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 3)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 3)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      3: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 4)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 4)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 4)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 4)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 4)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      4: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 5)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 5)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 5)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 5)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 5)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      5: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 6)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 6)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 6)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 6)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 6)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      6: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 7)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 7)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 7)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 7)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 7)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      7: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 8)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 8)
                .where((element) => element.rate == 2)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 8)
                .where((element) => element.rate == 3)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 8)
                .where((element) => element.rate == 4)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 8)
                .where((element) => element.rate == 5)
                .toList()
                .length),
      ],
      8: [
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 9)
                .where((element) => element.rate == 1)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 9)
                .where((element) => element.rate == 2)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 9)
                .where((element) => element.rate == 3)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 9)
                .where((element) => element.rate == 4)
                .toList()
                .length),
        valueFinalItem(
            item: userMoods
                .where((UserMood userMood) => userMood.at!.month == 9)
                .where((element) => element.rate == 5)
                .toList()
                .length),
      ],
      9: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 10)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 10)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 10)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 10)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 10)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      10: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 11)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 11)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 11)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 11)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 11)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
      11: [
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 12)
              .where((element) => element.rate == 1)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 12)
              .where((element) => element.rate == 2)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 12)
              .where((element) => element.rate == 3)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 12)
              .where((element) => element.rate == 4)
              .toList()
              .length,
        ),
        valueFinalItem(
          item: userMoods
              .where((UserMood userMood) => userMood.at!.month == 12)
              .where((element) => element.rate == 5)
              .toList()
              .length,
        ),
      ],
    };
    return finalValues;
  }

  int valueFinalItem({required int item}) {
    if (item != 0) {
      return item;
    } else {
      return 0;
    }
  }

  double barWidthYearGraphic(BuildContext context) {
    double valueWithBar = (MediaQuery.of(context).size.width - 160) / 12;
    return valueWithBar;
  }
}
