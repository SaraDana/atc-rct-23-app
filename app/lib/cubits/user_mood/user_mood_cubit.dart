import 'dart:math';

import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/questionare_enum.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/cubits/user_mood/user_mood_state.dart';
import 'package:app/data/repositories/question/question_repository_impl.dart';
import 'package:app/data/repositories/user_mood/firebase_user_mood_repository.dart';
import 'package:app/models/mood_question/inner_question_model.dart';
import 'package:app/models/mood_question/inner_question_statement_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/utils/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/moodtracker/moodtracker_repository.dart';
import '../../data/services/dana_analytics_service.dart';

class UserMoodCubit extends Cubit<UserMoodState> {
  MoodtrackerRepository moodtrackerRepository;
  UserMoodCubit({required this.moodtrackerRepository})
      : super(UserMoodState()) {
    userMoodInit(isTrackerTutorialSeenInc: false);
  }

  bool checkIsComplatedToday() {
    return state.emotionSelected == null;
  }

// this is init function whic when tracker page created.
  void userMoodInit({required bool? isTrackerTutorialSeenInc}) async {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      BannerUtils.checkVisibility('tracking');
      try {
        emit(state.copyWith(
          userMoods: [],
          status: StatusCubit.LOADING,
        ));

        Either<Failure, QuestionnairesModel?> vitalityTrackerForTheDayFold =
            await QuestionRepositoryImpl().vitalityTrackerForTheDay(
          FirebaseAuth.instance.currentUser?.uid,
          FirebaseAuth.instance.currentUser?.email,
        );

        vitalityTrackerForTheDayFold.fold(
            (l) => emit(
                  state.copyWith(userMoods: [], status: StatusCubit.ERROR),
                ), (r) {
          if (r != null && r.questions != null) {
            emit(
              state.copyWith(
                userMoods: [],
                status: StatusCubit.SUCCESS,
                questionnaire: r,
              ),
            );
          } else {
            emit(
              state.copyWith(
                userMoods: [],
                status: StatusCubit.SUCCESS,
              ),
            );
          }
        });
      } catch (e) {
        emit(
          state.copyWith(
            userMoods: [],
            status: StatusCubit.ERROR,
          ),
        );
      }

      if (state.questionnaire != null) {
        if (state.questionnaire!.statements != null &&
            state.questionnaire!.statements!.isNotEmpty) {
          _searchTodayMood();
        }
      }

      setUserMoods(isTrackerTutorialSeenInc: isTrackerTutorialSeenInc ?? false);
    }
  }

  _searchTodayMood() async {
    int? emotionSelected;
    int emotion = -1;
    String? moodTextToday;

    for (QuestionModel question in state.questionnaire!.questions!) {
      QuestionStatementModel questionStatementModel =
          state.questionnaire!.statements!.firstWhere(
        (element) => element.questionId == question.questionId,
        orElse: () => QuestionStatementModel(),
      );

      if (question.type == "MOOD") {
        emotionSelected = questionStatementModel.value;
        emotion = questionStatementModel.value;
      }

      if (question.type == "TEXT") {
        moodTextToday = questionStatementModel.value;
      }
    }

    emit(
      state.copyWith(
        emotionSelected: emotionSelected,
        emotion: emotion,
        moodTextToday: moodTextToday ?? "",
      ),
    );
  }

  setUserMoods({bool? isTrackerTutorialSeenInc}) async {
    List<UserMood> allUserMoods =
        await FirebaseUserMoodRepository().getAllUserMoods()
          ..where(
            (mood) => mood.comment != '',
          ).toList();
    allUserMoods.sort((a, b) {
      return b.at!.compareTo(a.at!);
    });
    if (isTrackerTutorialSeenInc != null && isTrackerTutorialSeenInc) {
      int moodTrackerTutorialSeenCount =
          await getMoodTrackerTutorialSeenCountState();
      emit(
        state.copyWith(
            userMoods: allUserMoods,
            moodTrackerTutorialSeenCount: moodTrackerTutorialSeenCount),
      );
    } else {
      emit(state.copyWith(
        userMoods: allUserMoods,
      ));
    }
  }

  Future<void> reset() async {
    emit(UserMoodState());
  }

  setTrackerTutorialSeen() async {
    int count = await getMoodTrackerTutorialSeenCount();
    setgetMoodTrackerTutorialSeenCount(count);
    emit(
      state.copyWith(moodTrackerTutorialSeenCount: count + 1),
    );
    DanaAnalyticsService.trackTutorialPageVisited('moodtracker');
  }

  Future<int> getMoodTrackerTutorialSeenCountState() async {
    int count = await getMoodTrackerTutorialSeenCount();
    if (count == 1) {
      setgetMoodTrackerTutorialSeenCount(count);
    }
    return count;
  }

  setgetMoodTrackerTutorialSeenCount(count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("moodTrackerTutorialSeenCount", count + 1);
  }

  Future<int> getMoodTrackerTutorialSeenCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getInt("moodTrackerTutorialSeenCount") ?? 0;
  }
}
