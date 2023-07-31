//IMPORT EXTERN APP
import 'package:app/widgets/info/moodtracker/moodtracker_expansion_body1_widget.dart';
import 'package:app/widgets/info/moodtracker/moodtracker_expansion_body2_widget.dart';
import 'package:app/widgets/info/moodtracker/moodtracker_expansion_body3_widget.dart';
import 'package:app/widgets/info/moodtracker/moodtracker_expansion_body4_widget.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/info/rules/community_rules_body1_widget.dart';
import 'package:app/widgets/info/rules/community_rules_body2_widget.dart';
import 'package:app/widgets/info/rules/community_rules_body3_widget.dart';
import 'package:app/widgets/info/rules/community_rules_body4_widget.dart';

class MoodTrackerExpansionsWidget extends StatefulWidget {
  final double intraSectionMargin;
  final double listItemsMargin;
  MoodTrackerExpansionsWidget({
    Key? key,
    required this.intraSectionMargin,
    required this.listItemsMargin,
  }) : super(key: key);

  @override
  State<MoodTrackerExpansionsWidget> createState() =>
      _MoodTrackerExpansionsWidgetState();
}

class _MoodTrackerExpansionsWidgetState
    extends State<MoodTrackerExpansionsWidget> {
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
                    S.of(context).moodTrackerExpansionTitle1Text,
                    style: DanaTheme.textSubHeadlineBold(
                        DanaTheme.paletteDarkBlue),
                  ));
            },
            body: MoodTrackerExpansionBody1(
              intraSectionMargin: widget.intraSectionMargin,
              listItemsMargin: widget.listItemsMargin,
            ),
            isExpanded: _isOpen[0]),
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).moodTrackerExpansionTitle2Text,
                  style:
                      DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
                ));
          },
          body: MoodTrackerExpansionBody2(
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
                S.of(context).moodTrackerExpansionTitle3Text,
                style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
              ),
            );
          },
          body: MoodTrackerExpansionBody3(
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
                S.of(context).moodTrackerExpansionTitle4Text,
                style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
              ),
            );
          },
          body: MoodTrackerExpansionBody4(
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
