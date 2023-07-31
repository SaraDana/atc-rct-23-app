import 'package:app/core/ui/styles/app_box_decorations.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/content/header_background_unit_deatil_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogLayout extends StatelessWidget {
  final String title;
  final String bodyText;
  final bool fullPage;
  final Widget? bodyWidget;
  final Widget buttonsSection;
  final String? image;

  const DialogLayout({
    Key? key,
    required this.title,
    required this.bodyText,
    required this.buttonsSection,
    this.bodyWidget,
    this.fullPage = false,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (image != null)
          Positioned(
            bottom: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.81,
                width: MediaQuery.of(context).size.width * 1,
                decoration: AppBoxDecoration.topBorderRounded.copyWith(
                  color: DanaTheme.lightGrayColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Sizes.p12,
                    bottom: MediaQuery.of(context).size.height * 0.5,
                  ),
                  child: SvgPicture.asset(
                    image!,
                  ),
                )),
          ),
        if (image != null)
          Positioned(
            bottom: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.59,
                width: MediaQuery.of(context).size.width * 1,
                child: HeaderBackgroundUnitDetailWidget()),
          ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Sizes.p8),
              decoration: AppBoxDecoration.topBorderRounded.copyWith(
                color: DanaTheme.whiteColor,
              ),
              height: image != null
                  ? MediaQuery.of(context).size.height * 0.50
                  : null,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    gapH24,
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: DanaTheme.textHeadlineSmall(
                          DanaTheme.paletteDarkBlue),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                      child: bodyWidget ?? SizedBox.shrink(),
                    ),
                    if (bodyText != "" && bodyText != null)
                      Text(bodyText,
                          textAlign: TextAlign.center,
                          style: DanaTheme.textBody(DanaTheme.paletteDarkBlue)),
                    if (bodyText != "" && bodyText != null) gapH20,
                    SizedBox(
                      width: double.infinity,
                      child: buttonsSection,
                    ),
                    gapH20,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
