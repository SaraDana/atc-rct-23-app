import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/buttons/dana_icon_button.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWithMailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DanaIconButton(
        color: DanaTheme.paletteDarkBlue,
        text: S.of(context).screenAuthButtonMail,
        imagePath: 'ic_email.svg',
        onPressed: () async =>
            context.pushNamed(AppRoutes.loginEmailPage.name));
  }
}

class RegisterWithMailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DanaIconButton(
        color: DanaTheme.paletteDarkBlue,
        text: S.of(context).screenAuthButtonMail,
        imagePath: 'ic_email.svg',
        onPressed: () async =>
            context.pushNamed(AppRoutes.registerEmailPage.name));
  }
}
