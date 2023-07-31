import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_seven/onboarding_step_seven_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepSeven extends StatelessWidget {
  const OnboardingStepSeven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepSevenCubit, OnboardingStepSevenState>(
      bloc: locator<OnboardingStepSevenCubit>(),
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            AccountUtils().getOptionsProfileInformation6(
              context,
              item: InitialProfileContentType.EMOTIONAL_MANAGEMENT,
              onTap: () => _setItemSelected(
                item: InitialProfileContentType.EMOTIONAL_MANAGEMENT,
              ),
              selectedItems: state.contentTypeList,
              text: S.of(context).screenInitialProfilePage6EmotionalManagement,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileInformation6(
              context,
              item: InitialProfileContentType.YOGA,
              onTap: () => _setItemSelected(
                item: InitialProfileContentType.YOGA,
              ),
              selectedItems: state.contentTypeList,
              text: S.of(context).screenInitialProfilePage6Yoga,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileInformation6(
              context,
              item: InitialProfileContentType.MINDFULNESS,
              onTap: () => _setItemSelected(
                item: InitialProfileContentType.MINDFULNESS,
              ),
              selectedItems: state.contentTypeList,
              text: S.of(context).screenInitialProfilePage6Mindfulness,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileInformation6(
              context,
              item: InitialProfileContentType.SPORT,
              onTap: () => _setItemSelected(
                item: InitialProfileContentType.SPORT,
              ),
              selectedItems: state.contentTypeList,
              text: S.of(context).screenInitialProfilePage6Sport,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileInformation6(
              context,
              item: InitialProfileContentType.GENERAL_INFORMATION,
              onTap: () => _setItemSelected(
                item: InitialProfileContentType.GENERAL_INFORMATION,
              ),
              selectedItems: state.contentTypeList,
              text: S.of(context).screenInitialProfilePage6GeneralInformation,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileInformation6(
              context,
              item: InitialProfileContentType.SCIENTIFIC_INFORMATION,
              onTap: () => _setItemSelected(
                item: InitialProfileContentType.SCIENTIFIC_INFORMATION,
              ),
              selectedItems: state.contentTypeList,
              text:
                  S.of(context).screenInitialProfilePage6ScientificInformation,
            ),
            Container(height: 50),
          ],
        );
      },
    );
  }
}

_setItemSelected({
  required InitialProfileContentType item,
}) {
  locator<OnboardingStepSevenCubit>().updateContentType(item);
}
