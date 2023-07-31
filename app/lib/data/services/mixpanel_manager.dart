import 'package:app/features/user/domain/enums/mother_months_enum.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/tokens.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../core/di/locator.dart';
import '../../cubits/purchases/purchases_cubit.dart';
import 'dana_analytics_service.dart';

class MixpanelManager {
  static Mixpanel? _mixpanel;

  Future<void> init() async {
    if (_mixpanel == null) {
      _mixpanel =
          await Mixpanel.init(MIX_PANEL_TOKEN, optOutTrackingDefault: false);
    }
    return;
  }

  // functions to send to Mixpanel
  setExternalId(String propertyName, String? value) async {
    _mixpanel?.getPeople().set(propertyName, value);
  }

  updateUserInfo(NewUserModel user) {
    if (user.id == null) return;

    _mixpanel?.identify(user.id!);
    if (user.id != null)
      locator<PurchasesCubit>()
          .updateUserAttribute('\$mixpanelDistinctId', user.id!);

    _mixpanel?.getPeople().set("age", user.getUserAge());
    _mixpanel?.getPeople().set("appRole", user.appRole);
    _mixpanel?.getPeople().set("gender", user.genre);
    String? motherMonths = user.childBirthDate != null
        ? intToMotherMonths(user.calculateChildMonths())
        : user.motherMonths;
    _mixpanel?.getPeople().set("motherMonths", motherMonths);
    int? weeksPregnant = user.lastPeriod != null
        ? user.calculateWeeksPregnant()
        : user.pregnantWeeks;
    _mixpanel?.getPeople().set("pregnantWeeks", weeksPregnant);
    _mixpanel?.getPeople().set("profileMoment", user.profileMoment);
    _mixpanel
        ?.getPeople()
        .set("profileMotherExperience", user.profileMotherExperience);
    _mixpanel?.getPeople().set("danaUserName", user.name);
    _mixpanel?.getPeople().set("isPremiumGroupB",
        user.premiumGroupB != null ? user.premiumGroupB : false);

    _mixpanel
        ?.getPeople()
        .set("childBirthDate", user.childBirthDate.toString());

    _mixpanel
        ?.getPeople()
        .set("childCountSelection", user.childCountSelection.toString());
    _mixpanel?.getPeople().set("childCount", user.childCount.toString());
    _mixpanel
        ?.getPeople()
        .set("childBirthDates", user.childBirthDates.toString());
    _mixpanel?.getPeople().set("\$email", user.email);
    if (user?.id != null) {
      try {
        _mixpanel?.identify(user!.id!);
      } catch (e) {}
    }
  }

  String intToMotherMonths(int childMonths) {
    MotherMonths monthsEnum = MotherMonths.MONTHS_36_MORE;
    if (childMonths < 1)
      monthsEnum = MotherMonths.MONTHS_1_LESS;
    else if (childMonths <= 3)
      monthsEnum = MotherMonths.MONTHS_1_3;
    else if (childMonths <= 6)
      monthsEnum = MotherMonths.MONTHS_3_6;
    else if (childMonths <= 9)
      monthsEnum = MotherMonths.MONTHS_6_9;
    else if (childMonths <= 12)
      monthsEnum = MotherMonths.MONTHS_9_12;
    else if (childMonths <= 24)
      monthsEnum = MotherMonths.MONTHS_12_24;
    else if (childMonths <= 36) monthsEnum = MotherMonths.MONTHS_24_36;

    return monthsEnum.toString();
  }

  resetUserInfoBecauseLogout() {
    _mixpanel?.reset();
  }

  Map<String, dynamic> fillMixPanelPropertiesWithSessionInfo(
      Map<String, dynamic> properties, DanaAnalyticsSessionInfo sessionInfo) {
    int? sessionTimeSeconds;
    if (sessionInfo.sessionInitTime != null) {
      sessionTimeSeconds =
          DateTime.now().difference(sessionInfo.sessionInitTime!).inSeconds;
    }
    properties.addAll({
      //'user_type': sessionInfo.userType,
      'platform': sessionInfo.platform,
      //'age' : sessionInfo.age,
      //'tested_on': '12/01/2023',
      'session_time': sessionTimeSeconds,
    });
    return properties;
  }

  sendAnalyticToMixPanel(
      String eventName, DanaAnalyticsSessionInfo sessionInfo, bool isDebugging,
      {Map<String, dynamic>? properties}) {
    Map<String, dynamic>? finalProperties =
        fillMixPanelPropertiesWithSessionInfo(
            properties != null ? properties : {}, sessionInfo);
    if (isDebugging) {
      print('Sent analytic');
      print('    event:       ' + eventName);
      print('    properties:  ' + finalProperties.toString());
    } else if (_mixpanel != null) {
      _mixpanel!.track(eventName, properties: finalProperties);
    }
  }
}
