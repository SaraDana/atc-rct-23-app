import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/styles/input_decorations.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:app/features/auth/index.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class RecoverPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).screenForgotPasswordTitle,
            textAlign: TextAlign.center,
            style: DanaTheme.textHeadline(DanaTheme.paletteDarkBlue)),
        Text(S.of(context).screenForgotPasswordSubtitle,
            style: DanaTheme.textSubHeadline(DanaTheme.paletteDarkBlue)),
        Container(height: DanaTheme.formMarginTop),
        _EmailInput(),
        gapH12,
        _RecoverButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordCubit, RecoverPasswordState>(
      bloc: locator<RecoverPasswordCubit>(),
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
            onChanged: (email) =>
                locator<RecoverPasswordCubit>().emailChanged(email),
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

class _RecoverButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordCubit, RecoverPasswordState>(
      bloc: locator<RecoverPasswordCubit>(),
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
                      ? () => locator<RecoverPasswordCubit>()
                          .recoverPasswordByEmail()
                      : null,
                  text: S.of(context).screenForgotPasswordButton,
                  color: DanaTheme.paletteOrange,
                ),
              );
      },
    );
  }
}
