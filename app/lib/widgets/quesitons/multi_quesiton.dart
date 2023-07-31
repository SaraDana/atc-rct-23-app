import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class MultiQuestionWidget extends GenericQuestionWidget {
  MultiQuestionWidget({super.key, super.question, super.statement});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Text(
          question?.title.toString() ?? "",
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
      ),
      4.h.verticalSpace,
      Wrap(
          children: (question?.innerQuestions ?? [])
              .map((InnerQuestionModel? innerQuestion) => Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: FilterChip(
                      showCheckmark: false,
                      shape: StadiumBorder(side: BorderSide(width: 0)),
                      selected: locator<QuestionnareCubit>()
                          .isInnerQuestionPositive(
                              question!, innerQuestion?.questionId ?? ""),
                      selectedColor: DanaTheme.paletteFPink,
                      disabledColor: Colors.white,
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      elevation: .5,
                      side: BorderSide(
                          color: locator<QuestionnareCubit>()
                                  .isInnerQuestionPositive(question!,
                                      innerQuestion?.questionId ?? "")
                              ? Colors.transparent
                              : DanaTheme.paletteGreyShadow.withOpacity(.2),
                          width: 0),
                      labelStyle: DanaTheme.bannerTitle2,
                      label: Text(innerQuestion?.shortTitle ?? ""),
                      onSelected: (bool selected) {
                        locator<QuestionnareCubit>().onInnerStatementSelected(
                            question, innerQuestion?.questionId ?? "");
                      },
                    ),
                  ))
              .toList()),
    ]);
  }
}
