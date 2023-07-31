import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

final String linkPlayStore =
    'https://play.google.com/store/apps/details?id=health.dana.app';
final String linkAppStore = 'https://apps.apple.com/es/app/dana/id1559706974';

class NeedUpdateDialog extends StatelessWidget {
  const NeedUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DialogLayout(
          title: S.of(context).dialogForceUpdateTitle,
          bodyText: S.of(context).dialogForceUpdateMessage,
          buttonsSection: CtaButton(
              onPressed: () => goToStore(),
              text: S.of(context).dialogForceUpdateButton,
              color: DanaTheme.paletteDarkBlue)),
    );
  }
}

Future<void> goToStore() async {
  DanaAnalyticsService.trackForceUpdateClicked();
  await launchUrl(Uri.parse(Platform.isAndroid ? linkPlayStore : linkAppStore));
}
