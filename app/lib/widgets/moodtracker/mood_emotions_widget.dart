import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/moodtracker/mood_row_emotion_widget.dart';
import 'package:flutter/material.dart';

class MoodEmotionsWidget extends StatelessWidget {
  const MoodEmotionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
          color: DanaTheme.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MoodRowEmotionWidget(
            numberEmotion: 1,
            textEmotion: 'fatal',
          ),
          MoodRowEmotionWidget(
            numberEmotion: 2,
            textEmotion: 'mal',
          ),
          MoodRowEmotionWidget(
            numberEmotion: 3,
            textEmotion: 'meh',
          ),
          MoodRowEmotionWidget(
            numberEmotion: 4,
            textEmotion: 'bien',
          ),
          MoodRowEmotionWidget(
            numberEmotion: 5,
            textEmotion: 'increíble',
          ),
        ],
      ),
    );
  }
}
