import 'package:app/config/constants.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/cubits/delete_user/delete_user_cubit.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/purchases/purchases_state.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/dialogs/delete_account_dialog.dart';
import 'package:app/widgets/dialogs/delete_account_pending_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).accountPageTitle,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH8,
        BlocSelector<UserPremiumCubit, UserPremiumState, PremiumType>(
          bloc: locator<UserPremiumCubit>(),
          selector: (state) => state.premiumType,
          builder: (context, premiumType) {
            return Text(
              premiumType == PremiumType.none
                  ? S.of(context).accountPageDescriptionInactive
                  : S.of(context).accountPageDescriptionActive,
            );
          },
        ),
        gapH12,
        _MyPlanCard(),
        gapH12,
        Text(
          S.of(context).accountPageTitleAboutPlan,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH12,
        Container(height: 1, color: DanaTheme.paletteLightGrey),
        _OptionWidget(
            title: S.of(context).accountPageHistory,
            onTap: () => context.pushNamed(AppRoutes.linkContent.name,
                queryParams: {"name" : ProfileLinks.HISTORY.name},
                extra: ProfileLinks.HISTORY)),
        _OptionWidget(
            title: S.of(context).profilePageSubscriptions,
            onTap: () => context.pushNamed(AppRoutes.linkContent.name,
                queryParams: {"name" : ProfileLinks.SUBSCRIPTIONS.name},
                extra: ProfileLinks.SUBSCRIPTIONS)),
        _OptionWidget(
            title: S.of(context).screenProfileViewLogout,
            onTap: () async {
              DanaAnalyticsService.trackUserTryLogout();
              ModalUtils().showModal(
                context,
                onEditTap: () async {
                  DanaAnalyticsService.trackUserRecapLogout();
                  Navigator.pop(context);
                },
                onPostTap: () async {
                  await locator<InitialProfileCubit>().logout();
                },
                title: S.of(context).screenProfileTitleLogout,
                confirmText: S.of(context).yesText,
                cancelText: S.of(context).noText,
              );
            }),
        _OptionWidget(
          title: S.of(context).accountPageDelete,
          onTap: () async {
            DanaAnalyticsService.trackUserTryDeleteAccount();
            context.read<DeleteUserCubit>().getDeleteUser();
            if (context.read<DeleteUserCubit>().state.deleteUser == true) {
              ShowModal.showBottomSheet(
                  context: context, widget: DeleteAccountPendingDialog());
            } else {
              ShowModal.showBottomSheet(
                  context: context, widget: DeleteAccountDialog());
            }
          },
        ),
      ],
    );
  }
}

class _MyPlanCard extends StatelessWidget {
  const _MyPlanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPremiumCubit, UserPremiumState>(
      bloc: locator<UserPremiumCubit>(),
      builder: (context, state) {
        if (state.premiumType == PremiumType.none) {
          return CtaButton(
            onPressed: () => context.pushNamed(AppRoutes.premiumDialog.name),
            text: S.of(context).accountPageCardDiscover,
            color: AppColors.orange,
          );
        }
        return SizedBox(
          width: double.infinity,
          child: Card(
            color: DanaTheme.paletteFPink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).accountPageCardProgram,
                      style: DanaTheme.textSubHeadlineBold(
                          DanaTheme.paletteDarkBlue)),
                  gapH4,
                  Text(
                    state.premiumType.uiName,
                    style:
                        DanaTheme.textSuperSmallText(DanaTheme.paletteDarkBlue),
                  ),
                  gapH4,
                  BlocBuilder<PurchasesCubit, PurchasesState>(
                    bloc: locator<PurchasesCubit>(),
                    builder: (context, purchaseState) {
                      return Text(
                        (state.premiumType == PremiumType.pack5
                                ? S.of(context).accountPageCardDate2
                                : S.of(context).accountPageCardDate) +
                            ': ' +
                            purchaseState.dateToExpire,
                        style: DanaTheme.textSuperSmallText(
                            DanaTheme.paletteDarkBlue),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OptionWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const _OptionWidget({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH12,
          Text(
            title,
            style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
          ),
          gapH12,
          Container(height: 1, color: DanaTheme.paletteLightGrey),
        ],
      ),
    );
  }
}
