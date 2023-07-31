import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:app/models/program_model.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/widgets/profile/models/program_model.dart';
import 'package:app/widgets/profile/models/week_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'myprogress_state.dart';

class MyprogressCubit extends Cubit<MyprogressState> {
  UserRepository userRepository;
  MyprogressCubit({
    required this.userRepository,
  }) : super(MyprogressInitial());

  int calculateUserWeek(DateTime lastPeriod) {
    DateTime now = DateTime.now();
    return calculateWeeksBetweenDate(
      fromTime: lastPeriod,
      toTime: now,
    );
  }

  int calculateRecommendationUserWeek(DateTime lastPeriod) {
    int week = calculateUserWeek(lastPeriod);
    return week >= 5 ? week : 5;
  }

  bool _isHomePageSectionShowed = false;
  bool isHomePageSectionShowed() => _isHomePageSectionShowed;

  setHomePageSectionShowed() {
    _isHomePageSectionShowed = true;
  }

  Future<int> setTabCount() async {
    emit(MyprogressLoading());
    NewUserModel? user = await userRepository.getUserByEmail();
    if (user != null) {
      if (user.lastPeriod != null) {
        int userWeek = calculateRecommendationUserWeek(user.lastPeriod!);
        emit(MyprogressLoaded(userWeek: userWeek, sectios: allSections));
        return 3;
      } else {
        emit(MyprogressLoaded(userWeek: 0, sectios: allSections));

        return 2;
      }
    } else {
      emit(MyprogressError());
      return 2;
    }
  }

  onClickedPrgram(int sectionId, int userWeek, bool isExpanding) {
    DanaAnalyticsService.trackExpandingMyweeksPregnancyTrimester(isExpanding);
    List<WeekModel> sectionList =
        allSections.where((element) => element.sectionId == sectionId).toList();
    sectionList[0].isOpened = !sectionList[0].isOpened;
    emit(MyprogressLoaded(userWeek: userWeek, sectios: allSections));
  }

  setClosedAllTabs() {
    allSections.forEach((element) {
      element.isOpened = false;
    });
  }

  bool isMyProgressPregnantWeeksProgram(String? programId) {
    for (var section in allSections) {
      for (var program in section.programs) {
        if (program.programId == programId) return true;
      }
    }
    return false;
  }

  List<WeekModel> allSections = [
    WeekModel(
        sectionId: 1,
        isOpened: false,
        backgroundPath: '$ASSETS_IMAGES/weeks/t1.svg',
        programs: [
          ProgramModel(programId: "FXaikorR1dCx9oZh1tHF", week: 5),
          ProgramModel(programId: "zf6Ds6ZYXQECowllSuIb", week: 6),
          ProgramModel(programId: "V3Df40Ozf3Sa1kFWmiyQ", week: 7),
          ProgramModel(programId: "F0fhaqF5ZeWxFIqXqjuG", week: 8),
          ProgramModel(programId: "xpJuublQh6eMV9cqKbqp", week: 9),
          ProgramModel(programId: "LmAsJKPivqLz7fersrcf", week: 10),
          ProgramModel(programId: "juzmV1l5z3zvVZmp6OdE", week: 11),
          ProgramModel(programId: "n54URGl76SAh5Se1p8or", week: 12),
          ProgramModel(programId: "4C3Z7ryaMnZgh1JibfgP", week: 13),
        ],
        sectionTitle: "TRIMESTRE 1"),
    WeekModel(
        sectionId: 2,
        isOpened: false,
        backgroundPath: '$ASSETS_IMAGES/weeks/t2.svg',
        programs: [
          ProgramModel(programId: "QpH9peCp4TNEmrcxMVGI", week: 14),
          ProgramModel(programId: "4HyewcrfNKh37JRyCUCo", week: 15),
          ProgramModel(programId: "VS0bS0CBTFvQxzsQHnUn", week: 16),
          ProgramModel(programId: "zbx6TKHY1DtqvuRObNbm", week: 17),
          ProgramModel(programId: "8STK1mzaTnhV1BHfWLL2", week: 18),
          ProgramModel(programId: "lNw5df0kaOTb3BFVJMrD", week: 19),
          ProgramModel(programId: "vjLEVZyEJdMekNKxDHIf", week: 20),
          ProgramModel(programId: "6ziBplOCv62dlhc1ktmx", week: 21),
          ProgramModel(programId: "gQcnqYy4y1Z2jYAayjJO", week: 22),
          ProgramModel(programId: "wQ31R6dx94jo8PITaO5W", week: 23),
          ProgramModel(programId: "BhMzxgg1d9iiwW3Yo6Vd", week: 24),
          ProgramModel(programId: "FeKCxc9DP3rNwiaNjUgO", week: 25),
          ProgramModel(programId: "fzKMm77NZA9o788OtLlc", week: 26),
          ProgramModel(programId: "4Q5367Hs3u8QNMCmMSaE", week: 27),
        ],
        sectionTitle: "TRIMESTRE 2"),
    WeekModel(
        sectionId: 3,
        isOpened: false,
        backgroundPath: '$ASSETS_IMAGES/weeks/t3.svg',
        programs: [
          ProgramModel(programId: "Et6TCDnQ31FYQ2pgUxRx", week: 28),
          ProgramModel(programId: "SFEuzOJTzPdEEtJ06rhs", week: 29),
          ProgramModel(programId: "jUPGtVS9TXFzGzvQU1jr", week: 30),
          ProgramModel(programId: "plJgtSOOQmYyqG0Ald7d", week: 31),
          ProgramModel(programId: "Se8eIYBWyMwuet0GLahL", week: 32),
          ProgramModel(programId: "Z9MVpuC6D1peG9eLd1rw", week: 33),
          ProgramModel(programId: "hvUcwevzl0FIfnpGVPid", week: 34),
          ProgramModel(programId: "XTaBQJK2BIh1692XwSJe", week: 35),
          ProgramModel(programId: "lRTIbkG5GmgHYQ3XLZyL", week: 36),
          ProgramModel(programId: "7XsRdMndhakXlRlfVoQo", week: 37),
          ProgramModel(programId: "Iz6g5D0IgvSKPzWJmAlR", week: 38),
          ProgramModel(programId: "O6wOwIEH2zJLkwtnkSQR", week: 39),
          ProgramModel(programId: "Bi6JXMT3X1dTH6caI96N", week: 40),
          ProgramModel(programId: "XQncodzBlqoGqX6cXt2r", week: 41),
          ProgramModel(programId: "xoDjmgLeTyGrCrWzAGcD", week: 42),
        ],
        sectionTitle: "TRIMESTRE 3"),
  ];

  onHomePageCardPressed(date) {
    DanaAnalyticsService.trackClickedMyWeeksPregnantHomeSection();
    String? programId = getProgramIdForUserWithPregnantDate(date);
    goRouter.pushNamed(
      AppRoutes.programDetailPage.name,
      queryParams: {'programId': programId},
      extra: ProgramDetailArguments(
        program: Program(id: programId),
        onBackPressed: () async {
          await locator<ProgramCubit>().chargeProgram();
        },
      ),
    );
  }

  int getSectionIndexForWeek(int week) {
    int sectionIndex = 0;

    if (week <= 13) {
      sectionIndex = 0;
    } else if (week > 13 && week <= 27) {
      sectionIndex = 1;
    } else {
      sectionIndex = 2;
    }
    return sectionIndex;
  }

  ProgramModel? getProgramModelForWeek(int week) {
    int sectionIndex = getSectionIndexForWeek(week);
    if (week <= 5) {
      return allSections[sectionIndex].programs[0];
    }

    for (ProgramModel program in allSections[sectionIndex].programs) {
      if (program.week == week) {
        return program;
      }
    }
    return null;
  }

  String? getProgramIdForWeek(int week) {
    return getProgramModelForWeek(week)?.programId;
  }

  String? getProgramIdForUserWithPregnantDate(DateTime date) {
    int weeks = calculateUserWeek(date);
    return getProgramIdForWeek(weeks);
  }

  String getBackgroundPath(lastPeriod) {
    int globalUserWeek = calculateRecommendationUserWeek(lastPeriod);
    int sectionIndex = getSectionIndexForWeek(globalUserWeek);
    return allSections[sectionIndex].backgroundPath;
  }

  String? getProgramWeek(lastPeriod) {
    int week = calculateUserWeek(lastPeriod);
    return getProgramModelForWeek(week)?.week.toString();
  }
}
