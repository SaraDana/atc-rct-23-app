import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MoodTrackerToolTip extends StatelessWidget {
  const MoodTrackerToolTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: DanaTheme.paletteDarkBlue.withOpacity(.9),
      child: Column(
        children: [
          SizedBox(
            height: 354,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: DanaTheme.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                          child: _textGrapichType(context,
                              grapichType: GrapichType.EMOCIONES)),
                      Flexible(
                          child: _textGrapichType(context,
                              grapichType: GrapichType.VINCULOS)),
                    ],
                  ),
                ),
                16.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: .35.sw,
                        child: Column(
                          children: [
                            Container(
                              width: 30,
                              child: SvgPicture.asset(
                                'assets/images/ic_tooltip_left_arrow.svg',
                                width: 30.w,
                              ),
                            ),
                            4.h.verticalSpace,
                            Text(
                              "Visualiza aquí tu emocionario y evolución de estado de ánimo día a día",
                              textAlign: TextAlign.left,
                              style: DanaTheme.bannerTitle2.copyWith(
                                  color: DanaTheme.whiteColor, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: .35.sw,
                        child: Column(
                          children: [
                            Container(
                              width: 30.w,
                              child: SvgPicture.asset(
                                'assets/images/ic_tooltip_right_arrow.svg',
                                width: 30,
                              ),
                            ),
                            4.h.verticalSpace,
                            Text(
                              "Descubre el poder de tus acciones: Mira aquí cómo cuidas tus vínculos cada semana.",
                              textAlign: TextAlign.right,
                              style: DanaTheme.bannerTitle2.copyWith(
                                  color: DanaTheme.whiteColor, fontSize: 14.sp),
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
                    locator<UserMoodCubit>().setTrackerTutorialSeen();
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
                              color: DanaTheme.whiteColor, fontSize: 14.sp),
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
