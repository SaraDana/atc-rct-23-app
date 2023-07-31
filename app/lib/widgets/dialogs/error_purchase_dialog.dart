import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/screens/main/profile_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPurchaseDialog extends StatelessWidget {
  const ErrorPurchaseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        title: S.of(context).dialogErrorPurchasesTitle,
        bodyText: S.of(context).dialogErrorPurchasesDescription,
        buttonsSection: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CtaButton(
              onPressed: () => onContact(context),
              text: S.of(context).connectWithHelpButton,
              color: DanaTheme.paletteDarkBlue,
            ),
            DanaTextButton(
              onPressed: () => context.pop(),
              text: S.of(context).backButton,
              textColor: DanaTheme.paletteDarkBlue,
            ),
          ],
        ));
  }
}
