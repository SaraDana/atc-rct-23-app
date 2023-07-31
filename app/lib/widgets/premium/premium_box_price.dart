import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/expandable.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/purchases/purchases_state.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/models/purchases/constants.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/models/purchases/purchasable_product.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/dialogs/block_purchase_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumBoxPrice extends StatelessWidget {
  final PurchasableProduct product;
  final Map<String, ExpandableController> controllers;

  const PremiumBoxPrice(
      {Key? key, required this.product, required this.controllers})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final blockPremiumPack5 = product.id == storeKeyConsumable &&
        locator<UserPremiumCubit>().state.premiumType == PremiumType.pack5 &&
        locator<UserPremiumCubit>().state.availablePurchaseCredits > 0;
    final listBenefits = PurchasesHelper.getBenefits(product.id, context);
    final VoidCallback onTap = () {
      controllers.forEach((key, value) {
        if (key != product.id) {
          value.expanded = false;
        }
      });
      locator<PurchasesCubit>().selectProduct(product);
    };
    return BlocBuilder<PurchasesCubit, PurchasesState>(
      bloc: locator<PurchasesCubit>(),
      buildWhen: (previous, current) =>
          previous.selectProduct != current.selectProduct,
      builder: (context, state) {
        final isSelected = state.selectProduct?.id == product.id;
        return InkWell(
          onTap: blockPremiumPack5 ? () => _showBlockPurchase(context) : onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: blockPremiumPack5
                ? DanaTheme.lightGrayColor
                : isSelected
                    ? AppColors.priceBoxSelectedBackground
                    : AppColors.priceBoxUnSelectedBackground,
            child: Padding(
              padding: EdgeInsets.only(
                top: Sizes.p20,
                bottom: Sizes.p20,
                left: Sizes.p20,
                right: Sizes.p12,
              ),
              child: ExpandablePanel(
                theme: ExpandableThemeData(iconPadding: EdgeInsets.zero),
                onExpansionChanged: blockPremiumPack5
                    ? () => _showBlockPurchase(context)
                    : onTap,
                controller: controllers[product.id],
                header: _Header(
                  product: product,
                ),
                collapsed: SizedBox.shrink(),
                expanded: Padding(
                    padding: const EdgeInsets.only(
                      top: Sizes.p4,
                    ),
                    child: Column(
                      children: listBenefits
                          .map((e) => _BenefitsText(text: e))
                          .toList(),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final PurchasableProduct product;
  const _Header({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _CheckBox(product: product),
            SizedBox(width: 10),
            Text(
              PurchasesHelper.idToSubscriptionName(product.id),
              style: DanaTheme.subtitle3,
            ),
            gapW4,
            _Tag(
              text: PurchasesHelper.idToTagName(product.id),
            ),
            Spacer(),
            Text(
              product.price,
              style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.088),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                PurchasesHelper.idToDescription(
                  product.id,
                ),
                style: TextStyle(
                  color: DanaTheme.paletteDarkBlue,
                ),
              ),
              Text(
                PurchasesHelper.idToOldPrice(product.id),
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: DanaTheme.paletteDarkBlue),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _CheckBox extends StatelessWidget {
  final PurchasableProduct product;
  const _CheckBox({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchasesCubit, PurchasesState>(
        bloc: locator<PurchasesCubit>(),
        buildWhen: (previous, current) =>
            previous.selectProduct != current.selectProduct,
        builder: (context, state) {
          final isSelected = state.selectProduct?.id == product.id;
          return AbsorbPointer(
            absorbing: true,
            child: isSelected
                ? Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DanaTheme.paletteDarkBlue,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: AppColors.white,
                    ),
                  )
                : Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      border: Border.all(color: DanaTheme.paletteDarkBlue),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
          );
        });
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: DanaTheme.paletteDarkBlue, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: DanaTheme.paletteDarkBlue,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BenefitsText extends StatelessWidget {
  final String text;
  const _BenefitsText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.p12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapW20,
          Icon(
            Icons.check,
            color: DanaTheme.paletteDarkBlue,
            size: 12,
          ),
          gapW4,
          Expanded(
            child: Text(
              text,
              style: DanaTheme.textSuperSmallText(
                DanaTheme.paletteDarkBlue,
              ),
            ),
          ),
          gapW8,
        ],
      ),
    );
  }
}

_showBlockPurchase(context) {
  ShowModal.showBottomSheet(context: context, widget: BlockPurchaseDialog());
}
