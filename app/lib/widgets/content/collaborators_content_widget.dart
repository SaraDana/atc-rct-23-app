//IMPORT EXTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
//IMPORT INTERN APP

class CollaboratorsContentWidget extends StatelessWidget {
  CollaboratorsContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          //p1
          TextSpan(
              text: '${S.of(context).pageLinkContentCollaboratorTitle1}',
              style: DanaTheme.textSubHeadlineBold(
                DanaTheme.paletteDarkBlue,
              )),
          WidgetSpan(
            child: SizedBox(
              height: 30,
            ),
          ),
          TextSpan(
            text: '${S.of(context).pageLinkContentCollaboratorDescription1}',
            style: DanaTheme.textBody(
              DanaTheme.paletteDarkBlue,
            ),
          ),
          //p2
          TextSpan(
              text: '${S.of(context).pageLinkContentCollaboratorTitle2}',
              style: DanaTheme.textSubHeadlineBold(
                DanaTheme.paletteDarkBlue,
              )),
          WidgetSpan(
            child: SizedBox(
              height: 30,
            ),
          ),
          TextSpan(
            text: '${S.of(context).pageLinkContentCollaboratorDescription2}',
            style: DanaTheme.textBody(
              DanaTheme.paletteDarkBlue,
            ),
          ),
          //p3
          TextSpan(
              text: '${S.of(context).pageLinkContentCollaboratorTitle3}',
              style: DanaTheme.textSubHeadlineBold(
                DanaTheme.paletteDarkBlue,
              )),
          WidgetSpan(
            child: SizedBox(
              height: 30,
            ),
          ),
          TextSpan(
            text: '${S.of(context).pageLinkContentCollaboratorDescription3}',
            style: DanaTheme.textBody(
              DanaTheme.paletteDarkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
