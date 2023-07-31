//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_state.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/widgets/moodtracker/mood_tracker_success_content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

//IMPORT INTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/styles/dana_theme.dart';

class MoodTrackerSuccessDialogWidget extends StatelessWidget {
  QuestionnairesModel questionnaire;

  MoodTrackerSuccessDialogWidget({
    super.key,
    required this.questionnaire,
  });
  @override
  Widget build(BuildContext context) {
       DanaAnalyticsService.submitForm(
                  questionnaire.questionnaireId ?? "",
                 questionnaire.userQuestionnaireId ?? "",
                  questionnaire.statements ?? []);
    return Scaffold(
        backgroundColor: DanaTheme.paletteFPink,
        body: Container(
          color: DanaTheme.paletteFPink,
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              _PlatformElipse(),
              _GirlAndHeart(),
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                constraints: BoxConstraints(maxHeight: .6.sh),
                                child: MoodTrackerSuccessContentCard(
                                  questionnaire: questionnaire,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: .35.sw,
                                child: Container(
                                  width: 25,
                                  height: 16,
                                  child: SvgPicture.asset(
                                    'assets/images/dana_mood_tracker_success_girl_hand.svg',
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              )
                            ],
                          ),
                          _DoneButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class _PlatformElipse extends StatelessWidget {
  const _PlatformElipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        child: SvgPicture.asset(
          'assets/images/dana_mood_tracker_success_bottom_ellips.svg',
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}

class _GirlAndHeart extends StatelessWidget {
  const _GirlAndHeart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 1.sw,
        height: .7.sh,
        child: SvgPicture.asset(
          'assets/images/dana_mood_tracker_success_girl.svg',
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}

class _DoneButton extends StatelessWidget {
  const _DoneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocConsumer<UserMoodCubit, UserMoodState>(
        bloc: locator<UserMoodCubit>(),
        listener: (context, state) {},
        builder: (context, state) => GestureDetector(
          onTap: () {
            locator<QuestionnareCubit>().setInitial();
            locator<UserMoodCubit>().userMoodInit(isTrackerTutorialSeenInc: false);

            DanaAnalyticsService.trackMoodtrackerRatedRedirect("tracking_page");
            context.read<ChangePageCubit>().changeIndexPage(index: 3);
            context.goNamed(AppRoutes.home.name);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: Container(
                color: DanaTheme.paletteOrange,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      S.of(context).widgetMoodTrackerDialogSuccessButton1,
                      style: DanaTheme.textCta(DanaTheme.whiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
