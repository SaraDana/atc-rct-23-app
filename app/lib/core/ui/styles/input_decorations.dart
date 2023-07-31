import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';

class AppInputsDecorations {
  static InputDecoration editProfileInput(
      {required String hintText,
      required String labelText,
      required BuildContext context}) {
    double _padding = getScreenHeight(context) > 800 ? 24.0 : 12.0;

    return InputDecoration(
      labelText: labelText, //,
      labelStyle:
          DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey60),
      hintText: hintText, //,
      hintStyle: DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DanaTheme.paletteGreyTonesLightGrey20,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DanaTheme.paletteGreyTonesLightGrey80,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius),
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DanaTheme.paletteOrange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DanaTheme.paletteOrange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius)),
      filled: true,
      fillColor: DanaTheme.tertiaryColor,
      contentPadding: EdgeInsets.fromLTRB(16, _padding, 0, _padding),
    );
  }

  static InputDecoration onboardingInput(
      {required String hintText,
      required String labelText,
      required BuildContext context}) {
    double _padding = getScreenHeight(context) > 800 ? 24.0 : 12.0;

    return InputDecoration(
      labelText: labelText, //,
      labelStyle:
          DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey60),
      hintText: hintText, //,
      hintStyle: DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DanaTheme.paletteDarkBlue.withOpacity(0.6),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DanaTheme.paletteDarkBlue,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius),
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DanaTheme.paletteOrange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DanaTheme.paletteOrange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius)),
      filled: true,
      fillColor: DanaTheme.paletteFPink,
      contentPadding: EdgeInsets.fromLTRB(16, _padding, 0, _padding),
    );
  }
}
