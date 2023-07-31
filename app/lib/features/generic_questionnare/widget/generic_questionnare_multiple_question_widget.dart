import 'package:app/core/di/locator.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/models/mood_question/inner_question_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenericQuestionnareMultiQuestionWidget extends GenericQuestionWidget {
  GenericQuestionnareMultiQuestionWidget(
      {super.key, super.question, super.statement});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question!.innerQuestions!.map((e) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h,left: 5.w,right: 5.w),
          child: _getOption(
              context: context,
              questionModel: question!,
              innerQuestionModel: e),
        );
      }).toList(),
    );
  }
}

Widget _getOption(
    {required InnerQuestionModel innerQuestionModel,
    required QuestionModel questionModel,
    required BuildContext context}) {
  return GestureDetector(
    key: UniqueKey(),
    onTap: () {
      locator<QuestionnareCubit>().onInnerStatementSelected(
          questionModel, innerQuestionModel.questionId ?? "");
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
                child: Text(innerQuestionModel.shortTitle ?? "",
                    style: DanaTheme.textCta(DanaTheme.paletteDarkBlue)),
              ),
              Container(
                  width: 30,
                  child: SvgPicture.asset(
                    locator<QuestionnareCubit>().isInnerQuestionPositive(
                            questionModel, innerQuestionModel.questionId ?? "")
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
