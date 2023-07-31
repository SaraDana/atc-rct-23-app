import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:flutter/cupertino.dart';
import '../../core/di/locator.dart';
import '../../cubits/user_mood/user_mood_cubit.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';
import '../../utils/screen_size.dart';
import 'package:collection/collection.dart';

class MoodQuestionWidget extends GenericQuestionWidget {
  late List<String> emotions;

  MoodQuestionWidget({super.key, super.question, super.statement});

  @override
  Widget build(BuildContext context) {
    emotions = [
      S.of(context).widgetMoodTrackerDialogEmotion1,
      S.of(context).widgetMoodTrackerDialogEmotion2,
      S.of(context).widgetMoodTrackerDialogEmotion3,
      S.of(context).widgetMoodTrackerDialogEmotion4,
      S.of(context).widgetMoodTrackerDialogEmotion5,
    ];

    return Row(children: [
      //TODO CHANGE FOR A LISTVIEW with emotions list.
      for (var i = 1; i < emotions.length + 1; i++)
        Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () => {
                      locator<QuestionnareCubit>()
                          .answerQuestion(question!, i, false)
                    },
                child: _getEmoticonSelected(i, context)))
    ]);
  }

  _getEmoticonSelected(int i, context) {
    var moodQuestion = locator<QuestionnareCubit>()
        .state
        .questionnaire
        ?.questions
        ?.firstWhereOrNull((element) => element.type == "MOOD");
    var moodStatement = locator<QuestionnareCubit>()
        .state
        .questionnaire
        ?.statements
        ?.firstWhereOrNull(
            (element) => element.questionId == moodQuestion?.questionId);
    var emotionSmallText = DanaTheme.textSuperSmallTextBoldEmotions(
        moodStatement?.value == i
            ? DanaTheme.paletteWhite
            : DanaTheme.paletteGreyTonesMediumGrey);
    var emotionSmallerText = DanaTheme.textSuperSmallerTextBoldEmotions(
        moodStatement?.value == i
            ? DanaTheme.paletteWhite
            : DanaTheme.paletteGreyTonesMediumGrey);

    return Container(
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(162),
            color: moodStatement?.value == i
                ? DanaTheme.paletteOrange
                : DanaTheme.paletteWhite,
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  color: DanaTheme.paletteGreyTonesLightGrey20,
                  spreadRadius: 0)
            ]),
        margin: EdgeInsets.only(right: 10.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Container(
                color: moodStatement?.value == i
                    ? DanaTheme.paletteOrange
                    : DanaTheme.paletteWhite,
                padding: EdgeInsets.all(DanaTheme.emoticonPadding),
                child: Column(children: [
                  Expanded(
                      flex: 1,
                      child: buildSvgImage(
                          moodStatement?.value == i
                              ? 'emoticon_' + i.toString() + '.svg'
                              : "emoticon_" + i.toString() + "_unselected.svg",
                          50)),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(emotions[i - 1],
                              textAlign: TextAlign.center,
                              style: getScreenWidth(context) > 380
                                  ? emotionSmallText
                                  : emotionSmallerText)))
                ]))));
  }
}
