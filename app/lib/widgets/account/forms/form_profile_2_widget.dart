import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class FormProfile2Widget extends StatelessWidget {
  final TextEditingController textEditingController;

  final bool validate;
  final Function() onTap;
  const FormProfile2Widget({
    Key? key,
    required this.validate,
    required this.onTap,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).pageInitialProfile2SelectBirthDate;
        }
        return null;
      },
      onTap: onTap,
      obscureText: false,
      decoration: InputDecoration(
        errorText:
            validate ? S.of(context).pageInitialProfile2CompleteInfo : null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: S.of(context).pageInitialProfile2SelectBirthdate,
        labelStyle:
            DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey60),
        hintText: S.of(context).pageInitialProfile2Birthdate,
        hintStyle:
            DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey20),
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
          borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DanaTheme.paletteOrange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(DanaTheme.formFieldBorderRadius),
        ),
        filled: true,
        fillColor: DanaTheme.paletteFPink,
        contentPadding: EdgeInsets.fromLTRB(16, 24, 0, 24),
      ),
      style: DanaTheme.textSmallTextBold(DanaTheme.paletteGreyTonesLightGrey60),
    );
  }
}
