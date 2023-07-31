import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/mood_question/inner_question_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/question_type_extention.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:app/styles/dana_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodTrackerSuccessContentCard extends StatefulWidget {
  QuestionnairesModel questionnaire;
  Widget? editButton;

  MoodTrackerSuccessContentCard({
    super.key,
    required this.questionnaire,
    this.editButton,
  });

  @override
  State<MoodTrackerSuccessContentCard> createState() =>
      _MoodTrackerSuccessContentCardState();
}

class _MoodTrackerSuccessContentCardState
    extends State<MoodTrackerSuccessContentCard> {
  @override
  void initState() {
    super.initState();
    makeSort();
  }

  makeSort() {
    Map<String, int> questionIndexMap = {};
    widget.questionnaire.questions!.asMap().forEach((index, question) {
      questionIndexMap[question.questionId!] = index;
    });

    widget.questionnaire.statements!.sort((a, b) {
      int indexA = questionIndexMap[a.questionId] ?? 0;
      int indexB = questionIndexMap[b.questionId] ?? 0;
      return indexA.compareTo(indexB);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> emotions = [
      S.of(context).widgetMoodTrackerDialogEmotion1,
      S.of(context).widgetMoodTrackerDialogEmotion2,
      S.of(context).widgetMoodTrackerDialogEmotion3,
      S.of(context).widgetMoodTrackerDialogEmotion4,
      S.of(context).widgetMoodTrackerDialogEmotion5,
    ];
    return Container(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
        margin: EdgeInsets.only(
            left: DanaTheme.bodyPadding, right: DanaTheme.bodyPadding),
        decoration: decoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.questionnaire.statements?.length,
              itemBuilder: (context, index) {
                QuestionModel? question = widget.questionnaire.questions!
                    .firstWhereOrNull((element) =>
                        element.questionId ==
                        widget.questionnaire.statements![index].questionId);
                if (question?.type == null) return SizedBox();
                QuestionTypeEnum questionType =
                    question?.type!.convertQuestionTypeToEnum();

                if (question != null) {
                  if (questionType == QuestionTypeEnum.MOOD) {
                    return _MoodQuestionAnswerArea(
                      currentStatement: widget.questionnaire.statements![index],
                      emotions: emotions,
                    );
                  }
                  if (questionType == QuestionTypeEnum.MULTI) {
                    return _MultiQuestionAnswerArea(
                      currentStatement: widget.questionnaire.statements![index],
                      question: question,
                    );
                  }

                  if (questionType == QuestionTypeEnum.TEXT) {
                    return _TextQuestionAnswerArea(
                        currentStatement:
                            widget.questionnaire.statements![index]);
                  }
                }
                return Container(
                );
              },
            ),
            widget.editButton ?? SizedBox()
          ],
        ));
  }

  Decoration decoration() => BoxDecoration(
        color: DanaTheme.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: DanaTheme.paletteGreyShadow.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      );
}

class _MoodQuestionAnswerArea extends StatelessWidget {
  QuestionStatementModel currentStatement;
  List<String> emotions;
  _MoodQuestionAnswerArea(
      {required this.currentStatement, required this.emotions, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hoy te \nencuentras",
                style: DanaTheme.textSmallText(
                  DanaTheme.paletteDarkBlue,
                ).copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Container(
                width: 140.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(162),
                    color: DanaTheme.paletteOrange,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 2),
                        color: DanaTheme.paletteGreyTonesLightGrey20,
                        spreadRadius: 0,
                      )
                    ]),
                margin: EdgeInsets.only(right: 10.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Container(
                    // color: DanaTheme.paletteOrange,
                    padding: EdgeInsets.all(DanaTheme.emoticonPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: buildSvgImage(
                              'emoticon_${currentStatement.value}.svg'),
                          width: 45.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Text(
                              emotions[
                                  int.parse(currentStatement.value.toString()) -
                                      1],
                              textAlign: TextAlign.center,
                              style: DanaTheme.textSuperSmallTextBoldEmotions(
                                DanaTheme.whiteColor,
                              ).copyWith(fontSize: 16.sp)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          gapH8,
        ],
      ),
    );
  }
}

class _TextQuestionAnswerArea extends StatelessWidget {
  QuestionStatementModel currentStatement;

  _TextQuestionAnswerArea({required this.currentStatement, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currentStatement.value ?? "",
              maxLines: 2,
              style: DanaTheme.textSmallText(
                DanaTheme.paletteDarkBlue,
              ).copyWith(fontSize: 18.sp)),
          gapH8,
        ],
      ),
    );
  }
}

class _MultiQuestionAnswerArea extends StatelessWidget {
  QuestionStatementModel currentStatement;
  QuestionModel question;
  _MultiQuestionAnswerArea(
      {required this.currentStatement, required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Text(
          question.shortTitle ?? "",
          style: DanaTheme.textSmallText(
            DanaTheme.paletteDarkBlue,
          ).copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        Wrap(
          children: currentStatement.innerStatements!.map((e) {
            InnerQuestionModel? innerQuestion = question.innerQuestions!
                .firstWhereOrNull(
                    (element) => element.questionId == e.questionId);
            return ConstrainedBox(
              constraints: currentStatement.innerStatements!.length > 2
                  ? BoxConstraints(maxWidth: .18.sh)
                  : BoxConstraints(),
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: FilterChip(
                  pressElevation: 0,
                  showCheckmark: false,
                  shape: StadiumBorder(side: BorderSide(width: 0)),
                  selected: false,
                  disabledColor: Colors.white,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  elevation: .5,
                  side: BorderSide(color: DanaTheme.paletteDarkBlue, width: 0),
                  labelStyle: DanaTheme.bannerTitle2,
                  label: Text(
                    innerQuestion?.shortTitle ?? "",
                    style: DanaTheme.textSmallText(
                      DanaTheme.paletteDarkBlue,
                    ).copyWith(fontSize: 16.sp),
                  ),
                  onSelected: (bool selected) {},
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
