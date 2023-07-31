import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_one/onboarding_step_one_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepOne extends StatefulWidget {
  const OnboardingStepOne({Key? key}) : super(key: key);

  @override
  State<OnboardingStepOne> createState() => _OnboardingStepOneState();
}

class _OnboardingStepOneState extends State<OnboardingStepOne> {
  @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "name"});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NameFormField();
  }
}

class NameFormField extends StatelessWidget {
  const NameFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepOneCubit, OnboardingStepOneState>(
      buildWhen: (previous, current) => previous.name != current.name,
      bloc: locator<OnboardingStepOneCubit>()..init(),
      builder: (context, state) {
        return TextFormField(
          initialValue: state.name.value,
          onChanged: (value) =>
              locator<OnboardingStepOneCubit>().updateName(value),
          decoration: AppInputsDecorations.onboardingInput(
                  hintText: S.of(context).pageProfileEditName,
                  context: context,
                  labelText: S.of(context).pageProfileEditName)
              .copyWith(
                  errorText: state.name.invalid
                      ? S.of(context).pageInitialProfile1WriteYourName
                      : null),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}
