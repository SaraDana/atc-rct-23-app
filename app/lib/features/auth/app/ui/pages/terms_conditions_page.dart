import 'package:app/config/constants.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app/widgets/content/terms_and_conditions_content_widget.dart';

import 'package:app/widgets/shared/social_app_bar.dart';

class TermsConditionsPage extends StatefulWidget {
  final ProfileLinks profileLink;

  const TermsConditionsPage({
    Key? key,
    required this.profileLink,
  }) : super(key: key);

  @override
  _TermsConditionsPageState createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 155),
                child: TermsAndConditionsContentsWidget(),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                color: DanaTheme.bgAppbar,
              ),
              SocialAppBar(
                title: S
                    .of(context)
                    .pageLinkContentTitleProfileLinksTermsAndConditions,
                bgColor: DanaTheme.bgAppbar,
                showBackButton: true,
                showLogo: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TermsConditionsWidget extends StatelessWidget {
  const TermsConditionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DanaTheme.paddingSignInButtons,
        right: DanaTheme.paddingSignInButtons,
      ),
      child: RichText(
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
              text: S.of(context).pageRegisterMailTermsAndConditions,
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
                text: ' ${S.of(context).pageRegisterMailConsultOur}',
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
    );
  }
}
