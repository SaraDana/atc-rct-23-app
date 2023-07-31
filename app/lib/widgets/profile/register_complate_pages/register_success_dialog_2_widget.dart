import 'package:app/core/routing/app_router.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/cubits/question_new_home/question_new_home_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// this page will be show for
// - Soy la pareja de la madre
// - Soy profesional de la salud
// - Ninguna de las anteriores

class RegisterSuccessDialog2Widget extends StatefulWidget {
  @override
  _RegisterSuccessDialogWidget2State createState() =>
      _RegisterSuccessDialogWidget2State();
}

class _RegisterSuccessDialogWidget2State
    extends State<RegisterSuccessDialog2Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteDarkBlue,
      body: Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    width: getScreenWidth(context),
                    color: DanaTheme.paletteFBrown,
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 70.h,
                          child: Container(
                            width: 1.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/logo.svg',
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: 1.sw,
                            child: SvgPicture.asset(
                              'assets/images/register_success_page_2_top.svg',
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                              height: 250.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 1.sw,
                      child: SvgPicture.asset(
                        "assets/images/register_successful_page_wave.svg",
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: DanaTheme.bodyPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).onboardingComplatedPage2Title,
                      textAlign: TextAlign.center,
                      style:
                          DanaTheme.textBody(DanaTheme.paletteWhite).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.h.verticalSpace,
                    Text(
                      S.of(context).onboardingComplatedPage2Body,
                      textAlign: TextAlign.left,
                      style:
                          DanaTheme.textBody(DanaTheme.paletteWhite).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.h.verticalSpace,
                    Text(
                      S.of(context).onboardingComplatedPage2BottomText,
                      textAlign: TextAlign.center,
                      style:
                          DanaTheme.textBody(DanaTheme.paletteWhite).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 80.h,
                      child: GestureDetector(
                        onTap: () async {
                          context
                              .read<QuestionNewHomeCubit>()
                              .changeShowProfileQuestion(false);
                          await locator<InitialProfileCubit>()
                              .updateOnboardingComplete();
                          context.goNamed(AppRoutes.home.name);
                          locator<DeeplinkCubit>().checkPendingDynamicLink();
                          await locator<InitialProfileCubit>().getUserByEmail();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20.h),
                          height: 80.h,
                          width: 330.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(180),
                            child: Container(
                              color: DanaTheme.paletteWhite,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Text(
                                    S
                                        .of(context)
                                        .widgetDialogRegisterSuccessButton,
                                    style: DanaTheme.textCta(
                                        DanaTheme.paletteDarkBlue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
