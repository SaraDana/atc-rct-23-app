import 'dart:io';

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_five/onboarding_step_five_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingStepFive extends StatefulWidget {
  const OnboardingStepFive({Key? key}) : super(key: key);

  @override
  State<OnboardingStepFive> createState() => _OnboardingStepFiveState();
}

class _OnboardingStepFiveState extends State<OnboardingStepFive> {
     @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "childBirthDate"});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepFiveCubit, OnboardingStepFiveState>(
        bloc: locator<OnboardingStepFiveCubit>()..init(),
        builder: (context, state) {
          return Transform.translate(
            offset: Offset(0, -MediaQuery.of(context).size.height * 0.09),
            child: Container(
              margin: EdgeInsets.only(
                top: 70.h,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        _getTitleStepFive(context, state.profileMoment),
                        textAlign: TextAlign.left,
                        style: DanaTheme.textHeadlineSmall(
                                DanaTheme.paletteDarkBlue)
                            .copyWith(fontSize: 18.sp),
                      ),
                    ),
                  ),
                  gapH20,
                  if (state.profileMoment ==
                      InitialProfileMoment.I_AM_ALREADY_MOTHER)
                    _BirthdayChild(),
                  if (state.profileMoment == InitialProfileMoment.I_AM_PREGNANT)
                    _LastPeriod(),
                ],
              ),
            ),
          );
        });
  }
}

class _BirthdayChild extends StatelessWidget {
  const _BirthdayChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepFiveCubit, OnboardingStepFiveState>(
      buildWhen: (previous, current) =>
          previous.childBirthDate != current.childBirthDate,
      bloc: locator<OnboardingStepFiveCubit>(),
      builder: (context, state) {
        return TextFormField(
          key: UniqueKey(),
          readOnly: true,
          initialValue: state.childBirthDate.value,
          onChanged: (value) =>
              locator<OnboardingStepFiveCubit>().updateChildBirthDate(value),
          decoration: AppInputsDecorations.onboardingInput(
                  hintText: S
                      .of(context)
                      .screenInitialProfilePage4MomentImAlreadyMotherFormField,
                  context: context,
                  labelText: S
                      .of(context)
                      .screenInitialProfilePage4MomentImAlreadyMotherFormField)
              .copyWith(
                  errorText: state.childBirthDate.invalid
                      ? S.of(context).pageInitialProfile2CompleteInfo
                      : null),
          onTap: () => Platform.operatingSystem == 'ios'
              ? AccountUtils().showProfileDatePickerIos(context, context,
                  onDateTimeChanged: (date) =>
                      locator<OnboardingStepFiveCubit>()
                          .updateChildBirthDate(date),
                  title: S.current
                      .screenInitialProfilePage4MomentImAlreadyMotherFormField,
                        initialValue: stringToDateWithFormat(state.childBirthDate.value)
                      )
              : AccountUtils().showProfileDatePicker(context,
                  onDateTimeChanged: (date) =>
                      locator<OnboardingStepFiveCubit>()
                          .updateChildBirthDate(date),
                  title: S.current
                      .screenInitialProfilePage4MomentImAlreadyMotherFormField,
                        initialValue: stringToDateWithFormat(state.childBirthDate.value)
                      ),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class _LastPeriod extends StatelessWidget {
  const _LastPeriod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepFiveCubit, OnboardingStepFiveState>(
      buildWhen: (previous, current) =>
          previous.lastPeriod != current.lastPeriod,
      bloc: locator<OnboardingStepFiveCubit>(),
      builder: (context, state) {
        return TextFormField(
          key: UniqueKey(),
          readOnly: true,
          initialValue: state.lastPeriod.value,
          onChanged: (value) =>
              locator<OnboardingStepFiveCubit>().updateLastPeriodDate(value),
          decoration: AppInputsDecorations.onboardingInput(
                  hintText: S
                      .of(context)
                      .screenInitialProfilePage4MomentImPregnantFormField,
                  context: context,
                  labelText: S
                      .of(context)
                      .screenInitialProfilePage4MomentImPregnantFormField)
              .copyWith(
                  errorText: state.lastPeriod.invalid
                      ? S.of(context).pageInitialProfile2CompleteInfo
                      : null),
          onTap: () => Platform.operatingSystem == 'ios'
              ? AccountUtils().showProfileDatePickerIos(context, context,
                  onDateTimeChanged: (date) =>
                      locator<OnboardingStepFiveCubit>()
                          .updateLastPeriodDate(date),
                  title: S.current
                      .screenInitialProfilePage4MomentImPregnantFormField,
                        initialValue: stringToDateWithFormat(state.lastPeriod.value)
                      )
              : AccountUtils().showProfileDatePicker(context,
                  onDateTimeChanged: (date) =>
                      locator<OnboardingStepFiveCubit>()
                          .updateLastPeriodDate(date),
                  title: S.current
                      .screenInitialProfilePage4MomentImPregnantFormField,
                         initialValue: stringToDateWithFormat(state.lastPeriod.value)
                      ),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

_getTitleStepFive(BuildContext context, InitialProfileMoment profileMoment) {
  if (profileMoment == InitialProfileMoment.I_AM_ALREADY_MOTHER)
    return S.of(context).screenInitialProfilePage4MomentImAlreadyMother;
  else if (profileMoment == InitialProfileMoment.I_AM_PREGNANT)
    return S.of(context).screenInitialProfilePage4MomentImPregnant;

  return S.of(context).screenInitialProfilePage5Title;
}
