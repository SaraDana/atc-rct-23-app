import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityRulesTitleWidget extends StatelessWidget {
  final String number;
  final String title;
  const CommunityRulesTitleWidget({
    Key? key,
    required this.number,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/dana_community_rules_numeration_background.svg',
                  alignment: Alignment.centerLeft,
                  height: 40,
                ),
                Center(
                    child: Text(number,
                        textAlign: TextAlign.center,
                        style: DanaTheme.textCta(DanaTheme.paletteDarkBlue)))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 8),
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
