//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/UnorderedListItem.dart';

class CommunityRulesBody3Widget extends StatelessWidget {
  final double intraSectionMargin;
  final double listItemsMargin;
  const CommunityRulesBody3Widget({
    Key? key,
    required this.intraSectionMargin,
    required this.listItemsMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bulletContentStyle =
        DanaTheme.textBody(DanaTheme.paletteDarkBlue);
    TextStyle bulletStyle = DanaTheme.textBody(DanaTheme.paletteDarkBlue);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).pageCommunityRulesNumeration3Detail}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
            )),
        Padding(
            padding: EdgeInsets.only(top: intraSectionMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesNumeration3DetailPoint1}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
            padding: EdgeInsets.only(top: listItemsMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesNumeration3DetailPoint2}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
            padding: EdgeInsets.only(top: listItemsMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesNumeration3DetailPoint3}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
            padding: EdgeInsets.only(top: listItemsMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesNumeration3DetailPoint4}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
            padding: EdgeInsets.only(top: listItemsMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesNumeration3DetailPoint5}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
          padding: EdgeInsets.only(top: listItemsMargin),
          child: UnorderedListItem(
            Text(
              '${S.of(context).pageCommunityRulesNumeration3DetailPoint6}',
              style: bulletContentStyle,
            ),
            bulletStyle,
          ),
        ),
      ],
    );
  }
}
