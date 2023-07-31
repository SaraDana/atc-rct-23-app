import 'package:app/config/constants.dart';
import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/utils/app_functions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:io' show Platform;

class PlanDePago extends StatelessWidget {
  const PlanDePago({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).subscriptionPageButton,
          textAlign: TextAlign.center,
          style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
        ),
        gapH24,
        Text(S.of(context).planDeGoDescription,
            textAlign: TextAlign.center,
            style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
        gapH24,
        SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () {
              AppFunctions.onOpenStorePressed();
            },
            text: S.of(context).subscriptionPageButton2,
            color: DanaTheme.whiteColor,
            textColor: DanaTheme.paletteDarkBlue,
          ),
        ),
      ],
    );
  }
}
