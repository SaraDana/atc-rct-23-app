import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/cubits/delete_user/delete_user_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/dialogs/delete_account_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/dana_analytics_service.dart';

class ConfirmDeleteAccountDialog extends StatelessWidget {
  const ConfirmDeleteAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        title: S.of(context).screenProfileTitleDeleteAccount,
        bodyText: S.of(context).screenProfileDescriptionDeleteAccount,
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
                context.read<DeleteUserCubit>().setDeleteUser(
                    userId: locator<InitialProfileCubit>().state.id,
                    userEmail: locator<InitialProfileCubit>().state.email);
                ShowModal.showBottomSheet(
                    context: context, widget: DeleteAccountSuccess());
              },
              text: S.of(context).screenProfileConfirmDeleteAccount,
            ),
            gapH8,
          ],
        ));
  }
}
