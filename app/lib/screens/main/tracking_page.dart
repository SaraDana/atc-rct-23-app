//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/comments_number/comments_number_cubit.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_filter/mood_filter_cubit.dart';
import 'package:app/cubits/mood_cubit/mood_week/mood_week_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
//IMPORT INTERN APP
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/screens/info/moodtracker_info_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/moodtracker.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/moodtracker/mood_item_widget.dart';
import 'package:app/widgets/moodtracker/mood_section_widget.dart';
import 'package:app/widgets/moodtracker/mood_tracker_success_content_card.dart';
import 'package:app/widgets/shared/main_app_bar.dart';
import 'package:app/widgets/social/comments/load_more_comments_widget.dart';
import 'package:app/widgets/tooltips/moodtracker_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  var _weekDay = DateFormat('EEEE').format(DateTime.now());
  var _date = DateFormat.yMMMMd('es_ES').format(DateTime.now());
  late var _emotions;

  @override
  void initState() {
    locator<InitialProfileCubit>().getUserByEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _emotions = [
      S.of(context).widgetMoodTrackerDialogEmotion1,
      S.of(context).widgetMoodTrackerDialogEmotion2,
      S.of(context).widgetMoodTrackerDialogEmotion3,
      S.of(context).widgetMoodTrackerDialogEmotion4,
      S.of(context).widgetMoodTrackerDialogEmotion5,
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider<MoodWeekCubit>(
          create: (context) => MoodWeekCubit(),
        ),
        BlocProvider<MoodFilterCubit>(
          create: (context) => MoodFilterCubit(),
        ),
        BlocProvider<CommentsNumberCubit>(
          create: (context) => CommentsNumberCubit(),
        ),
      ],
      child: Stack(
        children: [
          Container(
            height: getScreenHeight(context),
            color: DanaTheme.paletteWhite,
            child: BlocBuilder<CommentsNumberCubit, CommentsNumberState>(
              builder: (context, stateCommentsNumber) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 170,
                          ),
                          BlocBuilder<UserMoodCubit, UserMoodState>(
                            bloc: locator<UserMoodCubit>(),
                            builder: (context, state) {
                              if (state.status == StatusCubit.ERROR) {
                                return Center(
                                    child: Text(
                                  "Ups something went wrong",
                                  //TODO : Make a error handle widget
                                ));
                              }
                              if (state.status == StatusCubit.INITIAL) {
                                locator<UserMoodCubit>().userMoodInit(
                                    isTrackerTutorialSeenInc: false);
                                return Center(
                                  child: const CircularProgressIndicator(
                                    color: DanaTheme.paletteFOrange,
                                  ),
                                );
                              }

                              if (state.status == StatusCubit.LOADING) {
                                return Center(
                                  child: const CircularProgressIndicator(
                                    color: DanaTheme.paletteFOrange,
                                  ),
                                );
                              }

                              if (state.status == StatusCubit.SUCCESS) {
                                return Column(
                                  children: [
                                    _welcomeWidget(),
                                    16.verticalSpace,
                                    MoodSectionWidget(
                                      userMoods: state.userMoods,
                                    ),
                                    16.h.verticalSpace,
                                    Container(
                                      child: state.emotion == -1 ||
                                              locator<UserMoodCubit>()
                                                      .state
                                                      .questionnaire ==
                                                  null
                                          ? _moodTodayEmptyWidget()
                                          : Container(
                                              child:
                                                  MoodTrackerSuccessContentCard(
                                                questionnaire:
                                                    locator<UserMoodCubit>()
                                                        .state
                                                        .questionnaire!,
                                                editButton: _editButton(),
                                              ),
                                            ),
                                    ),
                                    state.userMoods.length > 0
                                        ? Column(
                                            children: [
                                              Container(
                                                child: MediaQuery.removePadding(
                                                  context: context,
                                                  removeTop: true,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: (state.userMoods
                                                                .length >
                                                            stateCommentsNumber
                                                                .number)
                                                        ? stateCommentsNumber
                                                            .number
                                                        : state
                                                            .userMoods.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Column(
                                                        children: [
                                                          if (index == 0)
                                                            Container(
                                                                height: 20),
                                                          if (state
                                                                      .userMoods[
                                                                          index]
                                                                      .comment !=
                                                                  null &&
                                                              state
                                                                      .userMoods[
                                                                          index]
                                                                      .comment !=
                                                                  "")
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          DanaTheme
                                                                              .bodyPadding,
                                                                      vertical:
                                                                          4.h),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: (index ==
                                                                            0)
                                                                        ? Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child:
                                                                                Text(
                                                                              S.of(context).screenTrackingMyDiaryTitle,
                                                                              style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
                                                                            ),
                                                                          )
                                                                        : Container(),
                                                                  ),
                                                                  (index >= 1)
                                                                      ? Expanded(
                                                                          flex:
                                                                              1,
                                                                          child: (state.userMoods[index].at!.month != state.userMoods[index - 1].at!.month)
                                                                              ? Align(
                                                                                  alignment: Alignment.topRight,
                                                                                  child: MoodTrackerUtils().numberMonthToSpanishText(
                                                                                    context,
                                                                                    month: state.userMoods[index].at!.month,
                                                                                    otherText: " ${state.userMoods[index].at!.year}",
                                                                                    style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
                                                                                  ),
                                                                                )
                                                                              : Container(),
                                                                        )
                                                                      : Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.topRight,
                                                                            child:
                                                                                MoodTrackerUtils().numberMonthToSpanishText(
                                                                              context,
                                                                              month: state.userMoods[index].at!.month,
                                                                              otherText: " ${state.userMoods[index].at!.year}",
                                                                              style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (state
                                                                      .userMoods[
                                                                          index]
                                                                      .comment !=
                                                                  null &&
                                                              state
                                                                      .userMoods[
                                                                          index]
                                                                      .comment !=
                                                                  "")
                                                            MoodItemWidget(
                                                              userMood: state
                                                                      .userMoods[
                                                                  index],
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(height: 20),
                                              LoadMoreCommentsWidget(
                                                isSubcomment: false,
                                                commentsNumber:
                                                    state.userMoods.length,
                                                stateCommentsNumber:
                                                    stateCommentsNumber.number,
                                                loadText: 'ver más',
                                                colorText:
                                                    DanaTheme.paletteOrange,
                                                sizeText: 18,
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              CommentsNumberCubit>(
                                                          context)
                                                      .increment();
                                                },
                                              )
                                            ],
                                          )
                                        : Container(height: 10),
                                    SizedBox(
                                      height: 100,
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        MainAppBar(
                          title: S.of(context).screenTrackingBarTitle,
                          backgroundColor: DanaTheme.lightGrayColor,
                          showBookmark: false,
                          showInformation: true,
                          automaticallyImplyLeading: false,
                          onInformationPressed: () {
                            DanaAnalyticsService.trackHeaderInfoClick();
                            locator<InterestedEventCubit>()
                                .eventOfInterestHappened(
                                    EventOfInterestedType
                                        .NAVIGATE_MOODTRACKER_INFO,
                                    {});

                            DanaAnalyticsService.trackVisitPage(
                                'moodtracker_info_page');
                            context.pushNamed(AppRoutes.moodTrackerInfo.name);
                          },
                          onProfilePressed: () {
                            DanaAnalyticsService.trackHeaderProfileClick();
                            context.pushNamed(AppRoutes.profile.name);
                          },
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/bg_tracking_header.png',
                            height: 100,
                            alignment: Alignment.topCenter,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          BlocBuilder<UserMoodCubit, UserMoodState>(
              bloc: locator<UserMoodCubit>(),
              builder: (context, state) {
                if ((state.moodTrackerTutorialSeenCount != null &&
                        (state.moodTrackerTutorialSeenCount == 0 ||
                            state.moodTrackerTutorialSeenCount == 2)) &&
                    state.status == StatusCubit.SUCCESS)
                  return MoodTrackerToolTip();
                return SizedBox();
              }),
        ],
      ),
    );
  }

  _welcomeWidget() {
    return Container(
      height: 60,
      child: Column(
        children: [
          Text(
            '${S.of(context).screenTrackingHi} ${locator<InitialProfileCubit>().state.name}',
            style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
          ),
          Text(
            '$_weekDay $_date',
            style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
          ),
        ],
      ),
    );
  }

  _editButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(162)),
        width: double.infinity,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: DanaTheme.paletteDarkBlue, // foreground
            ),
            child: Text(S.of(context).screenTrackingButtonEditState,
                style: DanaTheme.textCta(DanaTheme.paletteWhite)),
            onPressed: () => _openMoodQuestion(),
          ),
        ),
      ),
    );
  }

  _openMoodQuestion() async {
    DanaAnalyticsService.trackMoodTrackerOpened();
    context.pushNamed(AppRoutes.moodTrackerDialog.name);
    locator<QuestionnareCubit>().startQuestionnare(
        questionnairesModel: locator<UserMoodCubit>().state.questionnaire,
        questionnareType: QuestionnareType.VITALITY_TRACKER);
  }

  _emotionWidget(int emotionSelected) {
    return Container(
      height: 60,
      width: 149,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(162),
          color: DanaTheme.paletteOrange,
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 2),
                color: DanaTheme.paletteOrange.withOpacity(0.3),
                spreadRadius: 0)
          ]),
      margin: EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: Container(
          color: DanaTheme.paletteOrange,
          padding: EdgeInsets.all(DanaTheme.emoticonPadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildSvgImage(
                  'emoticon_' + (emotionSelected).toString() + '.svg', 44),
              Container(
                  width: 70,
                  alignment: Alignment.center,
                  child: Text(_emotions[emotionSelected - 1],
                      textAlign: TextAlign.center,
                      style: DanaTheme.textSuperSmallTextBoldEmotions(
                          DanaTheme.paletteWhite)))
            ],
          ),
        ),
      ),
    );
  }

  // _editMoodTrackerInfo() {}

  _moodTodayEmptyWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(DanaTheme.bodyPadding),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: DanaTheme.bgCardColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: DanaTheme.paletteGreyShadow.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(S.of(context).screenTrackingStateQuestion,
              style: DanaTheme.textSubHeadline(DanaTheme.paletteDarkBlue)),
          Container(
            height: 11,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(162)),
            width: double.infinity,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: DanaTheme.paletteOrange, // foreground
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(S.of(context).screenHomePageChipMoodCheckin,
                          style: DanaTheme.textCta(DanaTheme.paletteWhite)),
                      Icon(Icons.chevron_right, color: DanaTheme.paletteWhite),
                    ]),
                onPressed: () => _openMoodQuestion(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
