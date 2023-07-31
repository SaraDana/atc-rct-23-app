import 'dart:io';

import 'package:app/data/services/appsflyer_manager.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:flutter/cupertino.dart';

import '../../config/constants.dart';
import '../../features/user/data/repositories/firebase_user_repository.dart';
import '../../models/mood_question/question_statement_model.dart';
import '../transformers/QuestionStatementTransformer.dart';
import 'analytics/dana_route_observer.dart';
import 'firebase_analytics_manager.dart';
import 'mixpanel_manager.dart';

enum FilterContentType { Programs, Social }

class DanaAnalyticsSessionInfo {
  //String? userType;
  String? platform;
  //int? age;
  DateTime? sessionInitTime;
  String? lastVisitedPage;
  bool hasSentUserRetained = false;
}

class DanaAnalyticsService {
  static final bool isDebugging = false;
  static DanaAnalyticsSessionInfo sessionInfo = new DanaAnalyticsSessionInfo();

  static FirebaseAnalyticsManager firebaseAnalyticsManager =
      new FirebaseAnalyticsManager();
  static AppsFlyerManager appsflyerManager = new AppsFlyerManager();
  static MixpanelManager mixpanelManager = new MixpanelManager();

  static initAnalytics() async {
    await mixpanelManager.init();
    appsflyerManager.init();

    sessionInfo.platform =
        Platform.operatingSystem == 'ios' ? 'ios' : 'android';
    sessionInfo.sessionInitTime = DateTime.now();
  }

  static List<NavigatorObserver> getAnalyticNavigatorObservers() {
    return [
      firebaseAnalyticsManager.getAnalyticNavigatorObserver(),
      new DanaRouteObserver()
    ];
  }

  static setExternalId(String propertyName, String? value) async {
    mixpanelManager.setExternalId(propertyName, value);
  }

  static updateUserInfo(String userEmail) async {
    final _userRepository = FirebaseUserRepository();
    NewUserModel? user = await _userRepository.getUserByEmail();
    if (user != null) {
      mixpanelManager.updateUserInfo(user);
      firebaseAnalyticsManager.updateUserInfo(user);
      appsflyerManager.updateUserInfo(user);
    }
    if (!sessionInfo.hasSentUserRetained) {
      sessionInfo.hasSentUserRetained = true;
      if (isUserRetained(registerDate: user?.createdAt, daysForRetention: 30)) {
        sendAnalyticToAppsflyer('user_retained');
      }
      if (isUserRetained(registerDate: user?.createdAt, daysForRetention: 14)) {
        sendAnalyticToAppsflyer('user_retained_14_days');
      }
      if (isUserRetained(registerDate: user?.createdAt, daysForRetention: 7)) {
        sendAnalyticToAppsflyer('user_retained_7_days');
      }
      if (isUserRetained(registerDate: user?.createdAt, daysForRetention: 3)) {
        sendAnalyticToAppsflyer('user_retained_3_days');
      }
      if (isUserRetained(registerDate: user?.createdAt, daysForRetention: 1)) {
        sendAnalyticToAppsflyer('user_retained_1_day');
      }
    }
  }

  static resetUserInfoBecauseLogout() {
    mixpanelManager.resetUserInfoBecauseLogout();
  }

  static sendAnalyticToMixPanel(String eventName,
      {Map<String, dynamic>? properties}) {
    mixpanelManager.sendAnalyticToMixPanel(eventName, sessionInfo, isDebugging,
        properties: properties);
  }

  static sendAnalyticToAppsflyer(String eventName,
      {Map<String, dynamic>? properties}) {
    appsflyerManager.sendAnalyticToAppsflyer(eventName, properties: properties);
  }

  static trackVisitPage(String pageName,
      {Map<String, dynamic>? additionalParams}) {
    Map<String, dynamic> properties = {
      'page_name': pageName,
      'entry_point': sessionInfo.lastVisitedPage
    };
    if (additionalParams != null) properties.addAll(additionalParams);
    sendAnalyticToMixPanel('visit_page', properties: properties);
    sessionInfo.lastVisitedPage = pageName;
  }

  static trackViewLinkContentPage(ProfileLinks profileLink,
      {Map<String, dynamic>? additionalParams}) {
    Map<String, dynamic> properties = {
      'entry_point': sessionInfo.lastVisitedPage
    };
    if (additionalParams != null) properties.addAll(additionalParams);
    if (profileLink == ProfileLinks.MY_FAVOURITES) {
      sendAnalyticToMixPanel('access_favourite_programs',
          properties: properties);
    } else if (profileLink == ProfileLinks.MY_PROGRESS) {
      sendAnalyticToMixPanel('access_my_progress', properties: properties);
    } else if (profileLink == ProfileLinks.WELCOME) {
      sendAnalyticToMixPanel('access_welcome', properties: properties);
    } else if (profileLink == ProfileLinks.HELP) {
      sendAnalyticToMixPanel('access_help', properties: properties);
    } else if (profileLink == ProfileLinks.COLLABORATORS) {
      sendAnalyticToMixPanel('access_collaborators', properties: properties);
    } else if (profileLink == ProfileLinks.PRIVACITY) {
      sendAnalyticToMixPanel('access_privacy', properties: properties);
    } else if (profileLink == ProfileLinks.TERMS_AND_CONDITIONS) {
      sendAnalyticToMixPanel('access_terms_and_conditions',
          properties: properties);
    } else if (profileLink == ProfileLinks.COOKIES) {
      sendAnalyticToMixPanel('access_cookies_policy', properties: properties);
    } else if (profileLink == ProfileLinks.HISTORY) {
      trackVisitPage("payment_history_page");
    } else if (profileLink == ProfileLinks.ACCOUNT) {
      DanaAnalyticsService.trackVisitPage("account_page");
    } else if (profileLink == ProfileLinks.SUBSCRIPTIONS) {
      DanaAnalyticsService.trackVisitPage("manage_subscription_page");
    } else if (profileLink == ProfileLinks.UNSUBSCRIBE) {
      String os = Platform.operatingSystem;
      DanaAnalyticsService.trackVisitPage("unsubscribe_page",
          additionalParams: {"os": os == "ios" ? "iOS" : "Android"});
    }
  }

  static trackContactDana() {
    Map<String, dynamic> properties = {
      'entry_point': sessionInfo.lastVisitedPage
    };
    sendAnalyticToMixPanel('contact_dana', properties: properties);
  }

  static trackShareDana() {
    Map<String, dynamic> properties = {
      'entry_point': sessionInfo.lastVisitedPage
    };
    sendAnalyticToMixPanel('share_dana', properties: properties);
  }

  static trackDeleteAccount() {
    Map<String, dynamic> properties = {
      'entry_point': sessionInfo.lastVisitedPage
    };
    sendAnalyticToMixPanel('delete_account', properties: properties);
  }

  static trackMainSectionSelected(String pageName) {
    sendAnalyticToMixPanel('click_footer', properties: {'page_name': pageName});
  }

  static trackMoodTrackerOpened() {
    sendAnalyticToMixPanel('init_moodtracker',
        properties: {'entry_point': sessionInfo.lastVisitedPage});
  }

  static trackMoodTrackerNewEntry(int? moodValue, bool hasText) {
    sendAnalyticToMixPanel('finish_moodtracker',
        properties: {'mood_score': moodValue, 'has_comment': hasText});
  }

  static trackTagFilterSelected(
      FilterContentType contentFiltered, String? tagId, String? tagName) {
    sendAnalyticToMixPanel('click_tags', properties: {
      'page_name': contentFiltered == FilterContentType.Programs
          ? 'programs_page'
          : 'social_page',
      'tag_id': tagId,
      'tag_name': tagName
    });
  }

  static trackUnitOpened(String? unitId, bool isAudioUnit) {
    trackVisitPage('unit_detail_page', additionalParams: {
      "unit_content_id": unitId,
      "unit_format": isAudioUnit ? 'audio' : 'text'
    });
  }

  static trackProgramOpened(String? programId, bool isPregnantWeekProgram) {
    trackVisitPage('program_detail_page', additionalParams: {
      "program_id": programId,
      "is_pregnant_week_program": isPregnantWeekProgram
    });
  }

  static trackUnitFinished(String? unitId, bool isAudioUnit) {
    sendAnalyticToMixPanel('finish_unit', properties: {
      'unit_id': unitId,
      'unit_format': isAudioUnit ? 'audio' : 'text'
    });
  }

  static trackUnitRating(
      String? unitId, bool isRatingPositive, bool isAudioUnit) {
    sendAnalyticToMixPanel('unit_rated', properties: {
      'unit_id': unitId,
      'is_rating_positive': isRatingPositive,
      'unit_format': isAudioUnit ? 'audio' : 'text'
    });
  }

  static trackCommunityLikedPublication(
      String? publicationId, bool activeLike, bool isPoll) {
    if (activeLike) {
      sendAnalyticToMixPanel('community_publication_liked',
          properties: {'publication_id': publicationId});
    } else {
      sendAnalyticToMixPanel('community_publication_liked',
          properties: {'publication_id': publicationId, 'undoing_like': true});
    }
  }

  static trackCommunityCommentedPublication(
      String? publicationId, bool isPoll, bool isSubcomment) {
    sendAnalyticToMixPanel('community_publication_commented',
        properties: {'publication_id': publicationId});
  }

  static trackCommunityBookmarkedPublication(
      String? publicationId, bool activeBookmark) {
    if (activeBookmark) {
      sendAnalyticToMixPanel('community_publication_bookmark_selected',
          properties: {'publication_id': publicationId});
    } else {
      sendAnalyticToMixPanel('community_publication_bookmark_selected',
          properties: {
            'publication_id': publicationId,
            'undoing_bookmark': true
          });
    }
  }

  static trackCommunityPollAnswered(String? publicationId) {
    sendAnalyticToMixPanel('community_poll_answered',
        properties: {'publication_id': publicationId});
  }

  static trackCommunityRulesSeen() {
    sendAnalyticToMixPanel('access_community_rules');
  }

  static trackUserProfileUpdated() {
    sendAnalyticToMixPanel('save_profile_data');
  }

  static trackFreeTrialStarted() {
    Map<String, dynamic> properties = {
      'entry_point': sessionInfo.lastVisitedPage
    };
    sendAnalyticToMixPanel('start_free_trial', properties: properties);
  }

  static trackViewPaywall() {
    DanaAnalyticsService.trackVisitPage("paywall_page");
    sendAnalyticToAppsflyer('view_paywall_2');
  }

  static trackUserLoggedIn(String loginChannel) {
    sendAnalyticToMixPanel('user_logged_in',
        properties: {"log_in_channel": loginChannel});
    sendAnalyticToAppsflyer('log_in',
        properties: {'loginMethod': loginChannel});
    firebaseAnalyticsManager.logLogin(loginChannel);
  }

  static trackUserRegistered(String loginChannel) {
    sendAnalyticToMixPanel('user_registered',
        properties: {"log_in_channel": loginChannel});
    sendAnalyticToAppsflyer('sign_Up',
        properties: {'signUpMethod': loginChannel});
    firebaseAnalyticsManager.logSignUp(loginChannel);
  }

  static trackUserLogout() {
    sendAnalyticToMixPanel('app_logout');
  }

  static trackUserTryLogout() {
    sendAnalyticToMixPanel('click_logout');
  }

  static trackUserRecapLogout() {
    sendAnalyticToMixPanel('recap_logout');
  }

  static trackUserTryDeleteAccount() {
    sendAnalyticToMixPanel('click_delete_account');
  }

  static trackUserRecapDeleteAccount() {
    sendAnalyticToMixPanel('recap_delete_account');
  }

  static trackOpenApp() {
    sendAnalyticToMixPanel('app_opened');
  }

  static trackBannerView(String openedFromPage, String bannerName) {
    sendAnalyticToMixPanel('view_banner', properties: {
      "banner_name": bannerName,
      "oppened_from_page": openedFromPage,
    });
  }

  static trackSentPhoneFromBanner(bannerName) {
    sendAnalyticToMixPanel('sent_phone_from_banner',
        properties: {"banner_name": bannerName});
  }

  static trackDismissBanner(bannerName) {
    sendAnalyticToMixPanel('dismiss_banner', properties: {
      "banner_name": bannerName,
    });
  }

  // ----------- From here, all are previous events that were sent and are not sent anymore

  static trackBannerInteraction(String cta, String bannerName) {
    sendAnalyticToMixPanel('banner_interaction',
        properties: {'cta': cta, 'banner_name': bannerName});
  }

  // changed event because now we are tracking its page
  //static trackProgramOpened(String? programId) {
  //  sendAnalyticToMixPanel('Program Opened',
  //      properties: {'programId': programId});
  //}

  static trackProgramUserFeelingsRating(
      String? programId, bool hasCompletedProgram, int rating) {
    sendAnalyticToMixPanel('user_feelings_program_rated', properties: {
      'program_id': programId,
      'has_completed_program': hasCompletedProgram,
      'rating': rating
    });
  }

  static trackProgramRating(String? programId, int rating) {
    sendAnalyticToMixPanel('program_rated',
        properties: {'program_id': programId, 'rating': rating});
  }

  static trackProgramFinished(String? programId) {
    sendAnalyticToMixPanel('program_finished',
        properties: {'program_id': programId});
  }

  static trackUnitBookmarked(String? unitId, bool bookmarked) {
    if (bookmarked) {
      sendAnalyticToMixPanel('unit_bookmarked',
          properties: {'unit_id': unitId});
    } else {
      sendAnalyticToMixPanel('unit_bookmarked',
          properties: {'unit_id': unitId, 'undoing_bookmark': true});
    }
  }

  // changed event because now we are tracking its page
  //static trackProfileSectionSelected(String optionSelected) {
  //  sendAnalyticToMixPanel('Profile Section Selected',
  //      properties: {'optionSelected': optionSelected});
  //}

  static trackCommunityLikedPublicationComment(
      String? publicationId, bool isCommentFromSpecialist, bool isPoll) {
    sendAnalyticToMixPanel('community_liked_publication_comment', properties: {
      'publication_id': publicationId,
      'is_comment_from_specialist': isCommentFromSpecialist
    });
  }

  static trackCommunityReportedComment(
      String? publicationId, String? commentId) {
    sendAnalyticToMixPanel('community_publication_comment_reported',
        properties: {'publication_id': publicationId, 'comment_id': commentId});
  }

  static trackCommunityCommentSectionSelected(
      String? publicationId, String section) {
    return;
    // this was sent when we had both mothers and specialists sections
    sendAnalyticToMixPanel('community_publication_section_selected',
        properties: {'publicationId': publicationId, 'section': section});
  }

  static trackCommunityRulesAccepted() {
    sendAnalyticToMixPanel('community_rules_accepted');
  }

  static trackHeaderProfileClick() {
    sendAnalyticToMixPanel('click_header_profile');
  }

  static trackHomeEditProfileClick() {
    sendAnalyticToMixPanel('click_home_header_edit_profile');
  }

  static trackHeaderBookmarkClick() {
    sendAnalyticToMixPanel('click_header_bookmark');
  }

  static trackHeaderInfoClick() {
    sendAnalyticToMixPanel('click_header_info');
  }

  static trackHomeOpenMoodtrackerClick() {
    sendAnalyticToMixPanel('click_home_open_moodtracker');
  }

  static trackMoodtrackerRatedRedirect(String pageName) {
    sendAnalyticToMixPanel('moodtracker_rated_redirect',
        properties: {'page_name': pageName});
  }

  static bool shownRecommendedProgram = false;

  static trackHomeOpenRecommendedProgramClick(String programId) {
    sendAnalyticToMixPanel('click_home_open_recommended_program',
        properties: {'program_id': programId});
  }

  static trackHomeShowRecommendedProgram(String programId) {
    if (shownRecommendedProgram) return;
    shownRecommendedProgram = true;
    sendAnalyticToMixPanel('show_home_recommended_program',
        properties: {'program_id': programId});
  }

  static bool shownRecommendedPublication = false;

  static trackHomeOpenRecommendedCommunityPublicationClick(
      String publicationId, bool isPoll) {
    sendAnalyticToMixPanel('click_home_open_recommended_community_publication',
        properties: {
          'publication_id': publicationId,
          'publication_type': isPoll ? 'poll' : 'post'
        });
  }

  static trackHomeShowRecommendedCommunityPublication(
      String publicationId, bool isPoll) {
    if (shownRecommendedPublication) return;
    shownRecommendedPublication = true;
    sendAnalyticToMixPanel('show_home_recommended_community_publication',
        properties: {
          'publication_id': publicationId,
          'publication_type': isPoll ? 'poll' : 'post'
        });
  }

  static trackHomeCommunityViewMoreClick() {
    sendAnalyticToMixPanel('click_home_community_view_more');
  }

  static trackHomeOngoingProgramClick(
      String programId, int shownProgramsCount, int programPosition) {
    sendAnalyticToMixPanel('click_home_ongoing_program', properties: {
      'shown_programs_count': shownProgramsCount,
      'program_id': programId,
      'program_position': programPosition
    });
  }

  static trackHomeOngoingProgramsViewMoreClick(int shownProgramsCount) {
    sendAnalyticToMixPanel('click_home_ongoing_programs_view_more',
        properties: {'shown_programs_count': shownProgramsCount});
  }

  static trackPublicationSpyEyeClick(String publicationId, bool isOpeningEye) {
    sendAnalyticToMixPanel('click_publication_spy_eye', properties: {
      'is_opening_eye': isOpeningEye,
      'publication_id': publicationId
    });
  }

  static trackSocialAuth({bool? isNewUser, required String provider}) {
    (isNewUser ?? false)
        ? trackUserRegistered(provider)
        : trackUserLoggedIn(provider);
  }

  static trackTryDismissPaywall() {
    sendAnalyticToMixPanel('try_dismiss_paywall');
  }

  static trackDismissPaywall() {
    sendAnalyticToMixPanel('dismiss_paywall');
  }

  static trackRecapPaywall() {
    sendAnalyticToMixPanel('recap_paywall');
  }

  static trackBuyProduct(String? productId, bool? isFirstUserPurchase) {
    sendAnalyticToMixPanel('buy_product', properties: {
      'product_id': productId,
      'is_first_user_purchase': isFirstUserPurchase
    });
    sendAnalyticToAppsflyer('intended_purchase');
  }

  static trackPaymentConfirmation(
      String? productId, bool? isFirstUserPurchase) {
    sendAnalyticToMixPanel('payment_confirmation', properties: {
      'product_id': productId,
      'is_first_user_purchase': isFirstUserPurchase
    });
    sendAnalyticToAppsflyer('payment_confirmation');
  }

  static trackPaymentIssue(String? issueId) {
    sendAnalyticToMixPanel('payment_issue',
        properties: {'issue_type': issueId});
  }

  static trackTryOpenUnitBlocked(
      String? unitId, bool blockedByPremium, bool blockedByConcatenated) {
    sendAnalyticToMixPanel('try_open_unit_blocked', properties: {
      'unit_id': unitId,
      'blocked_by_premium': blockedByPremium,
      'blocked_by_concatenated': blockedByConcatenated
    });
  }

  static trackPlan3m5pNoCreditLeft() {
    sendAnalyticToMixPanel('plan3m5p_no_credit_left');
  }

  static trackPlan3m5pUnblock(String? programId) {
    sendAnalyticToMixPanel('plan3m5p_unblock',
        properties: {'program_id': programId});
  }

  static trackPlan3m5pUnblockConfirm(String? programId, int creditsUsed) {
    sendAnalyticToMixPanel('plan3m5p_unblock_confirm',
        properties: {'program_id': programId, 'credits_used': creditsUsed});
  }

  static trackPlan3m5pUnblockCancel(String? programId) {
    sendAnalyticToMixPanel('plan3m5p_unblock_cancel',
        properties: {'program_id': programId});
  }

  static trackGoToCommunityFromUnit(String? unitId, String? url) {
    sendAnalyticToMixPanel('click_community_from_unit',
        properties: {'unit_id': unitId});
  }

  static trackClickLinkFromCommunity(String? url) {
    sendAnalyticToMixPanel('click_link_from_community',
        properties: {'url': url});
  }

  static trackOpenLink(Map<String, dynamic>? properties) {
    sendAnalyticToMixPanel('open_link', properties: properties);
  }

  static trackForceUpdateShown() {
    sendAnalyticToMixPanel('force_update_shown');
  }

  static trackForceUpdateClicked() {
    sendAnalyticToMixPanel('force_update_clicked');
  }

  static trackOnboardingComplete() {
    sendAnalyticToMixPanel('onboarding_complete');
    sendAnalyticToAppsflyer('onboarding_completed');
    firebaseAnalyticsManager.logOnBoardingCompleted();
  }

  static trackUnsubscribeToPremium(
      String productId, String unsubscribeDetectedAt, bool hadPaid) {
    sendAnalyticToMixPanel('app_unsubscribed', properties: {
      'product_id': productId,
      'unsubscribe_detected_at': unsubscribeDetectedAt,
      'had_paid': hadPaid
    });
    sendAnalyticToAppsflyer('app_unsubscribed', properties: {
      'product_id': productId,
      'unsubscribe_detected_at': unsubscribeDetectedAt,
      'had_paid': hadPaid
    });
  }

  static trackPremiumEnded(
      String productId, String unsubscribeDetectedAt, bool hadPaid) {
    sendAnalyticToMixPanel('app_subscription_ended', properties: {
      'product_id': productId,
      'unsubscribe_detected_at': unsubscribeDetectedAt,
      'had_paid': hadPaid
    });
    sendAnalyticToAppsflyer('app_subscription_ended', properties: {
      'product_id': productId,
      'unsubscribe_detected_at': unsubscribeDetectedAt,
      'had_paid': hadPaid
    });
  }

  static trackPremiumRenewed(String productId) {
    sendAnalyticToMixPanel('premium_renewed',
        properties: {'product_id': productId});
    sendAnalyticToAppsflyer('premium_renewed',
        properties: {'product_id': productId});
  }

  static trackAutoplayActivated(bool hasActivated) {
    sendAnalyticToMixPanel('autoplay_activation_change',
        properties: {'has_activated': hasActivated});
  }

  static trackShowRateUs() {
    sendAnalyticToMixPanel('pop_rate_us');
  }

  static trackSocialPageTag(String tagId) {
    sendAnalyticToMixPanel('social_page_tag_selected',
        properties: {'tag_id': tagId});
  }

  static trackNotificationCenterNotificationClicked(
      String notificationId, String notificationType) {
    sendAnalyticToMixPanel('notification_open', properties: {
      'notification_id': notificationId,
      'notification_type': notificationType
    });
  }

  static trackNotificationPermissionChanges(bool isAllowing) {
    sendAnalyticToMixPanel('notification_permission_change',
        properties: {'is_activated': isAllowing});
  }

  static trackShowMyWeeksPregnantHomeSection() {
    sendAnalyticToMixPanel('show_section_myweeks_pregnant');
  }

  static trackClickedMyWeeksPregnantHomeSection() {
    sendAnalyticToMixPanel('click_section_myweeks_pregnant');
  }

  static trackOpenedMyProgressPageSection(String sectionName) {
    // section name can be the equivalent for "my_weeks", "started", "completed
    trackVisitPage('my_progress', additionalParams: {'section': sectionName});
  }

  static trackExpandingMyweeksPregnancyTrimester(bool isExpanding) {
    sendAnalyticToMixPanel('click_myweeks_pregnant_expand',
        properties: {'is_expanding': isExpanding});
  }

  static bool isUserRetained(
      {DateTime? registerDate, DateTime? currentDate, int? daysForRetention}) {
    if (registerDate == null) return false;
    if (currentDate == null) currentDate = DateTime.now();
    if (daysForRetention == null) daysForRetention = 30;

    return registerDate
        .add(Duration(days: daysForRetention))
        .compareTo(currentDate)
        .isNegative;
  }

  static trackTutorialPageVisited(String tutorialForPageName) {
    trackVisitPage('tutorial_screen',
        additionalParams: {'tutorial_type': tutorialForPageName});
  }

  static trackEvolutionGraphicLoaded(
      bool isEmotion, int startTimestamp, int endTimestamp) {
    sendAnalyticToMixPanel('evolution_graphic_loaded', properties: {
      'info_type': isEmotion ? 'emotions' : 'invima_dimensions',
      'start_timestamp': startTimestamp,
      'end_timestamp': endTimestamp
    });
  }

  static trackShowForm(String formId, String userQuestionnaireId,
      {String? reason}) {
    sendAnalyticToMixPanel('show_form', properties: {
      'form_id': formId,
      'userQuestionnaireid': userQuestionnaireId,
      'reason': reason
    });
  }

  static submitForm(String formId, String userQuestionnaireId,
      List<QuestionStatementModel> statements) {
    List<Object> st = QuestionStatementTransformer
        .getMixpanelStatementListFromStatementModelList(statements);
    List<String> positivelyAnsweredQuestions = QuestionStatementTransformer
        .getMixpanelWithPositivelyStatementsFromStatementModel(statements);

    sendAnalyticToMixPanel('submit_form', properties: {
      'form_id': formId,
      'userQuestionnaireid': userQuestionnaireId,
      'statements': st,
      'positivelyAnsweredQuestions': positivelyAnsweredQuestions
    });
  }

  static trackShowQuestion(String questionId, String text) {
    sendAnalyticToMixPanel('show_question', properties: {
      'question_id': questionId,
      'text': text,
    });
  }

  static submitQuestionAnswer(QuestionStatementModel statement) {
    Map<String, dynamic>? st = QuestionStatementTransformer
        .getMixpanelSingleStatementFromStatementModel(statement);

    List<String> positivelyAnsweredQuestions = QuestionStatementTransformer
        .getMixpanelWithPositivelyStatementsFromStatementModel([statement]);

    sendAnalyticToMixPanel('submit_question_answer', properties: {
      'statements': st,
      'positivelyAnsweredQuestions': positivelyAnsweredQuestions
    });
  }

  static selectedSaviaHomeButton(String buttonType) {
    // buttonType = videoconsulta | chat24h
    sendAnalyticToMixPanel('selected_savia_home_button', properties: {
      'button_type': buttonType,
    });
  }

  static selectedSaviaDefinitiveOption(String optionType, String openedUrl) {
    // optionType = videoconsulta | chat24h
    sendAnalyticToMixPanel('selected_savia_definitive_option',
        properties: {'button_type': optionType, 'url': openedUrl});
  }

  static selectedMidWifeHomeButton() {
    sendAnalyticToMixPanel('selected_midwife_home_button');
  }

  static selectedMidwifeDefinitiveOption(String buttonType) {
    // optionType = online | home
    sendAnalyticToMixPanel('selected_midwife_definitive_option',
        properties: {'button_type': buttonType});
  }

  static selectedMidWifeLeavePhone() {
    sendAnalyticToMixPanel('selected_midwife_leave_phone');
  }

  static selectedMidWifeConfirmation() {
    sendAnalyticToMixPanel('selected_midwife_confirmation');
  }
}
