import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_six/onboarding_step_six_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepSix extends StatefulWidget {
  const OnboardingStepSix({Key? key}) : super(key: key);

  @override
  State<OnboardingStepSix> createState() => _OnboardingStepSixState();
}

class _OnboardingStepSixState extends State<OnboardingStepSix> {
      @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "profileMotherExperience"});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepSixCubit, OnboardingStepSixState>(
      bloc: locator<OnboardingStepSixCubit>()..init(),
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            AccountUtils().getOptionsProfileMotherExperience(
              context,
              text: S
                  .of(context)
                  .screenInitialProfilePage4MotherExperienceVeryGood,
              motherExperience:
                  InitialProfileMotherExperience.VERY_GOOD_EXPERIENCE,
              motherExperienceSelected: state.motherExperience,
              onTap: () => _setMotherExperience(
                  context, InitialProfileMotherExperience.VERY_GOOD_EXPERIENCE),
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileMotherExperience(
              context,
              text: S.of(context).screenInitialProfilePage4MotherExperienceGood,
              motherExperience: InitialProfileMotherExperience.GOOD_EXPERIENCE,
              motherExperienceSelected: state.motherExperience,
              onTap: () => _setMotherExperience(
                context,
                InitialProfileMotherExperience.GOOD_EXPERIENCE,
              ),
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileMotherExperience(
              context,
              text: S.of(context).screenInitialProfilePage4MotherExperienceHard,
              motherExperience: InitialProfileMotherExperience.HARD_EXPERIENCE,
              motherExperienceSelected: state.motherExperience,
              onTap: () => _setMotherExperience(
                context,
                InitialProfileMotherExperience.HARD_EXPERIENCE,
              ),
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfileMotherExperience(
              context,
              text: S
                  .of(context)
                  .screenInitialProfilePage4MotherExperienceVeryHard,
              motherExperience:
                  InitialProfileMotherExperience.VERY_HARD_EXPERIENCE,
              motherExperienceSelected: state.motherExperience,
              onTap: () => _setMotherExperience(
                context,
                InitialProfileMotherExperience.VERY_HARD_EXPERIENCE,
              ),
            ),
          ],
        );
      },
    );
  }
}

_setMotherExperience(
    BuildContext context, InitialProfileMotherExperience motherExperience) {
  locator<OnboardingStepSixCubit>().updateMotherExperience(motherExperience);
}
