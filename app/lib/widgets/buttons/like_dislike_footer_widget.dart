//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/dialogs/footer_deeplink_dialog.dart';

class LikeDislikeFooterWidget extends StatelessWidget {
  final Unit unit;
  final bool? useful;
  final VoidCallback setValueTrue;
  final VoidCallback setValueFalse;
  final VoidCallback onPressedLikeButton;
  const LikeDislikeFooterWidget({
    Key? key,
    required this.unit,
    required this.useful,
    required this.setValueTrue,
    required this.setValueFalse,
    required this.onPressedLikeButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 4,
              child: Text(S.of(context).widgetUnitFooterUsefulQuestion,
                  style: DanaTheme.textCta(DanaTheme.paletteWhite))),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setValueTrue();
                ShowModal.showBottomSheet(
                  context: context,
                  widget: FooterDeeplinkDialog(
                    title: S.of(context).dialogFooterDeeplinkLikeTitle,
                    description:
                        S.of(context).dialogFooterDeeplinkLikeDescription,
                    textButton: S.of(context).dialogFooterDeeplinkVisitTheme,
                    onPressedButton: () async {
                      onPressedLikeButton();
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
              child: buildSvgImage(
                (useful != null && useful == true)
                    ? 'ic_thumb_up_selected.svg'
                    : 'ic_thumb_up_unselected.svg',
                45,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setValueFalse();
                ShowModal.showBottomSheet(
                  context: context,
                  widget: FooterDeeplinkDialog(
                    title: S.of(context).dialogFooterDeeplinkDislikeTitle,
                    description:
                        S.of(context).dialogFooterDeeplinkDislikeDescription,
                    textButton: S.of(context).dialogFooterShareExperience,
                    onPressedButton: () async {
                      await onContact(context);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
              child: buildSvgImage(
                (useful != null && useful == false)
                    ? 'ic_thumb_down_selected.svg'
                    : 'ic_thumb_down_unselected.svg',
                45,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onContact(BuildContext context) async {
    String uri = 'mailto:hola@dana.health';
    if (await canLaunchUrlString(uri)) {
      await launchUrlString(uri);
    } else {
      print("No email client found");
    }
  }
}
