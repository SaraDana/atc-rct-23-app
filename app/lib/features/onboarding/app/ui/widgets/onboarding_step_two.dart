import 'dart:io';

import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_two/onboarding_step_two_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepTwo extends StatefulWidget {
  const OnboardingStepTwo({Key? key}) : super(key: key);

  @override
  State<OnboardingStepTwo> createState() => _OnboardingStepTwoState();
}

class _OnboardingStepTwoState extends State<OnboardingStepTwo> {
  @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "birthdate"});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _BirthDateForm();
  }
}

class _BirthDateForm extends StatelessWidget {
  const _BirthDateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepTwoCubit, OnboardingStepTwoState>(
      buildWhen: (previous, current) => previous.birthdate != current.birthdate,
      bloc: locator<OnboardingStepTwoCubit>(),
      builder: (context, state) {
        return TextFormField(
          key: UniqueKey(),
          readOnly: true,
          initialValue: state.birthdate.value,
          onChanged: (value) =>
              locator<OnboardingStepTwoCubit>().updateBirthdate(value),
          decoration: AppInputsDecorations.onboardingInput(
                  hintText: S.of(context).pageInitialProfile2Birthdate,
                  context: context,
                  labelText: S.of(context).pageInitialProfile2SelectBirthdate)
              .copyWith(
                  errorText: state.birthdate.invalid
                      ? S.of(context).pageInitialProfile2CompleteInfo
                      : null),
          onTap: () => Platform.operatingSystem == 'ios'
              ? AccountUtils().showProfileDatePickerIos(context, context,
                  onDateTimeChanged: (date) =>
                      locator<OnboardingStepTwoCubit>().updateBirthdate(date),
                  title: S.current.screenInitialProfilePage2Title,
                  initialValue: stringToDateWithFormat(state.birthdate.value)
                  )
              : AccountUtils().showProfileDatePicker(context,
                  onDateTimeChanged: (date) =>
                      locator<OnboardingStepTwoCubit>().updateBirthdate(date),
                  title: S.current.screenInitialProfilePage2Title,
                    initialValue: stringToDateWithFormat(state.birthdate.value)
                  ),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}
