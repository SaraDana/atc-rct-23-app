//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class WelcomeContentWidget extends StatelessWidget {
  const WelcomeContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentWelcomeTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentWelcomeMessage}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeMatrescenceTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeMatrescenceDescription}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentWelcomeDanaTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeDanaDescription}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeSocialImpactTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeSocialImpactDescription}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeStartingPointTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeStartingPointDescription}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeHelpingMotherhoodTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeHelpingMotherhoodDescription}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeCollaborateTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentWelcomeCollaborateDescription}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
        ],
      ),
    );
  }
}
