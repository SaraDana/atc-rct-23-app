//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodTodayQuestionNewHomeWidget extends StatelessWidget {
  final Function() onTap;
  const MoodTodayQuestionNewHomeWidget({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(162),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(162),
          child: Container(
            width: .9.sw,
            color: DanaTheme.paletteOrange,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width: 10),
                Expanded(
                  child: Text(
                    S.of(context).screenTrackingCheckInQuestion,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DanaTheme.textCta(DanaTheme.paletteWhite)
                        .copyWith(fontSize: 18.sp),
                  ),
                ),
                Container(width: 10),
                Icon(
                  Icons.chevron_right,
                  color: DanaTheme.paletteWhite,
                  size: 30.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
