import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:app/features/auth/index.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class SignInEmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).screenLoginMailTitle,
            style: DanaTheme.textHeadline(DanaTheme.paletteDarkBlue)),
        Text(S.of(context).screenLoginMailSubtitle,
            style: DanaTheme.textSubHeadline(DanaTheme.paletteDarkBlue)),
        Container(height: DanaTheme.formMarginTop),
        _EmailInput(),
        gapH8,
        _PasswordInput(),
        gapH8,
        _LoginButton(),
        gapH12,
        _RecoverPasswordButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      bloc: locator<SignInCubit>(),
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
            onChanged: (email) => locator<SignInCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            decoration: AppInputsDecorations.editProfileInput(
              context: context,
              hintText: S.of(context).pageForgotPasswordEmailText,
              labelText: S.of(context).pageForgotPasswordEmailText,
            ));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      bloc: locator<SignInCubit>(),
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              locator<SignInCubit>().passwordChanged(password),
          obscureText: true,
          decoration: AppInputsDecorations.editProfileInput(
            context: context,
            hintText: S.of(context).pageLoginMailPasswordText,
            labelText: S.of(context).pageLoginMailPasswordText,
          ).copyWith(
              errorText: state.password.invalid
                  ? S.of(context).pageLoginMailIndicatePassword
                  : null),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      bloc: locator<SignInCubit>(),
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
                      ? () => locator<SignInCubit>().sigInWithCredentials()
                      : null,
                  text: S.of(context).screenLoginMailButton,
                  color: DanaTheme.paletteOrange,
                ),
              );
      },
    );
  }
}

class _RecoverPasswordButton extends StatelessWidget {
  const _RecoverPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.forgotPassword.name),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          S.of(context).screenLoginMailForgotPassword,
          style: DanaTheme.textSuperSmallText(
              DanaTheme.paletteGreyTonesLightGrey80),
        ),
      ),
    );
  }
}
