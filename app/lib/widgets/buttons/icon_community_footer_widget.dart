//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORTE INTERN APP
import 'package:app/utils/images.dart';
import 'package:app/utils/modal.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/widgets/dialogs/footer_deeplink_dialog.dart';

class IconCommunityFooterWidget extends StatelessWidget {
  final Unit unit;
  final VoidCallback onPressed;
  const IconCommunityFooterWidget({
    Key? key,
    required this.unit,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ShowModal.showBottomSheet(
          context: context,
          widget: FooterDeeplinkDialog(
            title: S.of(context).dialogFooterDeeplinkThemeTitle,
            description: S.of(context).dialogFooterDeeplinkThemeDescription,
            textButton: S.of(context).dialogFooterDeeplinkVisitTheme,
            onPressedButton: () async {
              onPressed();
              Navigator.of(context).pop();
            },
          ),
        );
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: buildSvgImage('ic_bubble.svg', 22),
      ),
    );
  }
}
