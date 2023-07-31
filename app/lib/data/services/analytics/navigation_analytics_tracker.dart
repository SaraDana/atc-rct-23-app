import '../../../config/constants.dart';
import '../../../core/di/locator.dart';
import '../../../core/routing/app_router.dart';
import '../../../cubits/myprogress/cubit/myprogress_cubit.dart';
import '../../../screens/content/program_detail_page.dart';
import '../../../screens/content/publication_detail_page.dart';
import '../dana_analytics_service.dart';

class NavigationAnalyticsTracker {
  static void trackNavigation(String? page, Map<String, String>? extra) {
    if (page == null) return;
    if (page == AppRoutes.programDetailPage.name) {
      if (extra == null) return;
      String programId = extra['programId'] ?? '';
      bool isPregnantWeekProgram = false;
      if(locator<MyprogressCubit>().isMyProgressPregnantWeeksProgram(programId));
      DanaAnalyticsService.trackProgramOpened(programId, isPregnantWeekProgram);
    }
    if (page == AppRoutes.linkContent.name) {
      if (extra == null) return;
      DanaAnalyticsService.trackViewLinkContentPage(
          profileLinkFromString(extra["name"]));
    }
    if (page == AppRoutes.profile.name) {
      DanaAnalyticsService.trackVisitPage('profile_page');
    }
    if (page == AppRoutes.initialProfile1.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page1');
    }
    if (page == AppRoutes.initialProfile2.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page2');
    }
    if (page == AppRoutes.initialProfile3.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page3');
    }
    if (page == AppRoutes.initialProfile4.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page4');
    }
    if (page == AppRoutes.initialProfile5.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page5');
    }
    if (page == AppRoutes.initialProfile6.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page6');
    }
    if (page == AppRoutes.initialProfile7.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page7');
    }
    if (page == AppRoutes.initialProfile8.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page8');
    }
    if (page == AppRoutes.initialProfile9.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page9');
    }
    if (page == AppRoutes.initialProfile4Experience.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page4_experience');
    }
    if (page == AppRoutes.initialProfile4Pregnant.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page4_pregnant');
    }
    if (page == AppRoutes.initialProfile4Mother.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page4_mother');
    }
    if (page == AppRoutes.initialProfileOnboarding.name) {
      DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding');
    }
    if (page == AppRoutes.editProfile.name) {
      DanaAnalyticsService.trackVisitPage('profile_edit_page');
    }
    if (page == AppRoutes.forgotPassword.name) {
      DanaAnalyticsService.trackVisitPage('forgot_password_page');
    }
    if (page == AppRoutes.loginEmailPage.name) {
      DanaAnalyticsService.trackVisitPage('login_mail_page');
    }
    if (page == AppRoutes.login.name) {
      DanaAnalyticsService.trackVisitPage('login_page');
    }
    if (page == AppRoutes.registerEmailPage.name) {
      DanaAnalyticsService.trackVisitPage('register_mail_page');
    }
    if (page == AppRoutes.register.name) {
      DanaAnalyticsService.trackVisitPage('register_page');
    }
    if (page == AppRoutes.publicationDetailPage.name) {
      if (extra == null) return;

      DanaAnalyticsService.trackVisitPage('publication_detail_page',
          additionalParams: extra);
    }
    if (page == AppRoutes.socialBookmark.name) {
      DanaAnalyticsService.trackVisitPage('social_bookmark_page');
    }
    if (page == AppRoutes.communityRules.name) {
      DanaAnalyticsService.trackVisitPage('community_rules_page');
    }
    if (page == AppRoutes.welcome.name) {
      DanaAnalyticsService.trackVisitPage('onboarding_page');
    }
    if (page == AppRoutes.premiumDialog.name) {
      DanaAnalyticsService.trackViewPaywall();
    }
    if(page == AppRoutes.socialPage.name){
      DanaAnalyticsService.trackVisitPage('social_page', additionalParams: extra);
    }
    if(page == AppRoutes.notificationCenter.name){
      DanaAnalyticsService.trackVisitPage('notification_center');
    }
    if(page == AppRoutes.programDialogSuccess.name){
      DanaAnalyticsService.trackVisitPage('myweek_pregnant_finished');
    }
  }
}
