//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class ProfileQuestionNewHomeWidget extends StatelessWidget {
  final Function() onTap;
  const ProfileQuestionNewHomeWidget({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 300,
        margin: EdgeInsets.only(left: 10, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(162),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Container(
            color: DanaTheme.lightGrayColor,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(width: 10),
                Expanded(
                  child: Text(
                    S.of(context).screenHomePageProfileQuestion,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DanaTheme.textCta(DanaTheme.paletteOrange),
                  ),
                ),
                Container(width: 10),
                Icon(Icons.chevron_right, color: DanaTheme.paletteOrange),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
