//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/info.utils.dart';
import 'package:app/widgets/info/accept_rules_button_widget.dart';
import 'package:app/widgets/info/community_other_aspect_widget.dart';
import 'package:app/widgets/info/rules/community_expansion_rules_widget.dart';
import 'package:app/widgets/info/rules/community_rules_title_widget.dart';

class CommunityRules extends StatelessWidget {
  final double topInset;
  final double intraSectionMargin;
  final double interSectionMargin;
  final double listItemsMargin;
  const CommunityRules({
    Key? key,
    required this.topInset,
    required this.intraSectionMargin,
    required this.listItemsMargin,
    required this.interSectionMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: topInset),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${S.of(context).pageCommunityRulesWelcome}',
              style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
            ),
            Padding(
              padding: EdgeInsets.only(top: intraSectionMargin),
              child: Text(
                '${S.of(context).pageCommunityRulesIntro}',
                style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: interSectionMargin),
              child: Text(
                '${S.of(context).pageCommunityRulesNumerationTitle}',
                style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: intraSectionMargin),
              child: CommunityRulesTitleWidget(
                title: '${S.of(context).pageCommunityRulesNumeration1}',
                number: '01',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: listItemsMargin),
              child: CommunityRulesTitleWidget(
                title: '${S.of(context).pageCommunityRulesNumeration2}',
                number: '02',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: listItemsMargin),
              child: CommunityRulesTitleWidget(
                title: '${S.of(context).pageCommunityRulesNumeration3}',
                number: '03',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: listItemsMargin),
              child: CommunityRulesTitleWidget(
                  title: '${S.of(context).pageCommunityRulesNumeration4}',
                  number: '04'),
            ),
            Padding(
              padding: EdgeInsets.only(top: interSectionMargin),
              child: Text(
                '${S.of(context).pageCommunityRulesNumerationDetailIntro}',
                style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: intraSectionMargin),
              child: Text(
                '${S.of(context).pageCommunityRulesNumerationDetailIntro2}',
                style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: interSectionMargin),
                child: CommunityExpansionRulesWidget(
                  intraSectionMargin: intraSectionMargin,
                  listItemsMargin: listItemsMargin,
                )),
            Padding(
              padding: EdgeInsets.only(top: interSectionMargin),
              child: Text(
                '${S.of(context).pageCommunityRulesOtherAspectsTitle}',
                style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: intraSectionMargin),
              child: CommunityOtherAspectWidget(
                listItemsMargin: listItemsMargin,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: interSectionMargin),
              child: GestureDetector(
                onTap: () => InfoUtils().acceptRules(context),
                child: AcceptRulesButtonWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
