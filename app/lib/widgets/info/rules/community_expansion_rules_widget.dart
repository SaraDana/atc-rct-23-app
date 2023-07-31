//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/info/rules/community_rules_body1_widget.dart';
import 'package:app/widgets/info/rules/community_rules_body2_widget.dart';
import 'package:app/widgets/info/rules/community_rules_body3_widget.dart';
import 'package:app/widgets/info/rules/community_rules_body4_widget.dart';

class CommunityExpansionRulesWidget extends StatefulWidget {
  final double intraSectionMargin;
  final double listItemsMargin;
  CommunityExpansionRulesWidget({
    Key? key,
    required this.intraSectionMargin,
    required this.listItemsMargin,
  }) : super(key: key);

  @override
  State<CommunityExpansionRulesWidget> createState() =>
      _CommunityExpansionRulesWidgetState();
}

class _CommunityExpansionRulesWidgetState
    extends State<CommunityExpansionRulesWidget> {
  List<bool> _isOpen = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      dividerColor: Colors.transparent,
      elevation: 0,
      children: [
        ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${S.of(context).pageCommunityRulesNumeration1}',
                    style: DanaTheme.textSubHeadlineBold(
                        DanaTheme.paletteDarkBlue),
                  ));
            },
            body: CommunityRulesBody1Widget(
              intraSectionMargin: widget.intraSectionMargin,
              listItemsMargin: widget.listItemsMargin,
            ),
            isExpanded: _isOpen[0]),
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${S.of(context).pageCommunityRulesNumeration2}',
                  style:
                      DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
                ));
          },
          body: CommunityRulesBody2Widget(
            intraSectionMargin: widget.intraSectionMargin,
            listItemsMargin: widget.listItemsMargin,
          ),
          isExpanded: _isOpen[1],
        ),
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${S.of(context).pageCommunityRulesNumeration3}',
                style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
              ),
            );
          },
          body: CommunityRulesBody3Widget(
            intraSectionMargin: widget.intraSectionMargin,
            listItemsMargin: widget.listItemsMargin,
          ),
          isExpanded: _isOpen[2],
        ),
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${S.of(context).pageCommunityRulesNumeration4}',
                style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
              ),
            );
          },
          body: CommunityRulesBody4Widget(
            intraSectionMargin: widget.intraSectionMargin,
            listItemsMargin: widget.listItemsMargin,
          ),
          isExpanded: _isOpen[3],
        ),
      ],
      expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
    );
  }
}
