import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/ui/widgets/buttons/dana_text_button.dart';

class ExitPurchaseDialog extends StatelessWidget {
  String programId;
  ExitPurchaseDialog({Key? key, required this.programId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        image: 'assets/images/dialogs/exit_dialog.svg',
        title: S.of(context).dialogExitPurchaseTitle,
        bodyText: S.of(context).dialogExitPurchaseDescription,
        buttonsSection: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: CtaButton(
                onPressed: () {
                  DanaAnalyticsService.trackRecapPaywall();
                  Navigator.of(context).pop();
                },
                text: S.of(context).dialogErrorButtonPlan,
                textColor: DanaTheme.whiteColor,
                color: DanaTheme.paletteDarkBlue,
              ),
            ),
            DanaTextButton(
              onPressed: () {
                DanaAnalyticsService.trackDismissPaywall();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                if (programId != "") {
                  context.goNamed(
                    AppRoutes.programDetailPageFadeClose.name,
                    queryParams: {
                      "programId": programId,
                    },
                    extra: ProgramDetailArguments(
                      programId: programId,
                      onBackPressed: () {},
                    ),
                  );
                }
              },
              text: S.of(context).dialogErrorButtonBack,
              textColor: DanaTheme.paletteDarkBlue,
            ),
          ],
        ));
  }
}
