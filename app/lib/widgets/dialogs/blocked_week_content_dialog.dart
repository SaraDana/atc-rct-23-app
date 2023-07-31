import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class BlockedWeekContentDialog extends StatelessWidget {
  String week;
  BlockedWeekContentDialog({required this.week, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      title: S.of(context).weeDialogLockedUnitTitle,
      bodyText: S.of(context).lockerWeekDialogContent('"Programas"'),
      buttonsSection: CtaButton(
        onPressed: () {
          Navigator.pop(context);
        },
        text: S.of(context).lockerWeekDialogButtonText,
        color: DanaTheme.paletteDarkBlue,
      ),
    );
  }
}
