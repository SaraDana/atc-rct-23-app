//IMPORT EXTERN APP
import 'package:app/config/constants.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:app/features/auth/index.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class SignUpEmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).screenRegisterMailTitle,
            style: DanaTheme.textHeadline(DanaTheme.paletteDarkBlue)),
        Text(S.of(context).screenRegisterMailSubtitle,
            style: DanaTheme.textSubHeadline(DanaTheme.paletteDarkBlue)),
        gapH8,
        _EmailInput(),
        gapH8,
        _PasswordInput(),
        gapH8,
        _PasswordInputRepeat(),
        gapH8,
        _RegisterButton(),
        gapH8,
        _AcceptTerms(),
        gapH8,
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      bloc: locator<SignUpCubit>(),
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => locator<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: AppInputsDecorations.editProfileInput(
            hintText: S.of(context).pageForgotPasswordEmailText,
            labelText: S.of(context).pageForgotPasswordEmailText,
            context: context,
          )..copyWith(
              errorText: state.email.invalid
                  ? S.of(context).pageRegisterMailWriteEmail
                  : null),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      bloc: locator<SignUpCubit>(),
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              locator<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          decoration: AppInputsDecorations.editProfileInput(
            hintText: S.of(context).pageLoginMailPasswordText,
            labelText: S.of(context).pageLoginMailPasswordText,
            context: context,
          )..copyWith(
              errorText: state.password.invalid
                  ? S.of(context).pageRegisterMailWritePassword
                  : null),
        );
      },
    );
  }
}

class _PasswordInputRepeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      bloc: locator<SignUpCubit>(),
      buildWhen: (previous, current) =>
          previous.passwordRepeat != current.passwordRepeat,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              locator<SignUpCubit>().confirmedPasswordChanged(password),
          obscureText: true,
          decoration: AppInputsDecorations.editProfileInput(
            hintText: S.of(context).pageRegisterMailRepeatPassword,
            labelText: S.of(context).pageRegisterMailRepeatPassword,
            context: context,
          ).copyWith(
              errorStyle: TextStyle(color: Colors.red),
              errorText: state.passwordRepeat.invalid
                  ? S.of(context).pageRegisterMailPasswordsNotMatching
                  : null),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      bloc: locator<SignUpCubit>(),
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator(
                color: DanaTheme.paletteFOrange,
              )
            : SizedBox(
                width: double.infinity,
                child: CtaButton(
                  onPressed: state.status.isValidated
                      ? () => locator<SignUpCubit>().signUpFormSubmitted()
                      : null,
                  text: S.of(context).screenRegisterMailButton,
                  color: DanaTheme.paletteOrange,
                ),
              );
      },
    );
  }
}

class _AcceptTerms extends StatelessWidget {
  const _AcceptTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      bloc: locator<SignUpCubit>(),
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: state.acceptTerms.value,
                  onChanged: (bool? value) =>
                      locator<SignUpCubit>().acceptTermsChanged(value ?? false),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: S.of(context).pageRegisterMailReadAndAccept,
                          style: DanaTheme.textSuperSmallText(
                              DanaTheme.paletteGreyTonesLightGrey80)),
                      TextSpan(
                        text:
                            '${S.of(context).pageRegisterMailPrivacyPolicy}\n',
                        style: DanaTheme.textSuperSmallText(
                            DanaTheme.paletteOrange,
                            underline: true),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(AppRoutes.privacity.name,
                                extra: ProfileLinks.PRIVACITY);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.left,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.fade,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: S.of(context).pageRegisterMailAcceptingOur,
                      style: DanaTheme.textSuperSmallerTextBoldEmotions(
                          DanaTheme.paletteGreyTonesLightGrey80)),
                  TextSpan(
                    text:
                        '${S.of(context).pageRegisterMailTermsAndConditions}\n',
                    style: DanaTheme.textSuperSmallerTextBoldEmotions(
                        DanaTheme.paletteOrange,
                        underline: true),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed(AppRoutes.termsAndConditions.name,
                            extra: ProfileLinks.TERMS_AND_CONDITIONS);
                      },
                  ),
                  TextSpan(
                      text: S.of(context).pageRegisterMailConsultOur,
                      style: DanaTheme.textSuperSmallerTextBoldEmotions(
                          DanaTheme.paletteGreyTonesLightGrey80)),
                  TextSpan(
                    text: S.of(context).pageRegisterMailDataPrivacyPolicy,
                    style: DanaTheme.textSuperSmallerTextBoldEmotions(
                        DanaTheme.paletteOrange,
                        underline: true),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed(AppRoutes.privacity.name,
                            extra: ProfileLinks.PRIVACITY);
                      },
                  ),
                  TextSpan(
                      text: ' ${S.of(context).pageRegisterMailAnd} ',
                      style: DanaTheme.textSuperSmallerTextBoldEmotions(
                          DanaTheme.paletteGreyTonesLightGrey80)),
                  TextSpan(
                    text: S.of(context).pageRegisterMailCookiesPolicy,
                    style: DanaTheme.textSuperSmallerTextBoldEmotions(
                        DanaTheme.paletteOrange,
                        underline: true),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed(AppRoutes.cookies.name,
                            extra: ProfileLinks.COOKIES);
                      },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return DanaTheme.paletteDarkBlue;
  }
  return DanaTheme.paletteDanaPink;
}
