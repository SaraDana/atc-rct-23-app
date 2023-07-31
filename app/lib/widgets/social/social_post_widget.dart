import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../models/publication_model.dart';
import '../../styles/dana_theme.dart';
import 'social_pin_widget.dart';

class SocialPostWidget extends StatelessWidget {
  final Publication publication;
  final bool isFirstChild;
  final bool isPinned;
  final bool isInList;
  final bool isDarkFilter;

  const SocialPostWidget(
      {Key? key,
      required this.publication,
      this.isFirstChild = false,
      this.isPinned = false,
      this.isInList = false,
      this.isDarkFilter = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: 211,
            child: publication.backgroundImage.isEmpty
                ? Container(
                    color: DanaTheme.grayColor,
                  )
                : Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: this.isInList
                              ? BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                )
                              : BorderRadius.all(Radius.circular(0.0)),
                          child: FadeInImage.memoryNetwork(
                            fadeInCurve: Curves.easeInCirc,
                            fadeInDuration: Duration(milliseconds: 50),
                            image: publication.backgroundImage,
                            fit: BoxFit.fitWidth,
                            placeholder: kTransparentImage,
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                          color: (isDarkFilter)
                              ? DanaTheme.paletteDarkBlue.withOpacity(0.5)
                              : DanaTheme.paletteDarkBlue.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: this.isInList
                  ? BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )
                  : BorderRadius.all(Radius.circular(0.0)),
              color: (isDarkFilter)
                  ? DanaTheme.paletteDarkBlue.withOpacity(0.5)
                  : DanaTheme.paletteDarkBlue.withOpacity(0.3),
            ),
            width: screenSize.width,
            height: 211,
          ),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 211,
            child: Center(
              child: Text(
                publication.title!,
                textAlign: TextAlign.center,
                style:
                    DanaTheme.subtitle1.copyWith(color: DanaTheme.paletteWhite),
              ),
            ),
          ),
          if (isPinned)
            Positioned(
              top: 12,
              left: 21,
              child: SocialPinWidget(),
            )
        ],
      ),
    );
  }
}
