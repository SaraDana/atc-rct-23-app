import 'dart:io';

import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_birthday/onboarding_step_child_birthday_cubit.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_child_text/onboarding_step_child_text_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingStepChildBirthDay extends StatefulWidget {
  const OnboardingStepChildBirthDay({Key? key}) : super(key: key);

  @override
  State<OnboardingStepChildBirthDay> createState() => _OnboardingStepChildBirthDayState();
}

class _OnboardingStepChildBirthDayState extends State<OnboardingStepChildBirthDay> {
    @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "childBirthDates"});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const OnboardingStepChildBirthDayBody();
  }
}

class OnboardingStepChildBirthDayBody extends StatelessWidget {
  
  const OnboardingStepChildBirthDayBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepChildBirtDayCubit,
        OnboardingStepChildBirtDayState>(
      bloc: locator<OnboardingStepChildBirtDayCubit>(),
      buildWhen: (previous, current) {
        return previous.isUpdated != current.isUpdated;
      },
      builder: (context, state) {
        return ListView.builder(
          padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount:
                locator<OnboardingStepChildTextCubit>().state.childCount.value,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20.h),
                child: TextFormField(
                  initialValue: state.childDates != null &&
                          state.childDates!.containsKey(index.toString())
                      ? state.childDates![index.toString()]!['date']
                      : "",
                  key: UniqueKey(),
                  readOnly: true,
                  onChanged: (value) =>
                      locator<OnboardingStepChildBirtDayCubit>()
                          .updateChildBirthDate(index, value),
                  decoration: AppInputsDecorations.onboardingInput(
                      hintText:locator<OnboardingStepChildBirtDayCubit>().textFormsHintTextByIndex(index, context),
                      context: context,
                      labelText:locator<OnboardingStepChildBirtDayCubit>().textFormsHintTextByIndex(index, context),),
                  onTap: () => Platform.operatingSystem == 'ios'
                      ? AccountUtils().showProfileDatePickerIos(context, context,
                          onDateTimeChanged: (date) =>
                              locator<OnboardingStepChildBirtDayCubit>()
                                  .updateChildBirthDate(index, date),
                          title: S.current
                              .screenInitialProfilePage4MomentImAlreadyMotherFormField,
                                initialValue: stringToDateWithFormat( state.childDates?[index.toString()]?['date'] ?? "")
                              )
                      : AccountUtils().showProfileDatePicker(context,
                          onDateTimeChanged: (date) =>
                              locator<OnboardingStepChildBirtDayCubit>()
                                  .updateChildBirthDate(index, date),
                          title: S.current
                              .screenInitialProfilePage4MomentImAlreadyMotherFormField,
                                initialValue: stringToDateWithFormat( state.childDates?[index.toString()]?['date'] ?? "")
                              ),
                  style: DanaTheme.textSmallTextBold(
                      DanaTheme.paletteGreyTonesLightGrey60),
                ),
              );
            });
      },
    );
  }
}
