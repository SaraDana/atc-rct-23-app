//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class CookiesContentWidget extends StatelessWidget {
  const CookiesContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentCookiesContentPolicy}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentCookiesContentIdData}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentPersonalDataResponsible}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentCookiesContentATCData}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentUsedCookies}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentCookiesClassification}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentDetectedCookiesList}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentATCUsedCookies}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentNeededCookies}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentCookiesDetails}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentStatisticCookies}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentStatisticCookiesDetails}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentMarketingCookies}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentMarketingCookiesDetails}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentExternalSocialNetworkCookies}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentExternalSocialNetworkCookiesDetails}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentCookiesElimination}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentCookiesEliminationDetails}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentAdditionalNotes}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentCookiesContentAdditionalNotesDetails}\n\n',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue))
        ],
      ),
    );
  }
}
