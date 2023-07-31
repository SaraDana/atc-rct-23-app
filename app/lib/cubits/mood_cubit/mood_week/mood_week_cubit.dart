import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:week_of_year/week_of_year.dart';

part 'mood_week_state.dart';

class MoodWeekCubit extends Cubit<MoodWeekState> {
  MoodWeekCubit() : super(MoodWeekState.initial());

  void incrementMonthAndWeekFilterWeek() {
    final newState = state.copyWith(counter: state.moodWeekNumber + 1);
    log("$newState");
    emit(newState);
    if (state.moodWeekNumber == 5 ||
        state.moodWeekNumber == 9 ||
        state.moodWeekNumber == 13 ||
        state.moodWeekNumber == 18 ||
        state.moodWeekNumber == 22 ||
        state.moodWeekNumber == 27 ||
        state.moodWeekNumber == 31 ||
        state.moodWeekNumber == 35 ||
        state.moodWeekNumber == 40 ||
        state.moodWeekNumber == 44 ||
        state.moodWeekNumber == 49) {
      int newMonth = state.moodMonthNumber + 1;
      final newState = state.copyWith(month: newMonth);
      log("$newState");
      emit(newState);
    }
    if (state.moodWeekNumber == 53) {
      clear();
    }
  }

  void decrementMonthAndWeekFilterWeek() {
    final newStateWeek = state.copyWith(counter: state.moodWeekNumber - 1);
    log("$newStateWeek");
    emit(newStateWeek);
    if (state.moodWeekNumber == 4 ||
        state.moodWeekNumber == 8 ||
        state.moodWeekNumber == 12 ||
        state.moodWeekNumber == 17 ||
        state.moodWeekNumber == 21 ||
        state.moodWeekNumber == 26 ||
        state.moodWeekNumber == 30 ||
        state.moodWeekNumber == 34 ||
        state.moodWeekNumber == 39 ||
        state.moodWeekNumber == 43 ||
        state.moodWeekNumber == 48 ||
        state.moodWeekNumber == 52) {
      int newMonth = state.moodMonthNumber - 1;
      final newState = state.copyWith(month: newMonth);
      log("$newState");
      emit(newState);
    }

    if (state.moodWeekNumber == 0) {
      clearBack();
    }
  }

  void incrementMonthAndWeekFilterMonth() {
    int newMonth = state.moodMonthNumber + 1;

    switch (newMonth) {
      case 1:
        final newState = state.copyWith(month: newMonth, counter: 1);
        log("$newState");
        emit(newState);
        break;
      case 2:
        final newState = state.copyWith(month: newMonth, counter: 5);
        log("$newState");
        emit(newState);
        break;
      case 3:
        final newState = state.copyWith(month: newMonth, counter: 9);
        log("$newState");
        emit(newState);
        break;
      case 4:
        final newState = state.copyWith(month: newMonth, counter: 13);
        log("$newState");
        emit(newState);
        break;
      case 5:
        final newState = state.copyWith(month: newMonth, counter: 18);
        log("$newState");
        emit(newState);
        break;
      case 6:
        final newState = state.copyWith(month: newMonth, counter: 22);
        log("$newState");
        emit(newState);
        break;
      case 7:
        final newState = state.copyWith(month: newMonth, counter: 27);
        log("$newState");
        emit(newState);
        break;
      case 8:
        final newState = state.copyWith(month: newMonth, counter: 31);
        log("$newState");
        emit(newState);
        break;
      case 9:
        final newState = state.copyWith(month: newMonth, counter: 35);
        log("$newState");
        emit(newState);
        break;
      case 10:
        final newState = state.copyWith(month: newMonth, counter: 40);
        log("$newState");
        emit(newState);
        break;
      case 11:
        final newState = state.copyWith(month: newMonth, counter: 44);
        log("$newState");
        emit(newState);
        break;
      case 12:
        final newState = state.copyWith(month: newMonth, counter: 49);
        log("$newState");
        emit(newState);
        break;
      case 13:
        clear();
        break;
      default:
        break;
    }
  }

  void decrementMonthAndWeekFilterMonth() {
    int newMonth = state.moodMonthNumber - 1;

    switch (newMonth) {
      case 0:
        clearBack();
        break;
      case 1:
        final newState = state.copyWith(month: newMonth, counter: 1);
        log("$newState");
        emit(newState);
        break;
      case 2:
        final newState = state.copyWith(month: newMonth, counter: 5);
        log("$newState");
        emit(newState);
        break;
      case 3:
        final newState = state.copyWith(month: newMonth, counter: 9);
        log("$newState");
        emit(newState);
        break;
      case 4:
        final newState = state.copyWith(month: newMonth, counter: 13);
        log("$newState");
        emit(newState);
        break;
      case 5:
        final newState = state.copyWith(month: newMonth, counter: 18);
        log("$newState");
        emit(newState);
        break;
      case 6:
        final newState = state.copyWith(month: newMonth, counter: 22);
        log("$newState");
        emit(newState);
        break;
      case 7:
        final newState = state.copyWith(month: newMonth, counter: 27);
        log("$newState");
        emit(newState);
        break;
      case 8:
        final newState = state.copyWith(month: newMonth, counter: 31);
        log("$newState");
        emit(newState);
        break;
      case 9:
        final newState = state.copyWith(month: newMonth, counter: 35);
        log("$newState");
        emit(newState);
        break;
      case 10:
        final newState = state.copyWith(month: newMonth, counter: 40);
        log("$newState");
        emit(newState);
        break;
      case 11:
        final newState = state.copyWith(month: newMonth, counter: 44);
        log("$newState");
        emit(newState);
        break;
      case 12:
        final newState = state.copyWith(month: newMonth, counter: 49);
        log("$newState");
        emit(newState);
        break;
      default:
        break;
    }
  }

  void incrementYear() {
    final newState = state.copyWith(year: state.moodYearNumber + 1);
    emit(newState);
  }

  void decrementYear() {
    final newState = state.copyWith(year: state.moodYearNumber - 1);
    emit(newState);
  }

  void clear() {
    final newState =
        state.copyWith(counter: 1, month: 1, year: state.moodYearNumber + 1);
    log("$newState");
    emit(newState);
  }

  void clearBack() {
    final newState =
        state.copyWith(counter: 52, month: 12, year: state.moodYearNumber - 1);
    log("$newState");
    emit(newState);
  }
}
