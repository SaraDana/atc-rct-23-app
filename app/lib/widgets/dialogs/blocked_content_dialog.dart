import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class BlockedContentDialog extends StatelessWidget {
  const BlockedContentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      title: S.of(context).dialogLockedUnitTitle,
      bodyText: S.of(context).dialogLockedUnitDescription,
      buttonsSection: CtaButton(
        onPressed: () {
          Navigator.pop(context);
        },
        text: S.of(context).dialogLockedUnitButton,
        color: DanaTheme.paletteDarkBlue,
      ),
    );
  }
}
