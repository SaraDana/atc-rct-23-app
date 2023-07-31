//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT LOCAL APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/UnorderedListItem.dart';

class CommunityOtherAspectWidget extends StatelessWidget {
  final double listItemsMargin;
  const CommunityOtherAspectWidget({
    Key? key,
    required this.listItemsMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bulletContentStyle =
        DanaTheme.textBody(DanaTheme.paletteDarkBlue);
    TextStyle bulletStyle = DanaTheme.textBody(DanaTheme.paletteDarkBlue);
    return Column(
      children: [
        UnorderedListItem(
          Text(
            '${S.of(context).pageCommunityRulesOtherAspectsDetail1}',
            style: bulletContentStyle,
          ),
          bulletStyle,
        ),
        Padding(
            padding: EdgeInsets.only(top: listItemsMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesOtherAspectsDetail2}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
            padding: EdgeInsets.only(top: listItemsMargin),
            child: UnorderedListItem(
                Text(
                  '${S.of(context).pageCommunityRulesOtherAspectsDetail3}',
                  style: bulletContentStyle,
                ),
                bulletStyle)),
        Padding(
          padding: EdgeInsets.only(top: listItemsMargin),
          child: UnorderedListItem(
            Text(
              '${S.of(context).pageCommunityRulesOtherAspectsDetail4}',
              style: bulletContentStyle,
            ),
            bulletStyle,
          ),
        ),
      ],
    );
  }
}
