import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/cubits/category_investment/category_investment_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_state.dart';
import 'package:app/cubits/mood_cubit/mood_week/mood_week_cubit.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:bloc/bloc.dart';

class MoodFilterCubit extends Cubit<MoodFilterState> {
  MoodFilterCubit()
      : super(MoodFilterState(
          filterUserMood: FilterUserMood.week,
          graphichType: GrapichType.EMOCIONES,
        ));

  void changeFilter(FilterUserMood newFilter) {
    emit(state.copyWith(filterUserMood: newFilter));
  }

  void changeGrapichType(GrapichType newGraipchType) {
    if (newGraipchType == GrapichType.VINCULOS &&
        locator<CategoryInvestmentCubit>()
            .state
            .categoryInvestmentList
            .isEmpty) {
      locator<CategoryInvestmentCubit>().reloadRelationGrapichData(
        filterUserMood: FilterUserMood.week,
        moodWeekNumber: locator<MoodWeekCubit>().state.moodWeekNumber,
        year: locator<MoodWeekCubit>().state.moodYearNumber,
      );
    }
    emit(state.copyWith(graphichType: newGraipchType));
  }

  List<String> moodFilters = ["Semana", "Mes", "Año"];
}
