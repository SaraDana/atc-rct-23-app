import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/expandable.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/purchases/purchases_state.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/purchases/constants.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/models/purchases/purchases_status.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/content/header_background_unit_deatil_widget.dart';
import 'package:app/widgets/dialogs/error_purchase_dialog.dart';
import 'package:app/widgets/dialogs/exit_purchase_dialog.dart';
import 'package:app/widgets/dialogs/success_programs_purchases_dialog.dart';
import 'package:app/widgets/premium/premium_box_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/ui/widgets/buttons/cta_button.dart';
import '../../styles/dana_theme.dart';

class PremiumDialog extends StatelessWidget {
  String programId;
  PremiumDialog({Key? key, required this.programId}) : super(key: key);
  Map<String, ExpandableController> controllers = {
    storeKeyConsumable: ExpandableController(),
    storeKey1month: ExpandableController(),
    storeKey1year: ExpandableController(),
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: BlocConsumer<PurchasesCubit, PurchasesState>(
              bloc: locator<PurchasesCubit>(),
              listenWhen: (previous, current) =>
                  previous.purchasesStatus != current.purchasesStatus,
              listener: (context, state) async {
                if (state.purchasesStatus == PurchaseStatus.canceled) {
                  DanaAnalyticsService.trackTryDismissPaywall();
                  ShowModal.showBottomSheet(
                      context: context,
                      widget: ExitPurchaseDialog(
                        programId: programId,
                      ));
                }
                if (state.purchasesStatus == PurchaseStatus.error) {
                  DanaAnalyticsService.trackPaymentIssue(null);
                  ShowModal.showBottomSheet(
                    context: context,
                    widget: ErrorPurchaseDialog(),
                  );
                }
                if (state.purchasesStatus == PurchaseStatus.purchased) {
                  locator<UserPremiumCubit>().updatePremiumType();
                  Navigator.of(context).pop();
                  ShowModal.showBottomSheet(
                    context: context,
                    widget: SuccessProgramsPurchasesDialog(
                      premiumType:
                          convertStringToPremiumType(state.selectProduct?.id),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _Header(programId: programId),
                      gapH8,
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: Sizes.p4),
                        child: Column(children: [
                          Text(
                            S.of(context).purchasePageTitle,
                            style: DanaTheme.textMarketingHeadline(
                                    DanaTheme.paletteDarkBlue)
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          gapH12,
                          Text(
                            S.of(context).purchasePageDescription,
                            textAlign: TextAlign.center,
                            style: DanaTheme.textSuperSmallText(
                                DanaTheme.paletteDarkBlue),
                          ),
                          gapH24,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: state.products
                                .map((product) => PremiumBoxPrice(
                                      product: product,
                                      controllers: controllers,
                                    ))
                                .toList(),
                          ),
                          gapH24,
                          _BuySection(),
                          gapH24,
                          _TermsAndConditions(),
                          gapH24,
                        ]),
                      ),
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BuySection extends StatelessWidget {
  const _BuySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchasesCubit, PurchasesState>(
      bloc: locator<PurchasesCubit>(),
      builder: (context, state) {
        final blockPremiumPack5 =
            state.selectProduct?.id == storeKeyConsumable &&
                locator<UserPremiumCubit>().state.premiumType ==
                    PremiumType.pack5 &&
                locator<UserPremiumCubit>().state.availablePurchaseCredits > 0;

        if (state.purchasesStatus == PurchaseStatus.pending) {
          return CircularProgressIndicator();
        }
        return SizedBox(
          width: double.infinity,
          child: CtaButton(
            color: AppColors.orange,
            onPressed: state.selectProduct == null
                ? null
                : blockPremiumPack5
                    ? null
                    : () {
                        final bool availablePack5 =
                            locator<UserPremiumCubit>().state.premiumType ==
                                    PremiumType.pack5 &&
                                locator<UserPremiumCubit>()
                                        .state
                                        .availablePurchaseCredits >
                                    0;
                        if (state.selectProduct!.id == storeKeyConsumable &&
                            availablePack5) {
                          ShowModal.showBottomSheet(
                            context: context,
                            widget: ErrorPurchaseDialog(),
                          );
                        }
                        locator<PurchasesCubit>().buy();
                      },
            text: S.of(context).purchasePageButton,
          ),
        );
      },
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.pushNamed(AppRoutes.termsAndConditions.name,
              extra: ProfileLinks.TERMS_AND_CONDITIONS);
        },
        child: Text(
          S.of(context).purchasePageTerms,
          style:
              DanaTheme.textSuperSmallText(DanaTheme.paletteDarkBlue).copyWith(
            decoration: TextDecoration.underline,
          ),
        ));
  }
}

class TextWithCheck extends StatelessWidget {
  final String text;
  const TextWithCheck({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/dialogs/check.svg'),
        gapW8,
        Expanded(
          child: Text(
            text,
            style: DanaTheme.textSuperSmallText(DanaTheme.paletteDarkBlue),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  String programId;
  _Header({Key? key, required this.programId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      color: DanaTheme.lightGrayColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    DanaAnalyticsService.trackTryDismissPaywall();
                    ShowModal.showBottomSheet(
                        context: context,
                        widget: ExitPurchaseDialog(
                          programId: programId,
                        ));
                  },
                  icon: Icon(Icons.close)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    'assets/images/dialogs/flower.svg',
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).purchasePageBenefit4,
                          style: DanaTheme.textMarketingHeadline(
                                  DanaTheme.paletteDarkBlue)
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        gapH16,
                        TextWithCheck(
                          text: S.of(context).purchasePageBenefit1,
                        ),
                        gapH8,
                        TextWithCheck(
                          text: S.of(context).purchasePageBenefit2,
                        ),
                        gapH8,
                        TextWithCheck(
                          text: S.of(context).purchasePageBenefit3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.4,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
                child: HeaderBackgroundUnitDetailWidget()),
          ),
        ],
      ),
    );
  }
}
