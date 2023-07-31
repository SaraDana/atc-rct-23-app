import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class DeleteAccountSuccess extends StatelessWidget {
  const DeleteAccountSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        title: S.of(context).screenProfileSecondTitleDeleteAccount,
        bodyText: S.of(context).screenProfileSecondDescriptionDeleteAccount,
        buttonsSection: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: CtaButton(
                onPressed: () => Navigator.of(context).pop(),
                text: S.of(context).screenProfileSecondConfirmDeleteAccount,
                color: DanaTheme.paletteOrange,
                textColor: DanaTheme.whiteColor,
              ),
            ),
            gapH8,
          ],
        ));
  }
}
