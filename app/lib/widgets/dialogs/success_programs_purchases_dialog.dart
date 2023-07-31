import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/core/di/locator.dart';

import 'package:app/generated/l10n.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SuccessProgramsPurchasesDialog extends StatelessWidget {
  final PremiumType premiumType;

  const SuccessProgramsPurchasesDialog({Key? key, required this.premiumType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isFullAccess = premiumType != PremiumType.pack5;
    final bool tryNavigateProgram =
        locator<UserPremiumCubit>().state.programToBuy != null;
    return DialogLayout(
        image: 'assets/images/dialogs/succes_purchases.svg',
        title: S.of(context).dialogSuccesPurchasesProgramsTitle,
        bodyText: isFullAccess
            ? S.of(context).dialogSuccesPurchasesSubscriptionDescription
            : S.of(context).dialogSuccesPurchasesProgramsDescription,
        buttonsSection: CtaButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (!tryNavigateProgram) {
              for (var i = 0; i < 6; i++) {
                if (!Navigator.of(context).canPop()) {
                  break;
                }
                Navigator.of(context).pop();
              }

              context.goNamed(AppRoutes.home.name);
              context.read<ChangePageCubit>().changeIndexPage(index: 1);
            }
          },
          text: S.of(context).dialogSuccesPurchasesProgramsButton,
          color: AppColors.orange,
        ));
  }
}
