import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_eight/onboarding_step_eight_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepEight extends StatefulWidget {
  const OnboardingStepEight({Key? key}) : super(key: key);

  @override
  State<OnboardingStepEight> createState() => _OnboardingStepEightState();
}

class _OnboardingStepEightState extends State<OnboardingStepEight> {
     @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "profileHelp"});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepEightCubit, OnboardingStepEightState>(
      bloc: locator<OnboardingStepEightCubit>(),
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              transform: Matrix4.translationValues(0, -5, 0),
              child: Text(
                S
                    .of(context)
                    .screenInitialProfilePageSelectMax(state.maxSelected),
                style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
              ),
            ),
            gapH16,
            AccountUtils().getOptionProfileInformation(
              context,
              item: InitialProfileHelp.INFORMATION_OF_INTEREST,
              onTap: () => _setItemSelected(
                item: InitialProfileHelp.INFORMATION_OF_INTEREST,
              ),
              selectedItems: state.contentHelpList,
              text: S.of(context).screenInitialProfilePage5BisInformation,
            ),
            Container(height: 10),
            AccountUtils().getOptionProfileInformation(
              context,
              item: InitialProfileHelp.FEEL_BETTER,
              onTap: () => _setItemSelected(
                item: InitialProfileHelp.FEEL_BETTER,
              ),
              selectedItems: state.contentHelpList,
              text: S.of(context).screenInitialProfilePage5BisFeelBetter,
            ),
            Container(height: 10),
            AccountUtils().getOptionProfileInformation(
              context,
              item: InitialProfileHelp.RELATIONSHIPS_WITH_OTHER_MOTHERS,
              onTap: () => _setItemSelected(
                item: InitialProfileHelp.RELATIONSHIPS_WITH_OTHER_MOTHERS,
              ),
              selectedItems: state.contentHelpList,
              text: S.of(context).screenInitialProfilePage5BisPersonalRelations,
            ),
            Container(height: 10),
            AccountUtils().getOptionProfileInformation(
              context,
              item: InitialProfileHelp.GET_SUPPORT,
              onTap: () => _setItemSelected(
                item: InitialProfileHelp.GET_SUPPORT,
              ),
              selectedItems: state.contentHelpList,
              text: S.of(context).screenInitialProfilePage5BisSupport,
            ),
            Container(height: 10),
            AccountUtils().getOptionProfileInformation(
              context,
              item: InitialProfileHelp.ENTERTAINMENT,
              onTap: () => _setItemSelected(
                item: InitialProfileHelp.ENTERTAINMENT,
              ),
              selectedItems: state.contentHelpList,
              text: S.of(context).screenInitialProfilePage5BisEntertainment,
            ),
            Container(height: 10),
            AccountUtils().getOptionProfileInformation(
              context,
              item: InitialProfileHelp.DONT_KNOW,
              onTap: () => _setItemSelected(
                item: InitialProfileHelp.DONT_KNOW,
              ),
              selectedItems: state.contentHelpList,
              text: S.of(context).screenInitialProfilePage5BisDoNotKnow,
            ),
            Container(height: 50)
          ],
        );
      },
    );
  }
}

_setItemSelected({
  required InitialProfileHelp item,
}) {
  locator<OnboardingStepEightCubit>().updateContentHelp(item);
}
