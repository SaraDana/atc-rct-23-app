import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/purchases/purchases_state.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/screens/main/profile_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/date_time_utils.dart';

class PayHistoryPage extends StatelessWidget {
  const PayHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).historyPageTitle,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH8,
        Text(S.of(context).historyPageDescription),
        gapH24,
        Text(
          S.of(context).historyPageMyPayments,
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
        ),
        gapH12,
        Container(height: 1, color: Colors.grey),
        gapH12,
        BlocBuilder<PurchasesCubit, PurchasesState>(
            bloc: locator<PurchasesCubit>()..loadPurchases(),
            builder: (context, state) {
              if (state.historyPayments.isEmpty) {
                return Text(
                  S.of(context).historyPageNoPayments,
                );
              }
              return Column(
                children: state.historyPayments
                    .map((e) => _RecentPayment(
                          program: e.productId,
                          initialDate: e.purchaseDate,
                          endDate: e.expiryDate.toString(),
                        ))
                    .toList(),
              );
            }),
        gapH16,
        SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () => onContact(context),
            text: S.of(context).historyPageButton,
            color: DanaTheme.whiteColor,
            textColor: DanaTheme.paletteDarkBlue,
          ),
        )
      ],
    );
  }
}

class _RecentPayment extends StatelessWidget {
  final String program;
  final String initialDate;
  final String endDate;
  const _RecentPayment({
    Key? key,
    required this.program,
    required this.initialDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          convertStringToPremiumType(program).uiName,
          style: DanaTheme.subtitle1.copyWith(color: DanaTheme.paletteDarkBlue),
        ),
        gapH4,
        Text(
          S.of(context).historyPageInitDate +
              ' ' +
              timeStampToDateTime(int.parse(initialDate))
                  .toString()
                  .substring(0, 10),
          style: DanaTheme.subtitle1,
        ),
        gapH4,
        Text(
          S.of(context).historyPageEndDate +
              ' ' +
              timeStampToDateTime(int.parse(endDate))
                  .toString()
                  .substring(0, 10),
          style: DanaTheme.subtitle1,
        ),
        gapH12,
        Container(height: 1, color: Colors.grey),
        gapH12,
      ],
    );
  }
}
