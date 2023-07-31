import 'package:app/core/ui/styles/app_colors.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessUnlockProgram extends StatelessWidget {
  const SuccessUnlockProgram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool firstProgram =
        locator<UserPremiumCubit>().state.programsUnlocked.length == 1;

    return DialogLayout(
        image: 'assets/images/dialogs/unlocked_program.svg',
        title: firstProgram
            ? S.of(context).unlockedSuccessFirstDialogTitle
            : S.of(context).unlockedSuccessSecondDialogTitle,
        bodyText: firstProgram
            ? S.of(context).unlockedSuccessFirstDialogDescription(
                locator<PurchasesCubit>().state.dateToExpire)
            : S.of(context).unlockedSuccessSecondDialogDescription(
                locator<PurchasesCubit>().state.dateToExpire),
        bodyWidget: SizedBox(height: 40, child: _NumberCreditPrograms()),
        buttonsSection: SizedBox(
          width: double.infinity,
          child: CtaButton(
            onPressed: () => Navigator.of(context).pop(),
            text: S.of(context).unlockedSuccessDialogButton,
            color: AppColors.orange,
          ),
        ));
  }
}

class _NumberCreditPrograms extends StatelessWidget {
  const _NumberCreditPrograms({Key? key}) : super(key: key);
  //TODO: Move to cubit and create new value in state
  bool checkIfIsSelected(int programsUnlocked, int index) {
    while (programsUnlocked > 5) {
      programsUnlocked -= 5;
    }
    return programsUnlocked >= index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPremiumCubit, UserPremiumState>(
      bloc: locator<UserPremiumCubit>(),
      builder: (context, state) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: NumberWitchCircle(
                  number: (index + 1).toString(),
                  isSelect: checkIfIsSelected(
                      state.programsUnlocked.length, index + 1),
                ),
              );
            });
      },
    );
  }
}

class NumberWitchCircle extends StatelessWidget {
  final bool isSelect;
  final String number;
  const NumberWitchCircle(
      {Key? key, required this.isSelect, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelect ? DanaTheme.paletteDarkBlue : DanaTheme.lightGrayColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          '0' + number,
          style: DanaTheme.textSubHeadlineBold(
              isSelect ? Colors.white : Colors.grey),
        )),
      ),
    );
  }
}
