import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/screens/main/profile_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionManagementPage extends StatelessWidget {
  SubscriptionManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).subscriptionPageTitle,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH8,
        Text(S.of(context).subscriptionPageDescription),
        gapH16,
        SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () async {
              await _onPlandDePagoPressed(context);
            },
            text: S.of(context).subscriptionPageButton,
            color: DanaTheme.paletteDarkBlue,
          ),
        ),
        gapH16,
        SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () => context.pushNamed(AppRoutes.linkContent.name,
                queryParams: {"name": ProfileLinks.UNSUBSCRIBE.name},
                extra: ProfileLinks.UNSUBSCRIBE),
            text: S.of(context).subscriptionPageButton2,
            color: DanaTheme.whiteColor,
            textColor: DanaTheme.paletteDarkBlue,
          ),
        ),
        gapH16,
        SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () => onContact(context),
            text: S.of(context).historyPageButton,
            color: DanaTheme.whiteColor,
            textColor: DanaTheme.paletteDarkBlue,
          ),
        ),
      ],
    );
  }

  _onPlandDePagoPressed(context) async {
    PremiumType premiumType =
        await locator<UserPremiumCubit>().getUserPremiumType();

    if (premiumType == PremiumType.none)
      GoRouter.of(context).pushNamed(AppRoutes.premiumDialog.name);
    else
      GoRouter.of(context).pushNamed(
        AppRoutes.linkContent.name,
        queryParams: {
          "name": ProfileLinks.PLANDEPAGO.name,
        },
        extra: ProfileLinks.PLANDEPAGO,
      );
  }
}
