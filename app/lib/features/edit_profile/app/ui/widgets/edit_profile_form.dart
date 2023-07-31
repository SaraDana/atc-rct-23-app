//IMPORT EXTERN APP
import 'dart:io';
import 'package:app/config/constants.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_state.dart';
import 'package:app/features/edit_profile/app/ui/widgets/dialogs/moments_dialog.dart';
import 'package:app/features/edit_profile/app/ui/widgets/dialogs/select_genre_dialog.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:app/utils/account.utils.dart';
import 'package:app/utils/modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:formz/formz.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).screenEditProfileTitle,
            style: DanaTheme.textHeadline(DanaTheme.paletteDarkBlue)),
        gapH20,
        NameFormField(),
        gapH8,
        CityFormField(),
        gapH8,
        GenreFormField(),
        gapH8,
        BirthdayFormField(),
        gapH8,
        Row(
          children: [
            Expanded(
              flex: 10,
              child: SelectMomentFormField(),
            ),
            gapW4,
            WeeksTextFormField(),
            MonthsTextFormField(),
          ],
        ),
        gapH20,
        SubmitButton(),
      ],
    );
  }
}

class GenreFormField extends StatelessWidget {
  const GenreFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState, String>(
      bloc: locator<EditProfileCubit>(),
      selector: (state) => state.genre.value,
      builder: (context, genre) {
        return TextFormField(
          key: UniqueKey(),
          readOnly: true,
          initialValue: translateGenre(context, stringToGenre(genre)),
          onTap: () => ShowModal.showCustomDialog(
              context: context, body: SelectGenreDialog()),
          decoration: AppInputsDecorations.editProfileInput(
              context: context,
              hintText: S.of(context).pageProfileEditGender,
              labelText: S.of(context).pageProfileEditGender),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class NameFormField extends StatelessWidget {
  const NameFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState, String>(
      selector: (state) => state.name.value,
      bloc: locator<EditProfileCubit>(),
      builder: (context, name) {
        return TextFormField(
          initialValue: name,
          onChanged: (value) => locator<EditProfileCubit>().updateName(value),
          decoration: AppInputsDecorations.editProfileInput(
              hintText: S.of(context).pageProfileEditName,

              context: context,
              labelText: S.of(context).pageProfileEditName),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class CityFormField extends StatelessWidget {
  const CityFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState, String>(
      selector: (state) => state.city ?? '',
      bloc: locator<EditProfileCubit>(),
      builder: (context, city) {
        return TextFormField(
          initialValue: city,
          onChanged: (value) => locator<EditProfileCubit>().updateCity(value),
          decoration: AppInputsDecorations.editProfileInput(
              hintText: S.of(context).pageProfileEditCity,
              context: context,
              labelText: S.of(context).pageProfileEditCity),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class BirthdayFormField extends StatelessWidget {
  const BirthdayFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState, String>(
      bloc: locator<EditProfileCubit>(),
      selector: (state) => state.birthdate.value,
      builder: (context, birthdate) {
        return TextFormField(
          key: UniqueKey(),
          readOnly: true,
          initialValue: birthdate,
          onTap: () => Platform.operatingSystem == 'ios'
              ? AccountUtils().showProfileDatePickerIos(
                  context,
                  context,
                  onDateTimeChanged: (date) =>
                      locator<EditProfileCubit>().updateBirthdate(date),
            title: S.current.screenInitialProfilePage2Title,
            initialValue: stringToDateWithFormat(birthdate),
            
                )
              : AccountUtils().showProfileDatePicker(
                  context,
                  onDateTimeChanged: (date) =>
                      locator<EditProfileCubit>().updateBirthdate(date),
              title: S.current.screenInitialProfilePage2Title,
              initialValue: stringToDateWithFormat(birthdate),


          ),
          obscureText: false,
          decoration: AppInputsDecorations.editProfileInput(
              context: context,
              hintText: S.of(context).pageProfileEditBirthdate,
              labelText: S.of(context).pageProfileEditBirthdate),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class SelectMomentFormField extends StatelessWidget {
  const SelectMomentFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState,
        InitialProfileMoment>(
      bloc: locator<EditProfileCubit>(),
      selector: (state) =>
          state.profileMoment ?? InitialProfileMoment.NONE_OF_THE_ABOVE,
      builder: (context, profileMoment) {
        return TextFormField(
          initialValue:
              initialProfileMomentToStringTraduction(context, profileMoment),
          key: UniqueKey(),
          obscureText: false,
          readOnly: true,
          onTap: () => ShowModal.showCustomDialog(
              context: context, body: MomentsDialog()),
          decoration: AppInputsDecorations.editProfileInput(
              context: context,
              hintText: S.of(context).pageProfileEditState,
              labelText: S.of(context).pageProfileEditState),
          style: DanaTheme.textSmallTextBold(
              DanaTheme.paletteGreyTonesLightGrey60),
        );
      },
    );
  }
}

class WeeksTextFormField extends StatelessWidget {
  const WeeksTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      bloc: locator<EditProfileCubit>(),
      builder: (context, state) {
        return state.showPregnantWeeks == false
            ? SizedBox.shrink()
            : Expanded(
                flex: 9,
                child: TextFormField(
                  key: UniqueKey(),
                  initialValue: state.pregnantWeeks != null
                      ? state.pregnantWeeks.toString()
                      : '',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  decoration: AppInputsDecorations.editProfileInput(
                    context: context,
                      hintText: S.of(context).screenProfileViewPregnantWeek,
                      labelText: S.of(context).screenProfileViewPregnantWeek)
                      .copyWith(
                      errorText: state.lastPeriod.invalid
                          ? S.of(context).pageInitialProfile2CompleteInfo
                          : null),
                  onTap: () => Platform.operatingSystem == 'ios'
                      ? AccountUtils().showProfileDatePickerIos(
                    context,
                    context,
                    onDateTimeChanged: (date) =>
                        locator<EditProfileCubit>()
                            .updateLastPeriodDate(date),
                      title: S.current.screenInitialProfilePage4MomentImPregnantFormField

                  )
                      : AccountUtils().showProfileDatePicker(
                    context,
                    onDateTimeChanged: (date) =>
                        locator<EditProfileCubit>()
                            .updateLastPeriodDate(date),
                      title: S.current.screenInitialProfilePage4MomentImPregnantFormField

                  ),

                ),
              );
      },
    );
  }
}

class MonthsTextFormField extends StatelessWidget {
  const MonthsTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      bloc: locator<EditProfileCubit>(),
      builder: (context, state) {
        return state.showMotherMonths == false
            ? SizedBox.shrink()
            : Expanded(
                flex: 8,
                child: TextFormField(
                  key: UniqueKey(),
                  initialValue: state.motherMonths == null
                      ? null
                      : state.motherMonths.toString(),
                  obscureText: false,
                  readOnly: true,
                  onTap: () => Platform.operatingSystem == 'ios'
                      ? AccountUtils().showProfileDatePickerIos(
                    context,
                    context,
                    onDateTimeChanged: (date) =>
                        locator<EditProfileCubit>()
                            .updateChildBirthDate(date),
                    title: S.current.screenInitialProfilePage4MomentImAlreadyMotherFormField
                  )
                      : AccountUtils().showProfileDatePicker(
                    context,
                    onDateTimeChanged: (date) =>
                        locator<EditProfileCubit>()
                            .updateChildBirthDate(date),
                      title: S.current.screenInitialProfilePage4MomentImAlreadyMotherFormField

                  ),
                  decoration: AppInputsDecorations.editProfileInput(
                      context: context,
                      hintText: S.of(context).screenProfileViewMotherMonths,
                      labelText: S.of(context).screenProfileViewMotherMonths),
                  style: DanaTheme.textSmallTextBold(
                      DanaTheme.paletteGreyTonesLightGrey60),
                ),
              );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      bloc: locator<EditProfileCubit>(),
      builder: (context, state) {
        return state.formzStatus.isSubmissionInProgress
            ? CircularProgressIndicator()
            : CtaButton(
                onPressed: locator<EditProfileCubit>().iCanUpdated
                    ? () => locator<EditProfileCubit>().updateEditProfileData()
                    : null,
                text: S.of(context).screenEditProfileButtonSave,
                color: DanaTheme.paletteOrange,
                textColor: Colors.white,
              );
      },
    );
  }
}
