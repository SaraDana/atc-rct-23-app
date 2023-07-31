import 'package:app/core/di/locator.dart';
import 'package:app/core/extensions/snackbar_extensions.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/ui/widgets/layouts/auth_page_layout.dart';
import 'package:app/features/auth/app/cubits/sign_in/sign_in_cubit.dart';
import 'package:app/features/auth/app/cubits/sign_in/sign_in_state.dart';
import 'package:app/features/auth/app/ui/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/features/auth/app/ui/widgets/auth_footer_widget.dart';
import 'package:app/features/auth/app/ui/widgets/login_mail_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      bloc: locator<SignInCubit>(),
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          context.showErrorSnackBar(
              message: state.errorMessage ??
                  S.of(context).pageLoginMailWrongPassword);
        }
      },
      child: AuthPageLayout(
          appBarTitle: S.of(context).screenLoginAppbarTitle,
          footer: AuthFooterWidget(
              text: S.of(context).screenAuthMemberNotYet,
              clickedText: S.of(context).screenAuthMemberNotYetLink,
              onTap: () => context.pushNamed(AppRoutes.register.name)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).screenLoginTitle,
                        textAlign: TextAlign.center,
                        style:
                            DanaTheme.textHeadline(DanaTheme.paletteDarkBlue),
                      ),
                      Text(
                        S.of(context).screenLoginSubtitle,
                        textAlign: TextAlign.center,
                        style: DanaTheme.textSubHeadline(
                            DanaTheme.paletteDarkBlue),
                      ),
                      gapH16,
                      LoginWithMailButton(),
                      gapH16,
                      SocialButtons(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
