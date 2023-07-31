import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodRowEmotionWidget extends StatelessWidget {
  final int numberEmotion;
  final String textEmotion;
  const MoodRowEmotionWidget({
    Key? key,
    required this.numberEmotion,
    required this.textEmotion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/emoticon_${numberEmotion.toString()}_color.svg',
          // 'assets/images/emoticon_${widget.userMood.rate.toString()}_unselected.svg',
          height: 20,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          width: 5,
        ),
        Text(textEmotion),
      ],
    );
  }
}
