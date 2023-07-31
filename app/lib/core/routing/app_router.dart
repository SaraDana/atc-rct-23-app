import 'dart:async';

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/auth/app/ui/pages/cookies_page.dart';
import 'package:app/features/auth/app/ui/pages/privacy_page.dart';
import 'package:app/features/auth/app/ui/pages/recover_password/recover_password_page.dart';
import 'package:app/features/auth/app/ui/pages/sign_in/sign_in_email_page.dart';
import 'package:app/features/auth/app/ui/pages/sign_in/sign_in_page.dart';
import 'package:app/features/auth/app/ui/pages/sign_up/sign_up_email_page.dart';
import 'package:app/features/auth/app/ui/pages/sign_up/sign_up_page.dart';
import 'package:app/features/auth/app/ui/pages/terms_conditions_page.dart';
import 'package:app/features/community/app/ui/pages/community_categories_page.dart';
import 'package:app/features/edit_profile/app/ui/pages/profile_edit_page.dart';
import 'package:app/features/generic_questionnare/pages/generic_question_home/generic_question_home_page.dart';
import 'package:app/features/midwife/app/ui/pages/midwife_home_page.dart';
import 'package:app/features/notifications/app/ui/screens/notifications_center_page.dart';
import 'package:app/features/onboarding/app/ui/pages/onboarding_page.dart';
import 'package:app/features/onboarding/app/ui/pages/onboarding_quetionnare.dart';
import 'package:app/features/start_app/app/cubit/start_app_cubit.dart';
import 'package:app/features/start_app/app/ui/start_app_page.dart';
import 'package:app/features/welcome/app/ui/pages/welcome_page.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/screens/account/initial_profile_page6.dart';
import 'package:app/screens/account/initial_profile_page7.dart';
import 'package:app/screens/account/initial_profile_page8.dart';
import 'package:app/screens/account/initial_profile_page9.dart';
import 'package:app/screens/content/link_content_page.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/screens/content/publication_detail_page.dart';
import 'package:app/screens/content/social_bookmark_page.dart';
import 'package:app/screens/content/unit_detail_page.dart';
import 'package:app/screens/info/community_rules_page.dart';
import 'package:app/screens/info/moodtracker_info_page.dart';
import 'package:app/screens/info/my_favourites_pages.dart';
import 'package:app/screens/main/home_screen.dart';
import 'package:app/screens/main/profile_page.dart';
import 'package:app/screens/main/social_page.dart';
import 'package:app/widgets/moodtracker/mood_tracker_dialog_widget.dart';
import 'package:app/widgets/moodtracker/mood_tracker_success_dialog_widget.dart';
import 'package:app/widgets/new_home/consultation_professional_chat_widget.dart';
import 'package:app/widgets/new_home/consultation_professional_video_widget.dart';
import 'package:app/widgets/premium/premium_dialog.dart';
import 'package:app/widgets/premium/premium_dialog_success.dart';
import 'package:app/widgets/profile/register_complate_pages/register_success_dialog_1_widget.dart';
import 'package:app/widgets/profile/register_complate_pages/register_success_dialog_2_widget.dart';
import 'package:app/widgets/profile/register_complate_pages/register_success_dialog_questionnare.dart';
import 'package:app/widgets/program/program_finished_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/services/dana_analytics_service.dart';

enum AppRoutes {
  home,
  login,
  register,
  profile,
  editProfile,
  initialProfileOnboarding,
  initialProfile1,
  initialProfile2,
  initialProfile3,
  initialProfile4,
  initialProfile5,
  initialProfile6,
  initialProfile7,
  initialProfile8,
  initialProfile9,
  initialProfile4Experience,
  welcome,
  loginEmailPage,
  registerEmailPage,
  forgotPassword,
  unitDetail,
  premiumDialog,
  premiumDialogSucces,
  moodTrackerDialog,
  linkContent,
  socialBookmark,
  communityRules,
  moodTrackerDialogSuccess,
  programDialogSuccess,
  initialProfile4Pregnant,
  initialProfile4Mother,
  programDetailPage,
  programDetailPageFadeClose,
  publicationDetailPage,
  myProgresPage,
  succesDialogPage1,
  succesDialogPage2,
  onboardingQuestionnarePage,
  onboardingQuestionnareSuccessPage,
  socialPage,
  termsAndConditions,
  cookies,
  privacity,
  favourites,
  startApp,
  community,
  notificationCenter,
  consultationChatPage,
  consultationVideoPage,
  moodTrackerInfo,
  genericQuestionnareHomePage,
  midwigeHomePage
}

final useBloc = locator<StartAppCubit>();

final List<String> routesWithoutAuth = [
  '/',
  '/welcome',
  '/welcome/register',
  '/welcome/register/email',
  '/welcome/login',
  '/welcome/login/email',
  '/welcome/login/email/forgotPassword',
  '/home/termsAndConditions',
  '/home/cookies',
  '/home/privacity',
];

final goRouter = GoRouter(
  refreshListenable: GoRouterRefreshStream(useBloc.stream),
  redirect: (context, state) {
    if (useBloc.state.isLogged == false &&
        !routesWithoutAuth.contains(state.location)) {
      return '/welcome';
    } else if ((useBloc.state.isLogged == true &&
        (state.location == '/register' ||
            state.location == '/register/email' ||
            state.location == '/welcome/register/email'))) {
      return '/home/initialProfileOnboarding';
    } else if (useBloc.state.isLogged == true &&
        (state.location == '/' ||
            state.location == '/login/email' ||
            state.location == '/login')) {
      return '/home';
    } else {
      return null;
    }
  },
  debugLogDiagnostics: true,
  observers: DanaAnalyticsService.getAnalyticNavigatorObservers(),
  routes: [
    GoRoute(
        path: '/',
        name: AppRoutes.startApp.name,
        builder: (context, state) => StartAppPage(),
        routes: [
          GoRoute(
              path: 'welcome',
              name: AppRoutes.welcome.name,
              builder: (context, state) {
                return WelcomePage();
              },
              routes: [
                GoRoute(
                  path: 'login',
                  name: AppRoutes.login.name,
                  builder: (context, state) {
                    return SignInPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'email',
                      name: AppRoutes.loginEmailPage.name,
                      builder: (context, state) {
                        return SignInEmailPage();
                      },
                      routes: [
                        GoRoute(
                          path: 'forgotPassword',
                          name: AppRoutes.forgotPassword.name,
                          builder: (context, state) {
                            return RecoverPasswordPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                GoRoute(
                    path: 'register',
                    name: AppRoutes.register.name,
                    builder: (context, state) {
                      return SignUpPage();
                    },
                    routes: [
                      GoRoute(
                        path: 'email',
                        name: AppRoutes.registerEmailPage.name,
                        builder: (context, state) {
                          return SignUpEmailPage();
                        },
                      ),
                    ]),
              ]),
        ]),
    GoRoute(
        path: '/home',
        name: AppRoutes.home.name,
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'genericQuestionnareHomePage',
            name: AppRoutes.genericQuestionnareHomePage.name,
            builder: (context, state) {
              return GenericQuestionnareHomePage();
            },
          ),
          GoRoute(
            path: 'initialProfileOnboarding',
            name: AppRoutes.initialProfileOnboarding.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                  child: OnboardingPage(), fullscreenDialog: true);
            },
            routes: [
              GoRoute(
                path: 'initialProfile6',
                name: AppRoutes.initialProfile6.name,
                builder: (context, state) {
                  return InitialProfilePage6();
                },
              ),
              GoRoute(
                path: 'initialProfile7',
                name: AppRoutes.initialProfile7.name,
                builder: (context, state) {
                  return InitialProfilePage7();
                },
              ),
              GoRoute(
                path: 'initialProfile8',
                name: AppRoutes.initialProfile8.name,
                builder: (context, state) {
                  return InitialProfilePage8();
                },
              ),
              GoRoute(
                path: 'initialProfile9',
                name: AppRoutes.initialProfile9.name,
                builder: (context, state) {
                  return InitialProfilePage9();
                },
              ),

              // GoRoute(
              //   path: 'initialProfile4Mother',
              //   name: AppRoutes.initialProfile4Mother.name,
              //   builder: (context, state) {
              //     NavigationAnalyticsTracker.trackNavigation(
              //         state.name, state.extra);
              //     return InitialProfilePage4Mother();
              //   },
              // ),
              GoRoute(
                path: 'succesDialogPage1',
                name: AppRoutes.succesDialogPage1.name,
                builder: (context, state) {
                  return RegisterSuccessDialog1Widget();
                },
              ),

              GoRoute(
                path: 'onboardingQuestionnareSuccessPage',
                name: AppRoutes.onboardingQuestionnareSuccessPage.name,
                builder: (context, state) {
                  return RegisterSuccessDialogQuestionnareWidget();
                },
              ),

              GoRoute(
                path: 'onboardingQuestionnarePage',
                name: AppRoutes.onboardingQuestionnarePage.name,
                builder: (context, state) {
                  return OnboardingQuestionnarePage();
                },
              ),

              GoRoute(
                path: 'succesDialogPage2',
                name: AppRoutes.succesDialogPage2.name,
                builder: (context, state) {
                  return RegisterSuccessDialog2Widget();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'profile',
            name: AppRoutes.profile.name,
            builder: (context, state) {
              return ProfilePage();
            },
          ),
          GoRoute(
            path: 'editProfile',
            name: AppRoutes.editProfile.name,
            builder: (context, state) {
              return ProfileEditPage();
            },
          ),
          GoRoute(
            path: 'socialBookmark',
            name: AppRoutes.socialBookmark.name,
            builder: (context, state) {
              return SocialBookmarkPage();
            },
          ),
          GoRoute(
            path: 'favourites',
            name: AppRoutes.favourites.name,
            builder: (context, state) => MyFavouritesPage(),
          ),
          GoRoute(
            path: 'communityRules',
            name: AppRoutes.communityRules.name,
            builder: (context, state) {
              return CommunityRulesPage();
            },
          ),
          GoRoute(
            path: 'moodTrackerInfo',
            name: AppRoutes.moodTrackerInfo.name,
            builder: (context, state) {
              return MoodtrackerInfoPage();
            },
          ),
          GoRoute(
            path: 'moodTrackerDialog',
            name: AppRoutes.moodTrackerDialog.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                  child: MoodTrackerDialogWidget(), fullscreenDialog: true);
            },
          ),
          GoRoute(
            path: 'moodTrackerDialogSuccess',
            name: AppRoutes.moodTrackerDialogSuccess.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                  child: MoodTrackerSuccessDialogWidget(
                    questionnaire: state.extra as QuestionnairesModel,
                  ),
                  fullscreenDialog: true);
            },
          ),
          GoRoute(
            path: 'programDialogSuccess',
            name: AppRoutes.programDialogSuccess.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                  child: ProgramSuccessDialogWidget(), fullscreenDialog: true);
            },
          ),
          GoRoute(
            path: 'premiumDialog',
            name: AppRoutes.premiumDialog.name,
            builder: (context, state) {
              return PremiumDialog(
                programId: state.queryParams["programId"] ?? "",
              );
            },
          ),
          GoRoute(
            path: 'premiumDialogSuccess',
            name: AppRoutes.premiumDialogSucces.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                  child: PremiumDialogSuccess(), fullscreenDialog: true);
            },
          ),
          GoRoute(
            path: 'unitDetail',
            name: AppRoutes.unitDetail.name,
            builder: (context, state) {
              return UnitDetailPage(
                  unitDetailPageObject: state.extra as UnitDetailPageObject);
            },
          ),
          GoRoute(
            path: 'termsAndConditions',
            name: AppRoutes.termsAndConditions.name,
            builder: (context, state) {
              return TermsConditionsPage(
                  profileLink: state.extra as ProfileLinks);
            },
          ),
          GoRoute(
            path: 'cookies',
            name: AppRoutes.cookies.name,
            builder: (context, state) {
              return CookiesPage(profileLink: state.extra as ProfileLinks);
            },
          ),
          GoRoute(
            path: 'privacity',
            name: AppRoutes.privacity.name,
            builder: (context, state) {
              return PrivacyPage(profileLink: state.extra as ProfileLinks);
            },
          ),
          GoRoute(
            path: 'linkContent',
            name: AppRoutes.linkContent.name,
            builder: (context, state) {
              return LinkContentPage(
                profileLink: state.extra as ProfileLinks,
                tabIdComingFromDeepLinks:
                    state.queryParams["tabId"] ?? "enProgreso",
              );
            },
          ),
          GoRoute(
            path: 'programDetailPage',
            name: AppRoutes.programDetailPage.name,
            builder: (context, state) {
              return ProgramDetailPage(
                  arguments: state.extra as ProgramDetailArguments);
            },
          ),
          GoRoute(
            path: 'programDetailPageFadeClose',
            name: AppRoutes.programDetailPageFadeClose.name,
            pageBuilder: (_, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: ProgramDetailPage(
                    arguments: state.extra as ProgramDetailArguments),
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              );
            },
          ),
          GoRoute(
            path: 'publicationDetailPage',
            name: AppRoutes.publicationDetailPage.name,
            builder: (context, state) {
              return PublicationDetailPage(
                  arguments: state.extra as PublicationDetailArguments);
            },
          ),
          GoRoute(
            path: 'consultationChatPage',
            name: AppRoutes.consultationChatPage.name,
            builder: (context, state) {
              return ConsultationProfessionalChatPage();
            },
          ),
            GoRoute(
            path: 'consultationVideoPage',
            name: AppRoutes.consultationVideoPage.name,
            builder: (context, state) {
              return ConsultationProfessionalVideoPage();
            },
          ),
          GoRoute(
            path: 'midwigeHomePage',
            name: AppRoutes.midwigeHomePage.name,
            builder: (context, state) {
              return MidwifeHomePage();
            },
          ),
          GoRoute(
              path: 'community',
              name: AppRoutes.community.name,
              builder: (context, state) {
                return CommunityCategoriesPage();
              },
              routes: [
                GoRoute(
                  path: 'socialPage',
                  name: AppRoutes.socialPage.name,
                  builder: (context, state) {
                    return SocialPage();
                  },
                ),
              ]),
          GoRoute(
              path: 'notificationCenter',
              name: AppRoutes.notificationCenter.name,
              builder: (context, state) => NotificationCenterPage()),
        ]),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
