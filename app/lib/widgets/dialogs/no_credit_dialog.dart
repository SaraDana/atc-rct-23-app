import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NoCreditDialog extends StatelessWidget {
  const NoCreditDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
        image: 'assets/images/dana_onboarding_page_1.svg',
        title: S.of(context).noCreditBuyProgramDialogTitle,
        bodyText: S.of(context).noCreditBuyProgramDialogDescription,
        buttonsSection: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CtaButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.pushNamed(AppRoutes.premiumDialog.name);
                  },
                  text: S.of(context).noCreditBuyProgramDialogButton,
                  color: AppColors.orange),
            ),
            DanaTextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                context.read<ChangePageCubit>().changeIndexPage(index: 2);
              },
              text: S.of(context).noCreditBuyProgramDialogButton2,
            ),
          ],
        ));
  }
}
