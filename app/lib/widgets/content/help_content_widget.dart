//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';

class HelpContentWidget extends StatelessWidget {
  const HelpContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
              text: '\n\n${S.of(context).pageLinkContentHelpChangeTitle}',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          TextSpan(
              text: '\n\n${S.of(context).helpPageText}\n',
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
          _createLink('${S.of(context).helpPagePerinatal}',
              'https://dana.health/programs/wDT3gkKBVQCkHnN8pzCA'),
          _createLink('${S.of(context).helpPageAnxiety}',
              'https://dana.health/programs/rn2EAiMJz6nVFkVLZDSs'),
          _createLink('${S.of(context).helpPageViolence}',
              'https://dana.health/programs/2gdTD7wxu0FdiJVqmNeR'),
          _createLink('${S.of(context).helpPageNeedHelp}',
              'https://dana.health/programs/euBZWUPA2D1XemgsbAmL'),
          _createLink('${S.of(context).helpPagePrem}',
              'https://dana.health/programs/eemmRAFvk2RWw8AUiILi'),
          _createLink('${S.of(context).helpPageDifficulties}',
              'https://dana.health/programs/UtyG3YT0RsfDZe6AtTd4'),
          _createLink('${S.of(context).helpPageChildbirth}',
              'https://dana.health/programs/uUo0UAsxuVFIZ21lP6L8'),
        ],
      ),
    );
  }
}

TextSpan _createLink(String text, String link) {
  return TextSpan(
    text: '\n' + text + '\n',
    style: DanaTheme.linkText(),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        locator<DeeplinkCubit>().openLink(deeplink: Uri.parse(link));
      },
  );
}
