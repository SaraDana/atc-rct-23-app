//IMPORT EXTERN APP
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/widgets/unit/unit_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/program/program_state.dart';

class RenderUnitsProgramContentWidget extends StatelessWidget {
  final ProgramState programState;
  final VoidCallback? onBackPressed;
  final VoidCallback? onFinishedProgramPressed;

  const RenderUnitsProgramContentWidget({
    Key? key,
    required this.programState,
    required this.onBackPressed,
    required this.onFinishedProgramPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPremiumCubit, UserPremiumState>(
      bloc: locator<UserPremiumCubit>(),
      buildWhen: (previous, current) =>
          previous.programsUnlocked != current.programsUnlocked ||
          previous.premiumType != current.premiumType,
      builder: (context, state) {
        final bool isPremiumUser = state.premiumType == PremiumType.yearly ||
            state.premiumType == PremiumType.monthly;
        return Container(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  programState.units != null ? programState.units!.length : 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return UnitItemWidget(
                  programIsBuyed: state.programsUnlocked
                          .contains(programState.program!.id) ||
                      isPremiumUser,
                  onFinishedProgramPressed: onFinishedProgramPressed,
                  onBackPressed: onBackPressed,
                  unit: programState.units![index],
                  locked: index > programState.userUnits!.length,
                  position: index + 1,
                  programState: programState,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
