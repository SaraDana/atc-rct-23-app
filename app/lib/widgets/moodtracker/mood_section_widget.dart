//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/cubits/category_investment/category_investment_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_state.dart';
import 'package:app/widgets/moodtracker/mood_bar_graphic_vinculos_widget.dart';
import 'package:app/widgets/moodtracker/mood_bar_graphic_widget.dart';
import 'package:app/widgets/moodtracker/mood_bar_year_graphic_widget.dart';
import 'package:app/widgets/moodtracker/mood_graphic_widget.dart';
import 'package:app/widgets/moodtracker/mood_select_date_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';
import 'package:week_of_year/week_of_year.dart';

//IMPORT INTERN APP
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_week/mood_week_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/screens/info/moodtracker_info_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/widgets/moodtracker/mood_emotions_widget.dart';
import 'package:app/widgets/moodtracker/mood_grapich_filter_widget.dart';

import '../../data/services/dana_analytics_service.dart';

class MoodSectionWidget extends StatelessWidget {
  final List<UserMood> userMoods;
  const MoodSectionWidget({Key? key, required this.userMoods})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodFilterCubit, MoodFilterState>(
        builder: (context, stateFilter) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: DanaTheme.paletteFPink,
        child: Column(
          children: [
            SizedBox(
              height: 43,
            ),
            Container(
              height: 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${S.of(context).widgetMoodTrackerMoodSectionTitle}',
                      style: DanaTheme.textHeadlineSmall(
                          DanaTheme.paletteDarkBlue)),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            GrapichTypeFilterWidget(),
            SizedBox(
              height: 27,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.sp),
                  topRight: Radius.circular(18.sp),
                ),
              ),
              padding: EdgeInsets.all(
                16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _MoodFilterDropWidget(),
                  5.h.verticalSpace,
                  Divider(),
                ],
              ),
            ),
            BlocBuilder<MoodWeekCubit, MoodWeekState>(
              builder: (context, stateMoodWeek) {
                if (stateFilter.graphichType == GrapichType.VINCULOS) {
                  return MoodBarVinculosGraphicWidget(userMoods: userMoods);
                }

                if (stateFilter.filterUserMood == FilterUserMood.week) {
                  List<DateTime> dates = locator<CategoryInvestmentCubit>()
                      .weekStartFinishDate(stateMoodWeek.moodWeekNumber,
                          stateMoodWeek.moodYearNumber);

                  DanaAnalyticsService.trackEvolutionGraphicLoaded(
                    true,
                    Timestamp.fromDate(dates[0]).seconds,
                    Timestamp.fromDate(dates[1]).seconds,
                  );
                  return MoodGraphicWidget(
                    userMoods: userMoods
                        .where((UserMood userMood) =>
                            userMood.at!.year == stateMoodWeek.moodYearNumber)
                        .toList()
                        .where(
                          (UserMood userMood) =>
                              userMood.at!.weekOfYear ==
                              stateMoodWeek.moodWeekNumber,
                        )
                        .toList(),
                  );
                }
                if (stateFilter.filterUserMood == FilterUserMood.month) {
                  DanaAnalyticsService.trackEvolutionGraphicLoaded(
                    true,
                    Timestamp.fromDate(DateTime(stateMoodWeek.moodYearNumber,
                            stateMoodWeek.moodMonthNumber))
                        .seconds,
                    Timestamp.fromDate(DateTime(stateMoodWeek.moodYearNumber,
                            stateMoodWeek.moodMonthNumber + 1))
                        .seconds,
                  );
                  return MoodBarGraphicWidget(
                    userMoods: userMoods
                        .where((UserMood userMood) =>
                            userMood.at!.year == stateMoodWeek.moodYearNumber)
                        .toList()
                        .where(
                          (UserMood userMood) =>
                              userMood.at!.month ==
                              stateMoodWeek.moodMonthNumber,
                        )
                        .toList(),
                  );
                }
                if (stateFilter.filterUserMood == FilterUserMood.year) {
                  DanaAnalyticsService.trackEvolutionGraphicLoaded(
                    true,
                    Timestamp.fromDate(DateTime(
                      stateMoodWeek.moodYearNumber,
                    )).seconds,
                    Timestamp.fromDate(
                            DateTime(stateMoodWeek.moodYearNumber + 1))
                        .seconds,
                  );
                  return MoodBarYearGraphicWidget(
                    userMoods: userMoods
                        .where((UserMood userMood) =>
                            userMood.at!.year == stateMoodWeek.moodYearNumber)
                        .toList(),
                  );
                }
                return Container();
              },
            ),
            SizedBox(
              height: 16,
            ),
            //MoodEmotionsWidget(),
            SizedBox(
              height: 27,
            ),
          ],
        ),
      );
    });
  }
}

class _MoodFilterDropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodWeekCubit, MoodWeekState>(
        builder: (context, moodWeekState) {
      return BlocBuilder<MoodFilterCubit, MoodFilterState>(
        builder: (context, stateMoodFilter) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35.h,
                  width: 115.w,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: DanaTheme.paletteDarkBlue,
                    ),
                    borderRadius: BorderRadius.circular(40.sp),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    dropdownColor: Colors.white,
                    focusColor: Colors.black,
                    elevation: 8,
                    isExpanded: true,
                    icon: RotationTransition(
                      turns: new AlwaysStoppedAnimation(270 / 360),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 14.sp,
                        color: DanaTheme.paletteDarkBlue,
                      ),
                    ),
                    value:
                        stateMoodFilter.filterUserMood?.convertFilterUserMood(),
                    items: context
                        .read<MoodFilterCubit>()
                        .moodFilters
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: DanaTheme.bodyText1.copyWith(fontSize: 14.sp),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      FilterUserMood filterUserMood =
                          newValue!.convertFilterUserMood();
                      context
                          .read<MoodFilterCubit>()
                          .changeFilter(filterUserMood);

                      bool isRelationGraph =
                          context.read<MoodFilterCubit>().state.graphichType ==
                              GrapichType.VINCULOS;

                      if (filterUserMood == FilterUserMood.week &&
                          isRelationGraph) {
                        locator<CategoryInvestmentCubit>()
                            .reloadRelationGrapichData(
                          filterUserMood: newValue.convertFilterUserMood(),
                          moodWeekNumber: moodWeekState.moodWeekNumber,
                          year: moodWeekState.moodYearNumber,
                        );
                      }
                      if (filterUserMood == FilterUserMood.month &&
                          isRelationGraph) {
                        locator<CategoryInvestmentCubit>()
                            .reloadRelationGrapichData(
                          filterUserMood: newValue.convertFilterUserMood(),
                          selectedDate: DateTime(
                            moodWeekState.moodYearNumber,
                            moodWeekState.moodMonthNumber,
                          ),
                        );
                      }
                      if (filterUserMood == FilterUserMood.year &&
                          isRelationGraph) {
                        locator<CategoryInvestmentCubit>()
                            .reloadRelationGrapichData(
                          filterUserMood: newValue.convertFilterUserMood(),
                          selectedDate: DateTime(
                            moodWeekState.moodYearNumber,
                          ),
                        );
                      }
                    },
                  ),
                ),
                MoodSelectDateWidget(),
              ],
            ),
          );
        },
      );
    });
  }
}

extension ConverFilterUserMoodToString on FilterUserMood {
  convertFilterUserMood() {
    if (this == FilterUserMood.week) {
      return locator<MoodFilterCubit>().moodFilters[0];
    }
    if (this == FilterUserMood.month) {
      return locator<MoodFilterCubit>().moodFilters[1];
    }
    if (this == FilterUserMood.year) {
      return locator<MoodFilterCubit>().moodFilters[2];
    }
  }
}

extension ConverStringToFilterUserMood on String {
  convertFilterUserMood() {
    if (this == locator<MoodFilterCubit>().moodFilters[0]) {
      return FilterUserMood.week;
    }
    if (this == locator<MoodFilterCubit>().moodFilters[1]) {
      return FilterUserMood.month;
    }
    if (this == locator<MoodFilterCubit>().moodFilters[2]) {
      return FilterUserMood.year;
    }
  }
}
