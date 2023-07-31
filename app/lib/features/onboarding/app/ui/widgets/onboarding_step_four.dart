import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_four/onboarding_step_four_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingStepFour extends StatefulWidget {
  const OnboardingStepFour({Key? key}) : super(key: key);

  @override
  State<OnboardingStepFour> createState() => _OnboardingStepFourState();
}

class _OnboardingStepFourState extends State<OnboardingStepFour> {
  @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "profileMoment"});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepFourCubit, OnboardingStepFourState>(
      bloc: locator<OnboardingStepFourCubit>(),
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            _getOption(
                context: context,
                text:
                    S.of(context).screenInitialProfilePage4LookingToGetPregnant,
                moment: InitialProfileMoment.LOOKING_TO_GET_PREGNANT,
                momentSelected: state.profileMoment),
            Container(height: 10),
            _getOption(
                context: context,
                text: S.of(context).screenInitialProfilePage4MomentImPregnant,
                moment: InitialProfileMoment.I_AM_PREGNANT,
                momentSelected: state.profileMoment),
            Container(height: 10),
            _getOption(
                context: context,
                text: S
                    .of(context)
                    .screenInitialProfilePage4MomentImAlreadyMother,
                moment: InitialProfileMoment.I_AM_ALREADY_MOTHER,
                momentSelected: state.profileMoment),
            Container(height: 10),
            _getOption(
                context: context,
                text: S
                    .of(context)
                    .screenInitialProfilePage4MomentImTheMothersPartner,
                moment: InitialProfileMoment.I_AM_THE_MOTHERS_PARTNER,
                momentSelected: state.profileMoment),
            Container(height: 10),
            _getOption(
                context: context,
                text: S
                    .of(context)
                    .screenInitialProfilePage4MomentImAHealthProfessional,
                moment: InitialProfileMoment.I_AM_A_HEALTH_PROFESSIONAL,
                momentSelected: state.profileMoment),
            Container(height: 10),
            _getOption(
                context: context,
                text:
                    S.of(context).screenInitialProfilePage4MomentNoneOfTheAbove,
                moment: InitialProfileMoment.NONE_OF_THE_ABOVE,
                momentSelected: state.profileMoment),
          ],
        );
      },
    );
  }
}

_getOption(
    {required String text,
    required InitialProfileMoment moment,
     InitialProfileMoment? momentSelected,
    required BuildContext context}) {
  return GestureDetector(
    key: UniqueKey(),
    onTap: () => _setMoment(moment),
    child: Container(
      height: 70,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: DanaTheme.paletteWhite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                width: getScreenWidth(context) -
                    DanaTheme.bodyPadding * 2 -
                    30 -
                    34 -
                    10,
                child: Text(text,
                    style: DanaTheme.textCta(DanaTheme.paletteDarkBlue)),
              ),
              Container(
                  width: 30,
                  child: SvgPicture.asset(
                    moment == momentSelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}

_setMoment(InitialProfileMoment moment) {
  locator<OnboardingStepFourCubit>().updateProfileMoment(moment);
}
