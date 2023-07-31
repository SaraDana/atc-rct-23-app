import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_text/onboarding_step_child_text_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_one/onboarding_step_one_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepChildText extends StatefulWidget {
  const OnboardingStepChildText({Key? key}) : super(key: key);

  @override
  State<OnboardingStepChildText> createState() =>
      _OnboardingStepChildTextState();
}

class _OnboardingStepChildTextState extends State<OnboardingStepChildText> {
  @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "childCount"});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardingStepChildTextBody();
  }
}

class OnboardingStepChildTextBody extends StatelessWidget {
  const OnboardingStepChildTextBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepChildTextCubit,
        OnboardingStepChildTextState>(
      buildWhen: (previous, current) =>
          previous.childCount != current.childCount,
      bloc: locator<OnboardingStepChildTextCubit>(),
      builder: (context, state) {
        return TextFormField(
          initialValue: state.childCount.value?.toString() ?? "",
          onChanged: (value) {
            if (value.isNotEmpty) {
              locator<OnboardingStepChildTextCubit>()
                  .updateCount(int.parse(value));
            }
          },
          decoration: AppInputsDecorations.onboardingInput(
            hintText: S.of(context).howManyChild,
            context: context,
            labelText: S.of(context).howManyChild,
          ).copyWith(
              errorText: state.childCount.invalid
                  ? S.of(context).childCountMaxText
                  : null),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        );
      },
    );
  }
}
