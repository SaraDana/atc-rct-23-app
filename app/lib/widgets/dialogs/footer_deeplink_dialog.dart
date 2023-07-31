//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/content/header_background_unit_deatil_widget.dart';

class FooterDeeplinkDialog extends StatelessWidget {
  final String title;
  final String description;
  final String textButton;
  final VoidCallback? onPressedButton;
  const FooterDeeplinkDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.textButton,
    this.onPressedButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Flexible(
          flex: 9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: Container(
              width: double.infinity,
              color: DanaTheme.whiteColor,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/woman_image.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    child: HeaderBackgroundUnitDetailWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: DanaTheme.bannerTitle1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  description,
                  style: DanaTheme.bannerTitle2,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    if (onPressedButton != null) onPressedButton!();
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      color: DanaTheme.paletteOrange,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        textButton,
                        style: DanaTheme.bannerTitle2.copyWith(
                          color: DanaTheme.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
