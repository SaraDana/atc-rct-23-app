import 'package:app/models/user_mood_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class MoodItemWidget extends StatefulWidget {
  final UserMood userMood;
  final VoidCallback? onPressed;

  const MoodItemWidget({Key? key, required this.userMood, this.onPressed})
      : super(key: key);

  @override
  _MoodItemWidgetState createState() => _MoodItemWidgetState();
}

class _MoodItemWidgetState extends State<MoodItemWidget> {
  @override
  Widget build(BuildContext context) {
    var moodDate = widget.userMood.at!;
    String moodDay = DateFormat('dd').format(moodDate);
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 75,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/bg_unit_number.svg',
                    alignment: Alignment.bottomLeft,
                    fit: BoxFit.fitHeight,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        moodDay,
                        style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.userMood.comment ?? "",
                style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/images/emoticon_${widget.userMood.rate.toString()}_unselected.svg',
              height: 20,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
