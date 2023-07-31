//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class FormProfile1Widget extends StatelessWidget {
  final Function(String?)? onChanged;
  final String initialValue;

  final bool validate;

  const FormProfile1Widget({
    Key? key,
    required this.onChanged,
    required this.validate,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).pageInitialProfile1WriteYourName;
        }
        return null;
      },
      obscureText: false,
      decoration: InputDecoration(
        errorText:
            validate ? S.of(context).pageInitialProfile1CompleteInfo : null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: S.of(context).pageInitialProfile1FullName,
        labelStyle:
            DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey60),
        hintText: S.of(context).pageInitialProfile1WriteFullName,
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
