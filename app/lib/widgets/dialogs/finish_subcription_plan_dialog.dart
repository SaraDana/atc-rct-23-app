import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/screens/main/profile_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinishSubscriptionPlanDialog extends StatelessWidget {
  const FinishSubscriptionPlanDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        image: 'assets/images/dana_onboarding_page_1.svg',
        title: S.of(context).dialogFinishSubscriptionsTitle,
        bodyText: S.of(context).dialogFinishSubscriptionsMessage,
        buttonsSection: Column(
          children: [
            CtaButton(
                onPressed: () =>
                    context.pushNamed(AppRoutes.premiumDialog.name),
                text: S.of(context).dialogFinishProgramsButton,
                color: DanaTheme.paletteDarkBlue),
            DanaTextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onContact(context);
              },
              text: S.of(context).dialogFinishSubscriptionsButton,
            ),
          ],
        ));
  }
}
