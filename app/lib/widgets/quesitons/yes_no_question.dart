import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/yes_no_question_statement_model.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/di/locator.dart';
import '../../cubits/user_mood/user_mood_cubit.dart';
import '../../models/mood_question/inner_question_model.dart';
import '../../models/mood_question/question_statement_model.dart';
import '../../models/mood_question/questionnaires_model.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';
import '../../utils/screen_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:collection/collection.dart';

class YesNoQuestionWidget extends GenericQuestionWidget {
  YesNoQuestionWidget({super.key, super.question, super.statement});

  @override
  Widget build(BuildContext context) {
    List<YesNoQuestionStatmentModel> choises = [
      YesNoQuestionStatmentModel(
          title: S.of(context).yesText, isPositiveButton: true),
      YesNoQuestionStatmentModel(
          title: S.of(context).noText, isPositiveButton: false)
    ];
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: choises.map((e) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
          child:
              _getOption(context: context, questionModel: question!, choise: e),
        );
      }).toList(),
    );
  }
}

Widget _getOption(
    {required QuestionModel questionModel,
    required BuildContext context,
    required YesNoQuestionStatmentModel choise}) {
  QuestionStatementModel? qs;

  if (locator<QuestionnareCubit>().state.statements != null)
    qs = locator<QuestionnareCubit>().state.statements!.firstWhereOrNull(
        (element) => element.questionId == questionModel.questionId);
  return GestureDetector(
    key: UniqueKey(),
    onTap: () {
      locator<QuestionnareCubit>()
          .onYesNoQuestionSelected(questionModel, choise.isPositiveButton);
    },
    child: Container(
      height: 70,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: DanaTheme.paletteWhite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                width: getScreenWidth(context) -
                    DanaTheme.bodyPadding * 2 -
                    30 -
                    34 -
                    10,
                child: Text(choise.title,
                    style: DanaTheme.textCta(DanaTheme.paletteDarkBlue)),
              ),
              Container(
                  width: 30,
                  child: SvgPicture.asset(
                    (qs?.value == true && choise.isPositiveButton) ||
                            (qs?.value == false && !choise.isPositiveButton)
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
