//IMPORT EXTERN APP
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_cubit.dart';

class MoodFilterWidget extends StatelessWidget {
  const MoodFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DanaTheme.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          Flexible(
              child: _textFilterMood(context,
                  filterUserMood: FilterUserMood.week)),
          Flexible(
              child: _textFilterMood(context,
                  filterUserMood: FilterUserMood.month)),
          Flexible(
              child: _textFilterMood(context,
                  filterUserMood: FilterUserMood.year)),
        ],
      ),
    );
  }

  Widget _textFilterMood(BuildContext context,
      {required FilterUserMood filterUserMood}) {
    return BlocBuilder<MoodFilterCubit, MoodFilterState>(
        builder: (context, stateMoodFilter) {
      if (filterUserMood == stateMoodFilter.filterUserMood) {
        return Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: DanaTheme.paletteDarkBlue,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Center(
            child: Text(
              (filterUserMood == FilterUserMood.week)
                  ? "Semana"
                  : (filterUserMood == FilterUserMood.month)
                      ? "Mes"
                      : (filterUserMood == FilterUserMood.year)
                          ? "Año"
                          : "",
              style: TextStyle(color: DanaTheme.whiteColor),
            ),
          ),
        );
      } else {
        return TextButton(
          onPressed: () {
            BlocProvider.of<MoodFilterCubit>(context)
                .changeFilter(filterUserMood);
          },
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                (filterUserMood == FilterUserMood.week)
                    ? "Semana"
                    : (filterUserMood == FilterUserMood.month)
                        ? "Mes"
                        : (filterUserMood == FilterUserMood.year)
                            ? "Año"
                            : "",
                style: TextStyle(color: DanaTheme.paletteDarkBlue),
              ),
            ),
          ),
        );
      }
    });
  }
}
