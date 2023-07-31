//IMPORT EXTERN APP
import 'dart:async';
import 'dart:math';

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/utils/remote_config/remote_config.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/cubits/myprogress/cubit/myprogress_cubit.dart';
//IMPORT INTERN APP
import 'package:app/cubits/question_new_home/question_new_home_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/cubits/recommended_programs/recommended_programs_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/cubits/user_mood/user_mood_state.dart';
import 'package:app/data/repositories/home_config/firebase_home_config_repository.dart';
import 'package:app/data/repositories/tag/firebase_tag_repository.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/generic_questionnare/cubit/onboarding_questionnare/generic_questionnare_cubit.dart';
import 'package:app/features/start_app/app/cubit/start_app_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/show_questionnare_model.dart';
import 'package:app/models/tag_model.dart';
import 'package:app/screens/content/publication_detail_page.dart';
import 'package:app/screens/main/profile_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/banner.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/preferences.dart';
import 'package:app/utils/recommended.utils.dart';
import 'package:app/widgets/new_home/mood_today_question_new_home_widget.dart';
import 'package:app/widgets/new_home/profile_question_new_home_widget.dart';
import 'package:app/widgets/new_home/profile_ready_new_home_widget.dart';
import 'package:app/widgets/new_home/sections/empty_recommended_programs_widget.dart';
import 'package:app/widgets/new_home/sections/one_recommended_program_widget.dart';
import 'package:app/widgets/new_home/welcome_body_new_home_widget.dart';
import 'package:app/widgets/program/program_item_widget.dart';
import 'package:app/widgets/program/program_recommended_widget.dart';
import 'package:app/widgets/shared/main_app_bar.dart';
import 'package:app/widgets/social/social_publication_recommended_widget.dart';
import 'package:app/widgets/tooltips/homepage_tooltip.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/vital_moment_recommended_post_model.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final FirebaseHomeConfigRepository _homeConfigRepository =
      FirebaseHomeConfigRepository(
    tagRepository: FirebaseTagRepository(),
  );

  // var _emotionSelected = -1;
  late String widgetNav;

  // late StreamSubscription<UserNavigationEvents> _subEvents;
  var _profileButtonClicked = false;
  StreamController<List<Tag>>? _tagController;
  String? _tagSelected;

  _getMoodQuestionState() async {
    setState(() {});

    bool questionareComplatedForToday =
        locator<UserMoodCubit>().checkIsComplatedToday();
    context
        .read<QuestionNewHomeCubit>()
        .changeShowMoodQuestion(questionareComplatedForToday);
    setState(() {});
    /*final moodQuestionDate = PreferenceUtils.getString(PREF_MOOD_QUESTION_DATE);
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    if (moodQuestionDate == formattedDate) {
      context
          .read<QuestionNewHomeCubit>()
          .changeShowMoodQuestion(questionareComplatedForToday);
      PreferenceUtils.setString(PREF_MOOD_QUESTION_DATE, formattedDate);
    } else {
      context
          .read<QuestionNewHomeCubit>()
          .changeShowMoodQuestion(questionareComplatedForToday);
    }*/
  }

  _openMoodQuestion() {
    DanaAnalyticsService.trackHomeOpenMoodtrackerClick();
    DanaAnalyticsService.trackMoodTrackerOpened();
    context.pushNamed(AppRoutes.moodTrackerDialog.name);
    locator<QuestionnareCubit>().startQuestionnare(
        questionnairesModel: locator<UserMoodCubit>().state.questionnaire,
        questionnareType: QuestionnareType.VITALITY_TRACKER);
    //_getMoodQuestionState();
  }

  checkQuestionnare() async {
    NewUserModel? user = await locator<InitialProfileCubit>().getUserByEmail();
    if (user != null) {
      bool showOnboarding =
          await locator<StartAppCubit>().checkIfOnboardingIsRequired(user);

      if (!showOnboarding &&
          locator<StartAppCubit>().state.questionnareId == null) {
        ShowQuestionnareModel? showQuestionnareModel =
            await locator<QuestionnareCubit>().getQustionnareIdToShow();

        if (showQuestionnareModel != null) {
          String? questionnareId = showQuestionnareModel.questionnaireId;

          if (questionnareId != null) {
            if (showQuestionnareModel.reason != null)
              await locator<GenericQuestionnareCubit>()
                  .startGenericQuestionnare(
                      questionnareId: questionnareId,
                      reason: showQuestionnareModel.reason);
            DanaAnalyticsService.trackShowForm(
                questionnareId,
                locator<QuestionnareCubit>()
                        .state
                        .questionnaire
                        ?.userQuestionnaireId ??
                    "",
                reason: showQuestionnareModel.reason);
            goRouter.goNamed(AppRoutes.genericQuestionnareHomePage.name);
          }
        }
      } else {}
    }
  }

  @override
  void initState() {
    super.initState();

    _tagController = StreamController<List<Tag>>.broadcast();
    this._getTags();

    _getProfileQuestionState(true,
        initialProfileState: locator<InitialProfileCubit>().state);
    _getMoodQuestionState();
    locator<InitialProfileCubit>().getUserByEmail();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RecommendedUtils().getRecommendedPrograms(context);
      RecommendedUtils().getRecommendedPost(context);
    });

    _getMoodQuestionState();

    checkQuestionnare();

    BannerUtils.checkVisibility('home');
  }

  @override
  void dispose() {
    // _subEvents.cancel();
    _tagController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendedProgramsCubit, RecommendedProgramsState>(
        listener: (context, state) {
      _getProfileQuestionState(false,
          initialProfileState: locator<InitialProfileCubit>().state);
    }, builder: (context, stateRecommended) {
      return BlocConsumer<InitialProfileCubit, InitialProfileState>(
        listener: (context, initialProfileState) {
          RecommendedUtils().getRecommendedSpecialPosts(context);
        },
        bloc: locator<InitialProfileCubit>(),
        builder: (context, initialProfileState) {
          return BlocBuilder<QuestionNewHomeCubit, QuestionNewHomeState>(
            builder: (context, stateQuestionNewHome) {
              return Stack(
                children: [
                  Scaffold(
                    backgroundColor: DanaTheme.paletteWhite,
                    body: Stack(
                      children: [
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: 260,
                            ),
                            MoodtrackerAndProfileWidget(
                                stateQuestionNewHome, initialProfileState),
                            // para tu acompantameento
                            _MatronasArea(),

                            // savia 2 container
                            if (locator<DanaRemoteConfig>().saviaChat24hUrl !=
                                    "" &&
                                locator<DanaRemoteConfig>()
                                        .saviaVideoConsultaUrl !=
                                    "") ...[
                              12.h.verticalSpace,
                              _ConsultaArea(),
                            ],

                            if (stateRecommended.motherRecommendedPost != null)
                              Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child:
                                      MotherRecommendedSocialPublicationWidget(
                                          stateRecommended)),
                            if (locator<InitialProfileCubit>()
                                    .state
                                    .initialProfileMoment ==
                                InitialProfileMoment.I_AM_PREGNANT) ...[
                              20.h.verticalSpace,
                              _SemanaCard(
                                  cubit: locator<MyprogressCubit>(),
                                  lastPeriod: locator<InitialProfileCubit>()
                                      .state
                                      .lastPeriod),
                            ],
                            if (stateRecommended.pregnancyRecommendedPost !=
                                null)
                              Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child:
                                      PregnancyRecommendedSocialPublicationWidget(
                                          stateRecommended)),

                            20.h.verticalSpace,
                            Column(
                              children: [
                                MyPrograms(stateRecommended),
                                20.h.verticalSpace,
                                if (stateRecommended
                                        .todayRecommendedProgram.programPath !=
                                    null)
                                  TodayRecommendedProgram(stateRecommended),
                                SizedBox(
                                  width: double.infinity,
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: SvgPicture.asset(
                                      'assets/images/bg_grey_small_header.svg',
                                      alignment: Alignment.bottomRight,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                DailyRecommendedSocialPublicationWidget(
                                    stateRecommended),
                                Container(
                                  height: 120,
                                  color: DanaTheme.paletteLightGrey
                                      .withOpacity(0.8),
                                )
                              ],
                            ),
                          ],
                        ),
                        _welcomeWidget(),
                      ],
                    ),
                  ),
                  if (initialProfileState.homePageTutorialSeenCount != null &&
                      (initialProfileState.homePageTutorialSeenCount == 0 ||
                          initialProfileState.homePageTutorialSeenCount == 2))
                    Scaffold(body: HomePageToolTip())
                ],
              );
            },
          );
        },
      );
    });
  }

  Widget _widgetMoodTodayReady() {
    return BlocBuilder<UserMoodCubit, UserMoodState>(
      bloc: locator<UserMoodCubit>(),
      builder: (context, state) {
        return Container(
          height: 60.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(162),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Container(
              color: DanaTheme.paletteOrange,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: buildSvgImage(
                              'emoticon_' +
                                  (state.emotionSelected).toString() +
                                  '.svg',
                              44),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          S.of(context).screenHomePageChipMoodReady,
                          style: DanaTheme.textCta(DanaTheme.paletteWhite),
                        ),
                      ],
                    ),
                    Icon(Icons.check, color: DanaTheme.paletteWhite),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _openProfileTest(InitialProfileState initialProfileState) {
    _navigateToIncompletePage(initialProfileState);
  }

  _welcomeWidget() {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, stateInitialProfile) {
        return Container(
          height: 280,
          child: Column(
            children: [
              MainAppBar(
                backgroundColor: DanaTheme.bgAppbar,
                showBookmark: false,
                showInformation: false,
                automaticallyImplyLeading: false,
                onProfilePressed: () {
                  DanaAnalyticsService.trackHeaderProfileClick();

//context.goNamed(AppRoutes.initialProfileOnboarding.name);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfilePage(), fullscreenDialog: true),
                  ).then((value) {
                    locator<InitialProfileCubit>().getUserByEmail();
                  });
                },
              ),
              WelcomeBodyNewHomeWidget(
                name:
                    '${S.of(context).screenHomePageHi} ${stateInitialProfile.name ?? " "}',
                profileMoment: stateInitialProfile.initialProfileMoment !=
                        InitialProfileMoment.NONE_OF_THE_ABOVE
                    ? initialProfileMomentToStringTraduction(
                        context, stateInitialProfile.initialProfileMoment)
                    : S.of(context).pageNewHomeDefineNewState,
                onPressed: () {
                  DanaAnalyticsService.trackHomeEditProfileClick();
                  context.pushNamed(AppRoutes.editProfile.name);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getTags() async {
    List<Tag> tags = await _homeConfigRepository.getAllTags();
    _tagController!.sink.add(tags);
  }

  _navigateToIncompletePage(InitialProfileState initialProfileState) {
    context.pushNamed(widgetNav);
    // Navigator.of(context)
    //     .push(
    //   MaterialPageRoute(builder: (_) => widgetNav, fullscreenDialog: true),
    // )
    //     .then((value) {
    //   _getProfileQuestionState(false, initialProfileState: initialProfileState);
    // });
  }

  _getProfileQuestionState(bool initial,
      {required InitialProfileState initialProfileState}) {
    context.read<QuestionNewHomeCubit>().changeInitialProfile(initial);

    widgetNav = AppRoutes.initialProfile1.name;
    if (initialProfileState.name == '') {
      widgetNav = AppRoutes.initialProfile1.name;
    } else if (initialProfileState.birthday == '') {
      widgetNav = AppRoutes.initialProfile2.name;
      // } else if (initialProfileState.genre == InitialProfileGenre.NO_ANSWER) {
      //   widgetNav = InitialProfilePage3();
    } else if (initialProfileState.selectedItemsProfileHelp.length < 1) {
      widgetNav = AppRoutes.initialProfile5.name;
    } else {
      context.read<QuestionNewHomeCubit>().changeShowProfileQuestion(false);
    }
  }

  void navigateToPublication(Publication publication) async {
    GoRouter.of(context).pushNamed(AppRoutes.publicationDetailPage.name,
        queryParams: {
          'publication_id': publication.id,
          'publication_title': publication.title
        },
        extra: PublicationDetailArguments(publication: publication));
  }

  Widget MoodtrackerAndProfileWidget(QuestionNewHomeState stateQuestionNewHome,
      InitialProfileState initialProfileState) {
    return Container(
      child: BlocBuilder<UserMoodCubit, UserMoodState>(
          bloc: locator<UserMoodCubit>(),
          builder: (context, userMoodState) {
            if (userMoodState.status == StatusCubit.LOADING) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: DanaTheme.paletteDanaPink,
                  color: DanaTheme.paletteFPink,
                ),
              );
            }
    
            return (stateQuestionNewHome.showProfileQuestion ||
                    !(stateQuestionNewHome.initialProfile ||
                        !_profileButtonClicked))
                ? Container(
                    height: 60.h,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(width: DanaTheme.bodyPadding),
                        stateQuestionNewHome.showMoodQuestion
                            ? MoodTodayQuestionNewHomeWidget(
                                onTap: () {
                                  DanaAnalyticsService.trackBannerInteraction(
                                      "mood-check-in", "home-welcome");
                                  _openMoodQuestion();
                                },
                              )
                            : _widgetMoodTodayReady(),
                        stateQuestionNewHome.showProfileQuestion
                            ? ProfileQuestionNewHomeWidget(
                                onTap: () {
                                  _profileButtonClicked = true;
                                  DanaAnalyticsService.trackBannerInteraction(
                                      "interest-registration", "home-welcome");
                                  _openProfileTest(initialProfileState);
                                },
                              )
                            : stateQuestionNewHome.initialProfile ||
                                    !_profileButtonClicked
                                ? Container(height: 0)
                                : ProfileReadyNewHomeWidget(),
                      ],
                    ),
                  )
                : Container(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 19,
                              offset: Offset(0, 4),
                              color: DanaTheme.paletteOrange.withOpacity(.2),
                              spreadRadius: 0)
                        ],
                      ),
                      height: 60.h,
                      child: locator<UserMoodCubit>().checkIsComplatedToday()
                          ? MoodTodayQuestionNewHomeWidget(
                              onTap: () {
                                DanaAnalyticsService.trackBannerInteraction(
                                    "mood-check-in", "home-welcome");
                                _openMoodQuestion();
                              },
                            )
                          : _widgetMoodTodayReady(),
                    ),
                  );
          }),
    );
  }

  Widget TodayRecommendedProgram(RecommendedProgramsState stateRecommended) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).recommendedToday,
                  style: DanaTheme.title4,
                ),
              ],
            ),
          ),
          if (stateRecommended.todayRecommendedProgram.programPath != null)
            Container(
              child: ProgramRecommendedWidget(
                  programPath:
                      stateRecommended.todayRecommendedProgram.programPath!,
                  programId:
                      stateRecommended.todayRecommendedProgram.programId!),
            ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget MyPrograms(RecommendedProgramsState stateRecommended) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).myProgramsRecommended,
                    style: DanaTheme.title4,
                  ),
                ],
              ),
            ),
            if (stateRecommended.recommendedPrograms.length > 1)
              TextButton(
                onPressed: () {
                  DanaAnalyticsService.trackHomeOngoingProgramsViewMoreClick(2);
                  context.read<ChangePageCubit>().changeIndexPage(index: 1);
                },
                child: Text(
                  S.of(context).pageNewHomeShowMore,
                  style: DanaTheme.textShowMore,
                ),
              )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (stateRecommended.recommendedPrograms.isNotEmpty)
              Flexible(
                child: Container(
                  child: ProgramItemWidget(
                    isWeekProgram: false,
                    isHomePage: true,
                    contextPage: context,
                    customImageHeight: 160.h,
                    programPath:
                        stateRecommended.recommendedPrograms[0].programPath!,
                    programId:
                        stateRecommended.recommendedPrograms[0].programId!,
                    position: 1,
                    tagFilter: '',
                    showCheck: false,
                    programSelectedCallback: () {
                      DanaAnalyticsService.trackHomeOngoingProgramClick(
                        stateRecommended.recommendedPrograms[0].programId!,
                        min(2, stateRecommended.recommendedPrograms.length),
                        1,
                      );
                    },
                  ),
                ),
              ),

            if (stateRecommended.recommendedPrograms.isNotEmpty)
              SizedBox(
                width: 8.w,
              ),
            // Section in case 1
            if (stateRecommended.recommendedPrograms.length > 1)
              Flexible(
                child: Container(
                  child: ProgramItemWidget(
                    isWeekProgram: false,
                    contextPage: context,
                    customImageHeight: 160.h,
                    programPath:
                        stateRecommended.recommendedPrograms[1].programPath!,
                    programId:
                        stateRecommended.recommendedPrograms[1].programId!,
                    position: 2,
                    tagFilter: '',
                    showCheck: false,
                    programSelectedCallback: () {
                      DanaAnalyticsService.trackHomeOngoingProgramClick(
                          stateRecommended.recommendedPrograms[0].programId!,
                          min(2, stateRecommended.recommendedPrograms.length),
                          2);
                    },
                  ),
                ),
              ),

            //Section in case 2
            if (stateRecommended.recommendedPrograms.length == 1)
              Flexible(
                child: OneRecommendedProgramWidget(),
              ),
            // Section 3
            if (stateRecommended.recommendedPrograms.isEmpty)
              Flexible(
                child: EmptyRecommendedProgramsWidget(
                  stateRecommended: stateRecommended,
                ),
              )
          ],
        ),
      )
    ]);
  }

  Widget DailyRecommendedSocialPublicationWidget(
      RecommendedProgramsState stateRecommended) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: DanaTheme.paletteLightGrey.withOpacity(0.8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).pageNewHomeRecommendPost,
                      style: DanaTheme.title4,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  DanaAnalyticsService.trackHomeCommunityViewMoreClick();
                  context.read<ChangePageCubit>().changeIndexPage(index: 2);
                },
                child: Text(
                  S.of(context).pageNewHomeShowMore,
                  style: DanaTheme.textShowMore,
                ),
              )
            ],
          ),
          (stateRecommended.todayRecommendedPost.publication != null)
              ? SocialPublicationRecommendedWidget(
                  publication:
                      stateRecommended.todayRecommendedPost.publication!,
                  onLikeTap: () {
                    setState(() {});
                  },
                  onBookmarkTap: () {
                    setState(() {});
                  },
                  onCommentTap: () {
                    DanaAnalyticsService
                        .trackHomeOpenRecommendedCommunityPublicationClick(
                            stateRecommended
                                .todayRecommendedPost.publication!.id!,
                            false);
                    navigateToPublication(
                        stateRecommended.todayRecommendedPost.publication!);
                  },
                  onPublicationSelected: () {
                    DanaAnalyticsService
                        .trackHomeOpenRecommendedCommunityPublicationClick(
                            stateRecommended
                                .todayRecommendedPost.publication!.id!,
                            false);
                    navigateToPublication(
                        stateRecommended.todayRecommendedPost.publication!);
                  },
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: CircularProgressIndicator(
                    backgroundColor: DanaTheme.paletteDanaPink,
                    color: DanaTheme.paletteFPink,
                  ),
                ),
        ],
      ),
    );
  }

  Widget PregnancyRecommendedSocialPublicationWidget(
      RecommendedProgramsState stateRecommended) {
    VitalMomentRecommendedPostModel? recommendedPostModel =
        stateRecommended.pregnancyRecommendedPost;
    return PregnancyOrMotherRecommendedSocialPublicationWidget(
        recommendedPostModel, S.of(context).pregnancyPostRecommendationTitle);
  }

  Widget MotherRecommendedSocialPublicationWidget(
      RecommendedProgramsState stateRecommended) {
    VitalMomentRecommendedPostModel? recommendedPostModel =
        stateRecommended.motherRecommendedPost;
    return PregnancyOrMotherRecommendedSocialPublicationWidget(
        recommendedPostModel, S.of(context).motherPostRecommendationTitle);
  }

  Widget PregnancyOrMotherRecommendedSocialPublicationWidget(
      VitalMomentRecommendedPostModel? recommendedPostModel, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Container(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: DanaTheme.title4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          (recommendedPostModel?.publication != null)
              ? SocialPublicationRecommendedWidget(
                  publication: recommendedPostModel!.publication!,
                  onLikeTap: () {
                    setState(() {});
                  },
                  onBookmarkTap: () {
                    setState(() {});
                  },
                  onCommentTap: () {
                    DanaAnalyticsService
                        .trackHomeOpenRecommendedCommunityPublicationClick(
                            recommendedPostModel.publication!.id!, false);
                    navigateToPublication(recommendedPostModel.publication!);
                  },
                  onPublicationSelected: () {
                    DanaAnalyticsService
                        .trackHomeOpenRecommendedCommunityPublicationClick(
                            recommendedPostModel.publication!.id!, false);
                    navigateToPublication(recommendedPostModel.publication!);
                  },
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: CircularProgressIndicator(
                    backgroundColor: DanaTheme.paletteDanaPink,
                    color: DanaTheme.paletteFPink,
                  ),
                ),
        ],
      ),
    );
  }
}

class _SemanaCard extends StatelessWidget {
  MyprogressCubit cubit;
  DateTime? lastPeriod;
  _SemanaCard({
    required this.cubit,
    required this.lastPeriod,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyprogressCubit, MyprogressState>(
      bloc: locator<MyprogressCubit>(),
      builder: (context, state) {
        if (!locator<MyprogressCubit>().isHomePageSectionShowed()) {
          DanaAnalyticsService.trackShowMyWeeksPregnantHomeSection();
          locator<MyprogressCubit>().setHomePageSectionShowed();
        }

        return lastPeriod == null
            ? Container()
            : locator<MyprogressCubit>()
                        .getProgramIdForUserWithPregnantDate(lastPeriod!) ==
                    null
                ? Container()
                : Column(
                    children: [
                      Container(
                        height: 40.h,
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).myProgressTabTextMisSemanas,
                              style: DanaTheme.title4,
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(
                                  AppRoutes.linkContent.name,
                                  queryParams: {
                                    "name": ProfileLinks.MY_PROGRESS.name,
                                    "tabId": "misSemanas"
                                  },
                                  extra: ProfileLinks.MY_PROGRESS,
                                );
                              },
                              child: Text(
                                S.of(context).seeMoreMyWeekText,
                                style: DanaTheme.textShowMore,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => cubit.onHomePageCardPressed(lastPeriod),
                        child: Container(
                          width: .9.sw,
                          height: 139,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                12,
                              ),
                            ),
                            image: DecorationImage(
                              image: svgProvider.Svg(
                                cubit.getBackgroundPath(lastPeriod),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 24.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${S.of(context).pageProfileEditWeek} ${cubit.getProgramWeek(lastPeriod)}",
                                      textAlign: TextAlign.center,
                                      style: DanaTheme.textHeadlineSmallLight(
                                        DanaTheme.paletteDarkBlue,
                                      ).copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}

class _ConsultaArea extends StatelessWidget {
  const _ConsultaArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DanaTheme.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCard(
                  context,
                  'home_consulta_left.svg',
                  S.of(context).homePageConsultaLeftText,
                  S.of(context).homePageConsultaLeftSubText,
                ),
                _buildCard(
                  context,
                  'home_consulta_right.svg',
                  S.of(context).homePageConsultaRightText,
                  S.of(context).homePageConsultaRightSubText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCard(context, String svgPath, String text, String subText) {
    return Container(
      width: .43.sw,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed(
              text == S.of(context).homePageConsultaLeftText
                  ? AppRoutes.consultationVideoPage.name
                  : AppRoutes.consultationChatPage.name);

          DanaAnalyticsService.selectedSaviaHomeButton(
              text == S.of(context).homePageConsultaLeftText
                  ? "videoconsulta"
                  : "chat24h");
        },
        child: Container(
          height: 127.w,
          decoration: BoxDecoration(
            color: DanaTheme.lightGrayColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 127.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: svgProvider.Svg(
                        '$ASSETS_IMAGES/$svgPath',
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.only(bottom: 10.h, left: 5.w, top: 30.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: DanaTheme.title3.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa"),
                      ),
                      5.h.verticalSpace,
                      Text(
                        subText,
                        style: DanaTheme.bodyText1WithFlex.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Comfortaa"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MatronasArea extends StatelessWidget {
  const _MatronasArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DanaTheme.bodyPadding),
      child: Column(
        children: [
          20.h.verticalSpace,
          Container(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).homePageMatronasAreaTitle,
                  style: DanaTheme.title4,
                ),
                TextButton(
                  onPressed: () {
                    DanaAnalyticsService.selectedMidWifeHomeButton();
                    GoRouter.of(context).goNamed(
                      AppRoutes.midwigeHomePage.name,
                    );
                  },
                  child: Text(
                    S.of(context).pageNewHomeShowMore,
                    style: DanaTheme.textShowMore,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
               DanaAnalyticsService.selectedMidWifeHomeButton();
              GoRouter.of(context).goNamed(
                AppRoutes.midwigeHomePage.name,
              );
            },
            child: Container(
              height: 139,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    '$ASSETS_IMAGES/matronas_bg_image.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              S.of(context).homePageMatronasCardText,
                              style: DanaTheme.title3.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Comfortaa"),
                            ),
                          ),
                          Container(
                            child: Text(
                              S.of(context).homePageMatronasCardSubText,
                              style: DanaTheme.title3.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Comfortaa"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
