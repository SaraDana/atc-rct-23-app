import 'package:app/core/extensions/snackbar_extensions.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/layouts/auth_page_layout.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/auth/app/ui/widgets/sign_up_email_form.dart';
import 'package:flutter/material.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/features/auth/app/ui/widgets/auth_footer_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/auth/index.dart';

class SignUpEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      bloc: locator<SignUpCubit>(),
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          context.showErrorSnackBar(
              message: state.errorMessage ??
                  S.of(context).pageRegisterMailExistingEmail);
        }
      },
      child: AuthPageLayout(
          appBarTitle: S.of(context).screenRegisterMailAppbarTitle,
          footer: AuthFooterWidget(
            text: S.of(context).screenAuthMemberYet +
                "\n" +
                S.of(context).screenAuthMemberYet2,
            clickedText: S.of(context).screenAuthMemberYetLink,
            onTap: () => context.goNamed(AppRoutes.login.name),
          ),
          child: SignUpEmailForm()),
    );
  }
}
