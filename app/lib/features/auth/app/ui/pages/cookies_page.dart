import 'package:flutter/material.dart';

import 'package:app/widgets/content/cookies_content_widget.dart';
import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/shared/social_app_bar.dart';

class CookiesPage extends StatefulWidget {
  final ProfileLinks profileLink;

  const CookiesPage({
    Key? key,
    required this.profileLink,
  }) : super(key: key);

  @override
  _CookiesPageState createState() => _CookiesPageState();
}

class _CookiesPageState extends State<CookiesPage> {
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
                child: CookiesContentWidget(),
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
                title: S.of(context).pageLinkContentTitleProfileLinksCookies,
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
