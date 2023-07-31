import 'package:app/core/error/failures.dart';
import 'package:app/cubits/category_investment/category_investment_state.dart';
import 'package:app/data/repositories/category_investment/category_investment_repository_impl.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/models/category_investment_model.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CategoryInvestmentEnum {
  Loading,
  Idle,
  Error,
}

class CategoryInvestmentCubit extends Cubit<CategoryInvestmentState> {
  CategoryInvestmentCubit() : super(CategoryInvestmentState()) {
    setUserInfo();
  }

  reloadRelationGrapichData({
    required FilterUserMood filterUserMood,
    DateTime? selectedDate,
    int? moodWeekNumber,
    int? year,
  }) {
    List<DateTime> dateList = [];

    if (filterUserMood == FilterUserMood.week)
      dateList.addAll(weekStartFinishDate(
          moodWeekNumber ?? 0, year ?? DateTime.now().year));
    if (filterUserMood == FilterUserMood.month)
      dateList.addAll(_monthStartFinishDate(selectedDate!));
    if (filterUserMood == FilterUserMood.year)
      dateList.addAll(_yearStartFinishDate(selectedDate!));
    if (dateList.isNotEmpty) {
      DanaAnalyticsService.trackEvolutionGraphicLoaded(
          false,
          Timestamp.fromDate(dateList[0]).seconds,
          Timestamp.fromDate(dateList[1]).seconds);
      _setCategoryInvestment(dateList[0], dateList[1]);
    }
  }

  setUserInfo() {
    String? userId;
    String? email;
    if (FirebaseAuth.instance.currentUser != null) {
      userId = FirebaseAuth.instance.currentUser?.uid;
      email = FirebaseAuth.instance.currentUser?.email;
    }
    emit(state.copyWith(userId: userId, email: email));
  }

  _setCategoryInvestment(DateTime fromDate, DateTime toDate) async {
    if (state.userId != null) {
      emit(state.copyWith(
          categoryInvestmentEnum: CategoryInvestmentEnum.Loading));

      Either<Failure, List<CategoryInvestment>> categoryInverstmentFold =
          await CategoryInvestmentRepositoryImpl().invimaCategoryInvestment(
              state.userId, state.email, fromDate, toDate);

      categoryInverstmentFold.fold((l) {
        emit(
          state.copyWith(categoryInvestmentEnum: CategoryInvestmentEnum.Error),
        );
      }, (categoryInvestmentList) {
        emit(
          state.copyWith(
              categoryInvestmentList: categoryInvestmentList,
              categoryInvestmentEnum: CategoryInvestmentEnum.Idle),
        );
      });
    }
  }

  List<DateTime> weekStartFinishDate(int moodWeekNumber, int year) {
    DateTime firstDay = DateTime(year, 1, 1);
    int firstDayWeek = firstDay.weekday;

    DateTime fromDate =
        DateTime(year, 1, 1 + (moodWeekNumber * 7) - (firstDayWeek - 1));
    DateTime toDate =
        DateTime(year, 1, 1 + (moodWeekNumber * 7) - (firstDayWeek - 1) + 7);

    return [fromDate, toDate];
  }

  List<DateTime> _monthStartFinishDate(DateTime selectedDate) {
    DateTime? fromDate;
    DateTime? toDate;
    fromDate = DateTime(selectedDate.year, selectedDate.month, 1);
    toDate = DateTime(selectedDate.year, selectedDate.month + 1);

    return [fromDate, toDate];
  }

  List<DateTime> _yearStartFinishDate(DateTime selectedDate) {
    DateTime? fromDate;
    DateTime? toDate;

    fromDate = DateTime(selectedDate.year);
    toDate = DateTime(selectedDate.year + 1);
    return [fromDate, toDate];
  }

  Future<void> reset() async {
    emit(CategoryInvestmentState());
  }
}
