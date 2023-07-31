import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/dialogs/confirm_delete_account_dialog.dart';
import 'package:flutter/material.dart';

import '../../data/services/dana_analytics_service.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        title: S.of(context).screenProfileTitleFirstDeleteAccount,
        bodyText: S.of(context).screenProfileDescriptionFirstDeleteAccount,
        buttonsSection: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: CtaButton(
                onPressed: () {
                  DanaAnalyticsService.trackUserRecapDeleteAccount();
                  Navigator.of(context).pop();
                },
                text: S.of(context).screenProfileCancelDeleteAccount,
                color: DanaTheme.paletteOrange,
                textColor: DanaTheme.whiteColor,
              ),
            ),
            gapH8,
            DanaTextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ShowModal.showBottomSheet(
                    context: context, widget: ConfirmDeleteAccountDialog());
              },
              text: S.of(context).screenProfileConfirmDeleteAccount,
            ),
            gapH8,
          ],
        ));
  }
}
