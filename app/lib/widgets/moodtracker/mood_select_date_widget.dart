//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/cubits/category_investment/category_investment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT INTERN APP
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_week/mood_week_cubit.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/utils/moodtracker.utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodSelectDateWidget extends StatelessWidget {
  const MoodSelectDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodWeekCubit, MoodWeekState>(
      builder: (context, stateMoodWeek) {
        return Container(
          height: 30.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bool isRelationGraph = context
                                .read<MoodFilterCubit>()
                                .state
                                .graphichType ==
                            GrapichType.VINCULOS;
                        if (context
                                .read<MoodFilterCubit>()
                                .state
                                .filterUserMood ==
                            FilterUserMood.week) {
                          BlocProvider.of<MoodWeekCubit>(context)
                              .decrementMonthAndWeekFilterWeek();
                          if (isRelationGraph) {
                            locator<CategoryInvestmentCubit>()
                                .reloadRelationGrapichData(
                                    filterUserMood: FilterUserMood.week,
                                    moodWeekNumber:
                                        stateMoodWeek.moodWeekNumber -1,
                                    year: stateMoodWeek.moodYearNumber);
                          }
                        }
                        if (context
                                .read<MoodFilterCubit>()
                                .state
                                .filterUserMood ==
                            FilterUserMood.month) {
                          BlocProvider.of<MoodWeekCubit>(context)
                              .decrementMonthAndWeekFilterMonth();

                          if (isRelationGraph) {
                            DateTime selectedDate = DateTime(
                              stateMoodWeek.moodYearNumber,
                              stateMoodWeek.moodMonthNumber - 1,
                            );
                            locator<CategoryInvestmentCubit>()
                                .reloadRelationGrapichData(
                              filterUserMood: FilterUserMood.month,
                              selectedDate: selectedDate,
                            );
                          }
                        }
                        if (context
                                .read<MoodFilterCubit>()
                                .state
                                .filterUserMood ==
                            FilterUserMood.year) {
                          BlocProvider.of<MoodWeekCubit>(context)
                              .decrementYear();
                          if (isRelationGraph) {
                            DateTime selectedDate = DateTime(
                              stateMoodWeek.moodYearNumber - 1,
                            );
                            locator<CategoryInvestmentCubit>()
                                .reloadRelationGrapichData(
                              filterUserMood: FilterUserMood.year,
                              selectedDate: selectedDate,
                            );
                          }
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    8.w.horizontalSpace,
                    if (context.read<MoodFilterCubit>().state.filterUserMood ==
                        FilterUserMood.week)
                      /* MoodTrackerUtils().weekOfMonthMood(context,
                          value: stateMoodWeek.moodWeekNumber),*/
                      Text(stateMoodWeek.moodWeekNumber.toString()),
                    if (context.read<MoodFilterCubit>().state.filterUserMood ==
                        FilterUserMood.month)
                      MoodTrackerUtils().monthOfYearMood(context,
                          value: stateMoodWeek.moodMonthNumber),
                    if (context.read<MoodFilterCubit>().state.filterUserMood ==
                        FilterUserMood.year)
                      MoodTrackerUtils().onlyYear(context),
                    8.w.horizontalSpace,
                    GestureDetector(
                      onTap: () async {
                        bool isRelationGraph = context
                                .read<MoodFilterCubit>()
                                .state
                                .graphichType ==
                            GrapichType.VINCULOS;
                        if (context
                                .read<MoodFilterCubit>()
                                .state
                                .filterUserMood ==
                            FilterUserMood.week) {
                          print("Wekk : ${stateMoodWeek.moodWeekNumber}");

                          BlocProvider.of<MoodWeekCubit>(context)
                              .incrementMonthAndWeekFilterWeek();
                          if (isRelationGraph) {
                            locator<CategoryInvestmentCubit>()
                                .reloadRelationGrapichData(
                                    filterUserMood: FilterUserMood.week,
                                    moodWeekNumber:
                                        stateMoodWeek.moodWeekNumber +1,
                                    year: stateMoodWeek.moodYearNumber);
                          }
                        }
                        if (context
                                .read<MoodFilterCubit>()
                                .state
                                .filterUserMood ==
                            FilterUserMood.month) {
                          BlocProvider.of<MoodWeekCubit>(context)
                              .incrementMonthAndWeekFilterMonth();
                          if (isRelationGraph) {
                            DateTime selectedDate = DateTime(
                              stateMoodWeek.moodYearNumber,
                              stateMoodWeek.moodMonthNumber + 1,
                            );
                            locator<CategoryInvestmentCubit>()
                                .reloadRelationGrapichData(
                              filterUserMood: FilterUserMood.month,
                              selectedDate: selectedDate,
                            );
                          }
                        }
                        if (context
                                .read<MoodFilterCubit>()
                                .state
                                .filterUserMood ==
                            FilterUserMood.year) {
                          BlocProvider.of<MoodWeekCubit>(context)
                              .incrementYear();
                          if (isRelationGraph) {
                            DateTime selectedDate = DateTime(
                              stateMoodWeek.moodYearNumber + 1,
                            );
                            locator<CategoryInvestmentCubit>()
                                .reloadRelationGrapichData(
                              filterUserMood: FilterUserMood.year,
                              selectedDate: selectedDate,
                            );
                          }
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
