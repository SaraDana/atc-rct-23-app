import 'package:app/core/extensions/snackbar_extensions.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/layouts/auth_page_layout.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/auth/index.dart';
import 'package:flutter/material.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/features/auth/app/ui/widgets/auth_footer_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class RecoverPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecoverPasswordCubit, RecoverPasswordState>(
      bloc: locator<RecoverPasswordCubit>(),
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          context.showSnackBar(
              message: S.of(context).pageForgotPasswordSentEmail);
          context.goNamed(AppRoutes.login.name);
        }
      },
      child: AuthPageLayout(
          appBarTitle: S.of(context).screenForgotPasswordBarTitle,
          footer: AuthFooterWidget(
              text: S.of(context).screenAuthMemberNotYet,
              clickedText: S.of(context).screenAuthMemberNotYetLink,
              onTap: () => context.pushNamed(AppRoutes.register.name)),
          child: RecoverPasswordForm()),
    );
  }
}
