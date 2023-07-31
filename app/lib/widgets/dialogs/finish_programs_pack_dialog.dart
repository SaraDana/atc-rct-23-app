import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../styles/dana_theme.dart';

class FinishProgramsPackDialog extends StatelessWidget {
  const FinishProgramsPackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        image: 'assets/images/dana_onboarding_page_1.svg',
        title: S.of(context).dialogFinishProgramsTitle,
        bodyText: S.of(context).dialogFinishProgramsMessage,
        buttonsSection: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CtaButton(
                  onPressed: () =>
                      context.pushNamed(AppRoutes.premiumDialog.name),
                  text: S.of(context).noCreditBuyProgramDialogButton,
                  color: DanaTheme.paletteDarkBlue),
            ),
            DanaTextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                context.read<ChangePageCubit>().changeIndexPage(index: 2);
              },
              text: S.of(context).dialogFinishProgramsButton2,
            ),
          ],
        ));
  }
}
