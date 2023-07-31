//IMPORT EXTERN APP
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/enums/questionare_enum.dart';
import 'package:app/core/extensions/snackbar_extensions.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_state.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_state.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/mood_question/inner_question_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/user_mood/user_mood_question_badge_model.dart';
import 'package:app/utils/question_type_extention.dart';
import 'package:app/widgets/quesitons/mood_question.dart';
import 'package:app/widgets/quesitons/multi_quesiton.dart';
import 'package:app/widgets/quesitons/text_quesiton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/shared/custom_app_bar.dart';

class MoodTrackerDialogWidget extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: DanaTheme.whiteColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: BlocConsumer<QuestionnareCubit, QuestionnareState>(
          bloc: locator<QuestionnareCubit>(),
          listenWhen: (previous, current) {
            return previous.questionnareComplated !=
                current.questionnareComplated;
          },
          listener: (context, state) async {
            if (state.status == StatusCubit.SUCCESS &&
                state.questionnareEnum == QuestionareEnum.SUCCESS &&
                state.questionnareComplated) {
              context.replaceNamed(AppRoutes.moodTrackerDialogSuccess.name,
                  extra: state.questionnaire);
              // await locator<QuestionnareCubit>().endQuestionnaire();
            } else if (state.status == StatusCubit.ERROR) {
              context.showErrorSnackBar(message: state.errorMessage ?? "");
            } else if (state.status == StatusCubit.CHARGE_ERROR) {
              context.showErrorSnackBar(message: state.errorMessage ?? "");
            }
          },
          builder: (context, state) {
            return state.questionnaire == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: DanaTheme.paletteFOrange,
                    ),
                  )
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: state.questionnaire?.questions?.length,
                              itemBuilder: (context, index) {
                                QuestionStatementModel? statement =
                                    state.questionnaire?.statements?.firstWhere(
                                        (element) =>
                                            element.questionId ==
                                            state
                                                .questionnaire
                                                ?.questions?[index]
                                                .questionId, orElse: () {
                                  return QuestionStatementModel();
                                });

                                QuestionTypeEnum? questionType = state
                                    .questionnaire?.questions?[index].type
                                    ?.convertQuestionTypeToEnum();

                                if (questionType == QuestionTypeEnum.MOOD) {
                                  return _MoodTrackerTopArea(
                                    question:
                                        state.questionnaire?.questions?[index],
                                    statement: statement,
                                  );
                                }
                                if (questionType == QuestionTypeEnum.TEXT) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: DanaTheme.bodyPadding,
                                        right: DanaTheme.bodyPadding,
                                        bottom: 10),
                                    child: TextQuestionWidget(
                                        question: state
                                            .questionnaire?.questions?[index],
                                        statement: statement),
                                  );
                                }
                                if (questionType == QuestionTypeEnum.MULTI) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: DanaTheme.bodyPadding,
                                        right: DanaTheme.bodyPadding,
                                        bottom: 10),
                                    child: MultiQuestionWidget(
                                        question: state
                                            .questionnaire?.questions?[index],
                                        statement: statement),
                                  );
                                }
                                return Container();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: DanaTheme.bodyPadding,
                                  right: DanaTheme.bodyPadding,
                                  bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(162),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 19,
                                          offset: Offset(0, 4),
                                          color: locator<QuestionnareCubit>()
                                                  .state
                                                  .saveButtonIsActive
                                              ? DanaTheme
                                                  .paletteGreyTonesLightGrey20
                                              : DanaTheme.paletteOrange
                                                  .withOpacity(.2),
                                          spreadRadius: 0)
                                    ]),
                                width: double.infinity,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(120),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        splashFactory:
                                            locator<QuestionnareCubit>()
                                                    .state
                                                    .saveButtonIsActive
                                                ? null
                                                : NoSplash.splashFactory,
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            locator<QuestionnareCubit>()
                                                    .state
                                                    .saveButtonIsActive
                                                ? DanaTheme.paletteOrange
                                                : DanaTheme
                                                    .paletteGrey, // foreground
                                      ),
                                      child: state.questionnareEnum ==
                                              QuestionareEnum.LOADING
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: DanaTheme.paletteFOrange,
                                              ),
                                            )
                                          : Text(
                                              S
                                                  .of(context)
                                                  .widgetMoodTrackerDialogButtonSave,
                                              style: DanaTheme.textCta(
                                                  DanaTheme.paletteWhite)),
                                      onPressed: () {
                                        return locator<QuestionnareCubit>()
                                                .state
                                                .saveButtonIsActive
                                            ? locator<QuestionnareCubit>()
                                                .saveQuestionnaire(true)
                                            : null;
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (state.questionnareEnum == QuestionareEnum.LOADING)
                        Container(
                            color: DanaTheme.paletteFOrange.withOpacity(.7),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: DanaTheme.whiteColor,
                              ),
                            )),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

/*

*/
class _MoodTrackerTopArea extends StatelessWidget {
  QuestionModel? question;
  QuestionStatementModel? statement;

  _MoodTrackerTopArea({
    required this.question,
    required this.statement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
              title: S.of(context).widgetMoodTrackerDialogBarTitle,
              styleTitle:
                  DanaTheme.textSuperSmallTextBold(DanaTheme.paletteDarkBlue),
              bgColor: DanaTheme.paletteFPink,
              onBackPressed: () {
                if (context.canPop()) {
                  if (locator<UserMoodCubit>().state.emotionSelected !=
                      statement?.value)
                    locator<UserMoodCubit>()
                        .userMoodInit(isTrackerTutorialSeenInc: false);

                  context.pop();
                }
              }),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: DanaTheme.paletteFPink,
            child: Column(
              children: [
                Text(
                  S.of(context).widgetMoodTrackerDialogTitle1,
                  style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
                  textAlign: TextAlign.center,
                ),
                Container(height: 5),
                Text(
                  S.of(context).widgetMoodTrackerDialogSubtitle1,
                  style: DanaTheme.textSubHeadline(DanaTheme.paletteDarkBlue),
                  textAlign: TextAlign.center,
                ),
                gapH20,
                MoodQuestionWidget(
                  question: question,
                  statement: statement,
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/bg_moodtracker.svg',
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
