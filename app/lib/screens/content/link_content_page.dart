//IMPORT EXTERN APP
//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/screens/content/account_page.dart';
import 'package:app/screens/content/pay_history_page.dart';
import 'package:app/screens/content/plan_de_pago_page.dart';
import 'package:app/screens/content/unsubscription_guide_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/content.utils.dart';
import 'package:app/widgets/content/collaborators_content_widget.dart';
import 'package:app/widgets/content/cookies_content_widget.dart';
import 'package:app/widgets/content/help_content_widget.dart';
import 'package:app/widgets/content/privacy_content_widget.dart';
import 'package:app/widgets/content/science_behind_dana_content_widget.dart';
import 'package:app/widgets/content/terms_and_conditions_content_widget.dart';
import 'package:app/widgets/content/welcome_content_widget.dart';
import 'package:app/widgets/profile/my_progress_widget.dart';
import 'package:app/widgets/shared/social_app_bar.dart';
import 'package:flutter/material.dart';

import 'subscription_management_page.dart';

class LinkContentPage extends StatefulWidget {
  final ProfileLinks profileLink;
  String tabIdComingFromDeepLinks;

  LinkContentPage({
    Key? key,
    required this.profileLink,
    required this.tabIdComingFromDeepLinks,
  }) : super(key: key);

  @override
  _LinkContentPageState createState() => _LinkContentPageState();
}

class _LinkContentPageState extends State<LinkContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 155),
                child: _content(widget.tabIdComingFromDeepLinks),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                color: DanaTheme.bgAppbar,
              ),
              SocialAppBar(
                title: ContentUtils()
                    .getTitlesContent(context, profileLink: widget.profileLink),
                bgColor: DanaTheme.bgAppbar,
                showBackButton: true,
                showLogo: false,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _content(indexComingFromDeepLinks) {
    switch (widget.profileLink) {
      case ProfileLinks.WELCOME:
        return WelcomeContentWidget();
      case ProfileLinks.HELP:
        return HelpContentWidget();
      case ProfileLinks.COLLABORATORS:
        return CollaboratorsContentWidget();
      case ProfileLinks.PRIVACITY:
        return PrivacyContentWidget();
      case ProfileLinks.TERMS_AND_CONDITIONS:
        return TermsAndConditionsContentsWidget();
      case ProfileLinks.SCIENCE_BEHIND_DANA:
        return ScienceBehindDanaContentWidget();
      case ProfileLinks.COOKIES:
        return CookiesContentWidget();
      case ProfileLinks.MY_PROGRESS:
        return _myProgressContent(indexComingFromDeepLinks);
      case ProfileLinks.ACCOUNT:
        return AccountPage();
      case ProfileLinks.HISTORY:
        return PayHistoryPage();
      case ProfileLinks.SUBSCRIPTIONS:
        return SubscriptionManagementPage();
      case ProfileLinks.UNSUBSCRIBE:
        return UnSubscriptionGuidePage();
      case ProfileLinks.PLANDEPAGO:
        return PlanDePago();
      default:
        return Text('');
    }
  }

  Widget _myProgressContent(String tabIdComingFromDeepLinks) {
    locator<InterestedEventCubit>().eventOfInterestHappened(
        EventOfInterestedType.NAVIGATE_MY_PROGRESS, {});
    return MyProgress(
      tabIdComingFromDeepLinks: tabIdComingFromDeepLinks,
    );
  }
}
