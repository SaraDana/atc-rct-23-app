//IMPORT EXTERN APP
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/generated/l10n.dart';

class AccountUtils {
  showProfileDatePicker(
    BuildContext context, {
    required Function(String) onDateTimeChanged,
    required String title,
    DateTime? initialValue,
  }) async {
    DateTime today = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialValue == null ? today : initialValue,
        firstDate: DateTime(today.year - 100, today.month, today.day),
        lastDate: today,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        helpText: title,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light().copyWith(
                primary: DanaTheme.paletteDanaPink,
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      onDateTimeChanged(formattedDate);
    }
  }

  // Show the modal that contains the CupertinoDatePicker
  showProfileDatePickerIos(
    ctx,
    BuildContext context, {
    required Function(String) onDateTimeChanged,
    required String title,
    DateTime? initialValue,
  }) {
    DateTime today = DateTime.now();
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 500,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(child: Text(title)),
                ),
                Container(
                  height: 400,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime:
                        initialValue == null ? today : initialValue,
                    minimumDate:
                        DateTime(today.year - 100, today.month, today.day),
                    maximumDate: today,
                    onDateTimeChanged: (DateTime dateTime) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(dateTime);
                      onDateTimeChanged(formattedDate);
                    },
                  ),
                ),
              ],
            ),

            // Close the modal
            CupertinoButton(
              child: Text(S.of(context).cupertinoDatePickerButton),
              onPressed: () => Navigator.of(ctx).pop(),
            )
          ],
        ),
      ),
    );
  }

  getOptionsProfile(
    BuildContext context, {
    required String text,
    required Genre genre,
    required Function() onTap,
    Genre? genreSelected,
  }) {
    return GestureDetector(
      key: UniqueKey(),
      onTap: onTap,
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
                    genre == genreSelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionsProfileMotherExperience(
    BuildContext context, {
    required String text,
    required InitialProfileMotherExperience motherExperience,
    InitialProfileMotherExperience? motherExperienceSelected,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
                    motherExperience == motherExperienceSelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionSetMotherMonths(
    BuildContext context, {
    required String text,
    required InitialProfileMotherMonths motherMonths,
    required InitialProfileMotherMonths motherMonthsSelected,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
                    motherMonths == motherMonthsSelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionMotherPregnant(
    BuildContext context, {
    required int weeks,
    required int pregnantWeeksSelected,
    required Function() onTap,
  }) {
    double padding = 10;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        margin: EdgeInsets.only(bottom: padding),
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
                  child: Text('$weeks ${weeks == 1 ? 'semana' : 'semanas'}',
                      style: DanaTheme.textCta(DanaTheme.paletteDarkBlue)),
                ),
                Container(
                  width: 30,
                  child: SvgPicture.asset(
                    weeks == pregnantWeeksSelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionProfileInformation(
    BuildContext context, {
    required String text,
    required InitialProfileHelp item,
    required List<InitialProfileHelp> selectedItems,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: DanaTheme.paletteWhite,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
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
                        style: DanaTheme.textCta(DanaTheme.paletteDarkBlue))),
                Container(
                  width: 30,
                  child: SvgPicture.asset(
                    selectedItems.contains(item)
                        ? 'assets/images/ic_checkbox_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionsProfileInformation6(
    BuildContext context, {
    required String text,
    required Function() onTap,
    required InitialProfileContentType item,
    required List<InitialProfileContentType> selectedItems,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: DanaTheme.paletteWhite,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
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
                    selectedItems.contains(item)
                        ? 'assets/images/ic_checkbox_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionProfileInformation7(
    BuildContext context, {
    required Function() onTap,
    required String text,
    required InitialProfileEmotions item,
    required String image,
    required List<InitialProfileEmotions> selectedItems,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: DanaTheme.bgCardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: DanaTheme.paletteGreyShadow.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.only(right: 10),
            color: DanaTheme.paletteWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/$image',
                  alignment: Alignment.topLeft,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  width: getScreenWidth(context) -
                      DanaTheme.bodyPadding * 2 -
                      10 -
                      70 -
                      30 -
                      34 -
                      20,
                  child: Text(text,
                      style: DanaTheme.textCta(DanaTheme.paletteDarkBlue)),
                ),
                Container(
                    width: 30,
                    child: SvgPicture.asset(
                      selectedItems.contains(item)
                          ? 'assets/images/ic_checkbox_selected.svg'
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

  getOptionProfileInformation8(
    BuildContext context, {
    required Function() onTap,
    required String text,
    required InitialProfilePsychologicalTherapy therapy,
    required InitialProfilePsychologicalTherapy psychologicalTherapySelected,
  }) {
    return GestureDetector(
      onTap: onTap,
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
                    therapy == psychologicalTherapySelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOptionProfileInformation9(
    BuildContext context, {
    required Function() onTap,
    required String text,
    required InitialProfileSupportGroup supportGroup,
    required InitialProfileSupportGroup supportGroupSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
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
                    supportGroup == supportGroupSelected
                        ? 'assets/images/ic_circle_selected.svg'
                        : 'assets/images/ic_circle_unselected.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
