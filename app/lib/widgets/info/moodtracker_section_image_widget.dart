import 'package:app/utils/images.dart';
import 'package:flutter/material.dart';

class MoodtrackerSectionImageWidget extends StatelessWidget {
  final String imageName;
  const MoodtrackerSectionImageWidget({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: buildSvgImage(imageName),
    );
  }
}
