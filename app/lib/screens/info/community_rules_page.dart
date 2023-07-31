//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT LOCAL APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/utils/info.utils.dart';
import 'package:app/widgets/info/rules/cmmunity_rules_widget.dart';
import 'package:app/widgets/shared/social_app_bar.dart';

import '../../generated/l10n.dart';

class CommunityRulesPage extends StatefulWidget {
  @override
  _CommunityRulesPageState createState() => _CommunityRulesPageState();
}

class _CommunityRulesPageState extends State<CommunityRulesPage> {
  List<bool> _isOpen = [false, false, false, false, false];
  final double intraSectionMargin = 20;
  final double interSectionMargin = 25;
  final double listItemsMargin = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.whiteColor,
      body: _buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      height: getScreenHeight(context),
      color: DanaTheme.paletteWhite,
      child: Stack(
        children: [
          CommunityRules(
            topInset: 150,
            interSectionMargin: InfoUtils().infoInterSectionMargin(),
            intraSectionMargin: InfoUtils().infoIntraSectionMargin(),
            listItemsMargin: InfoUtils().infoListItemsMargin(),
          ),
          Column(
            children: [
              Container(
                height: 50,
                color: DanaTheme.bgAppbar,
              ),
              SocialAppBar(
                title: S.of(context).pageCommunityRulesTitle,
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
}
