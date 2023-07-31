import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class BlockPurchaseDialog extends StatelessWidget {
  const BlockPurchaseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      title: S.of(context).dialogBlockPurchaseTitle,
      bodyText: S.of(context).dialogBlockPurchaseMessage,
      buttonsSection: CtaButton(
        onPressed: () {
          Navigator.pop(context);
        },
        text: S.of(context).dialogBlockPurchaseButton,
        color: DanaTheme.paletteDarkBlue,
      ),
    );
  }
}
