//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class PrivacyContentWidget extends StatelessWidget {
  const PrivacyContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyPolicy}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyIntroduction}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyWhatIsDana}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyPersonalDataResponsibility}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyPersonalDataResponsible}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyTreatmentPrinciples}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyTreatmentPrinciples2}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataTitle}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyUserResponsability}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataOrigin}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataOrigin2}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataUse}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataFinality}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataLegitimate}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyDataLegitimate2}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataShare}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataTreatment}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataSecurity}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataProtection}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyConsent}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyConsent2}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyUnderage}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyUnderage2}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyThirdParty}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataTreatment}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyThirdPartyTreatment}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyThirdPartyLinks}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDataTime}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text:
                  '\n\n${S.of(context).pageLinkContentPrivacyDataConservation}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyRights}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyAccessRights}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyPolicyChanges}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyUpdates}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyContactUs}',
              style: DanaTheme.textTitle(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentPrivacyDoubts}\n\n',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue))
        ],
      ),
    );
  }
}
