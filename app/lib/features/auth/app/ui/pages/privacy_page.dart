//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/widgets/content/privacy_content_widget.dart';
import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/shared/social_app_bar.dart';

class PrivacyPage extends StatefulWidget {
  final ProfileLinks profileLink;

  const PrivacyPage({
    Key? key,
    required this.profileLink,
  }) : super(key: key);

  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
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
                child: PrivacyContentWidget(),
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
                title: S.of(context).pageLinkContentTitleProfileLinksPrivacity,
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
