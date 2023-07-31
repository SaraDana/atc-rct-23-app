import 'dart:io';

import 'package:app/config/constants.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/utils/app_functions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UnSubscriptionGuidePage extends StatelessWidget {
  const UnSubscriptionGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return Column(
      children: [
        Text(
          isIos
              ? S.of(context).unsubscribeDialogQuestionIos1
              : S.of(context).unsubscribeDialogQuestionAndroid1,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH8,
        Text(
          isIos
              ? S.of(context).unsubscribeDialogAskIos1
              : S.of(context).unsubscribeDialogAskAndroid1,
          style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
        ),
        gapH8,
        Text(
          isIos
              ? S.of(context).unsubscribeDialogQuestionIos2
              : S.of(context).unsubscribeDialogQuestionAndroid2,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH8,
        Text(
          isIos
              ? S.of(context).unsubscribeDialogAskIos2
              : S.of(context).unsubscribeDialogAskAndroid2,
          style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
        ),

        gapH8,
        Text(
          isIos
              ? S.of(context).unsubscribeDialogAskIos3
              : S.of(context).unsubscribeDialogAskAndroid3,
          style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
        ),
        gapH24,
        SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () async {
             AppFunctions.onOpenStorePressed();
            },
            text: S.of(context).goToStore,
            color: DanaTheme.whiteColor,
            textColor: DanaTheme.paletteDarkBlue,
          ),
        ),
        gapH64,
      ],
    );
  }


}
