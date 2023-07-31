import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/buttons/dana_text_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/purchases/purchases_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/program_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/dialogs/success_unlock_program_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubits/user_premium/user_premium_cubit.dart';

class UnlockedProgramDialog extends StatelessWidget {
  final Program program;
  const UnlockedProgramDialog({Key? key, required this.program})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchasesCubit, PurchasesState>(
      bloc: locator<PurchasesCubit>(),
      listenWhen: (previous, current) =>
          previous.unlockProgram != current.unlockProgram,
      listener: (context, state) {
        if (state.unlockProgram == true) {
          DanaAnalyticsService.trackPlan3m5pUnblockConfirm(program.id,
              locator<UserPremiumCubit>().state.programsUnlocked.length);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          showDialog(
              context: context, builder: (context) => SuccessUnlockProgram());
        }
      },
      child: DialogLayout(
          title: S.of(context).unlockedProgramDialogTitle,
          bodyWidget: CardOfProgram(program: program),
          bodyText: S.of(context).unlockedProgramDialogDescription(
              locator<PurchasesCubit>().state.dateToExpire),
          buttonsSection: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: CtaButton(
                    onPressed: () => locator<PurchasesCubit>()
                        .unlockProgram(program.id ?? ''),
                    text: S.of(context).unlockedProgramDialogButton,
                    color: DanaTheme.paletteDarkBlue),
              ),
              DanaTextButton(
                onPressed: () {
                  DanaAnalyticsService.trackPlan3m5pUnblockCancel(program.id);
                  Navigator.of(context).pop();
                },
                text: S.of(context).unlockedProgramDialogButton2,
              ),
            ],
          )),
    );
  }
}

class CardOfProgram extends StatelessWidget {
  final Program program;
  const CardOfProgram({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.15,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: DanaTheme.lightGrayColor,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/dana_onboarding_profile_test.svg',
                      fit: BoxFit.fitWidth,
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Sizes.p4, horizontal: Sizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    program.title ?? '',
                    style: DanaTheme.textCommentUserSpecialistRole(
                            DanaTheme.paletteDarkBlue)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  gapH8,
                  Text(
                    program.description ?? '',
                    style: DanaTheme.bodyText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
