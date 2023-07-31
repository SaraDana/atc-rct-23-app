//IMPORT EXTERN APP
import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrapichTypeFilterWidget extends StatelessWidget {
  const GrapichTypeFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DanaTheme.whiteColor.withOpacity(.4),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          Flexible(
              child: _textGrapichType(context,
                  grapichType: GrapichType.EMOCIONES)),
          Flexible(
              child:
                  _textGrapichType(context, grapichType: GrapichType.VINCULOS)),
        ],
      ),
    );
  }

  Widget _textGrapichType(BuildContext context,
      {required GrapichType grapichType}) {
    return BlocBuilder<MoodFilterCubit, MoodFilterState>(
        builder: (context, stateMoodFilter) {
      if (grapichType == stateMoodFilter.graphichType) {
        return Container(
          height: 54.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: DanaTheme.paletteFOrange,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Center(
            child: Text(
              grapichType.convertGrapichTypeToString(),
              style: DanaTheme.textCta(DanaTheme.whiteColor),
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<MoodFilterCubit>(context)
                .changeGrapichType(grapichType);
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 54.h,
            child: Center(
              child: Text(
                grapichType.convertGrapichTypeToString(),
                style: DanaTheme.textCta(
                    DanaTheme.paletteDarkBlue.withOpacity(.6)),
              ),
            ),
          ),
        );
      }
    });
  }
}
