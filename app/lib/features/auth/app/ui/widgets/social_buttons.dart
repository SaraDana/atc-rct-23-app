import 'dart:io' show Platform;
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/buttons/dana_icon_button.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/auth/index.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      bloc: locator<SignInCubit>(),
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator(
                color: DanaTheme.paletteFOrange,
              )
            : Column(
                children: [
                  _LoginWithGoogleButton(),
                  if (Platform.isIOS) ...[
                    gapH16,
                    _LoginWithAppleButton(),
                  ],
                  gapH16,
                  _LoginWithFacebookButton(),
                ],
              );
      },
    );
  }
}

class _LoginWithFacebookButton extends StatelessWidget {
  const _LoginWithFacebookButton() : super();

  @override
  Widget build(BuildContext context) {
    return DanaIconButton(
        text: S.of(context).screenAuthButtonFacebook,
        imagePath: 'ic_facebook.svg',
        onPressed: () => locator<SignInCubit>().signInWithFacebook());
  }
}

class _LoginWithGoogleButton extends StatelessWidget {
  const _LoginWithGoogleButton() : super();

  @override
  Widget build(BuildContext context) {
    return DanaIconButton(
        text: S.of(context).screenAuthButtonGoogle,
        imagePath: 'ic_google.svg',
        onPressed: () => locator<SignInCubit>().signInWithGoogle());
  }
}

class _LoginWithAppleButton extends StatelessWidget {
  const _LoginWithAppleButton() : super();

  @override
  Widget build(BuildContext context) {
    return DanaIconButton(
        text: S.of(context).screenAuthButtonApple,
        imagePath: 'ic_apple.svg',
        onPressed: () => locator<SignInCubit>().signInWithApple());
  }
}
