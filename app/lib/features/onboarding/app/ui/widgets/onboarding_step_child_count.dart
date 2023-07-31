import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_count/onboarding_step_child_count_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_six/onboarding_step_six_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingStepChildCountPage extends StatefulWidget {
  const OnboardingStepChildCountPage({Key? key}) : super(key: key);

  @override
  State<OnboardingStepChildCountPage> createState() =>
      _OnboardingStepChildCountPageState();
}

class _OnboardingStepChildCountPageState
    extends State<OnboardingStepChildCountPage> {
  @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "childCountSelection"});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepChildCountCubit,
        OnboardingStepChildCountState>(
      bloc: locator<OnboardingStepChildCountCubit>(),
      builder: (context, state) {
        return Column(
          children: [
            _getOption(
                context: context,
                text: S
                    .of(context)
                    .screenInitialProfilePageChildCountIsFirstChildText,
                selectedIndex: state.selectedIndex,
                index: 0),
            Container(height: 10),
            _getOption(
                context: context,
                text: S
                    .of(context)
                    .screenInitialProfilePageChildCountIsNotFirstChildText,
                selectedIndex: state.selectedIndex,
                index: 1),
            Container(height: 10),
          ],
        );
      },
    );
  }
}

_getOption({
  required String text,
  required BuildContext context,
  required int index,
  int? selectedIndex,
}) {
  return GestureDetector(
    key: UniqueKey(),
    onTap: () => _setSelection(index),
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
                    index == selectedIndex
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

_setSelection(int index) {
  locator<OnboardingStepChildCountCubit>().setChildCountSelection(index);
}
