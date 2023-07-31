import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/new_home/mood_today_question_new_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePageToolTip extends StatelessWidget {
  const HomePageToolTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: DanaTheme.paletteDarkBlue.withOpacity(.9),
      child: Column(
        children: [
          SizedBox(
            height: 260,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    child: MoodTodayQuestionNewHomeWidget(onTap: () {})),
                16.h.verticalSpace,
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.h,
                        width: .45.sw,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 30.w,
                                  child: SvgPicture.asset(
                                    'assets/images/ic_tooltip_right_arrow.svg',
                                    width: 30.w,
                                  ),
                                ),
                              ],
                            ),
                            5.w.horizontalSpace,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: .35.sw,
                                  child: Text(
                                    "¡Tómate un minuto\n para conectar\n contigo!",
                                    textAlign: TextAlign.left,
                                    style: DanaTheme.bannerTitle2.copyWith(
                                        color: DanaTheme.whiteColor,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    locator<InitialProfileCubit>().setTipsComplated();
                  },
                  child: Container(
                    width: .35.sw,
                    child: Column(
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        4.h.verticalSpace,
                        Text(
                          "¡Lo he entendido!",
                          textAlign: TextAlign.right,
                          style: DanaTheme.bannerTitle2.copyWith(
                            color: DanaTheme.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                .15.sh.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textGrapichType(BuildContext context,
      {required GrapichType grapichType}) {
    if (grapichType == GrapichType.EMOCIONES) {
      return Container(
        height: 54.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: DanaTheme.paletteFOrange,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Center(
          child: Text(
            grapichType.convertGrapichTypeToString(),
            style: DanaTheme.textCta(DanaTheme.whiteColor),
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: double.infinity,
        height: 54.h,
        child: Center(
          child: Text(
            grapichType.convertGrapichTypeToString(),
            style: DanaTheme.textCta(DanaTheme.paletteDarkBlue.withOpacity(.6)),
          ),
        ),
      );
    }
  }
}
