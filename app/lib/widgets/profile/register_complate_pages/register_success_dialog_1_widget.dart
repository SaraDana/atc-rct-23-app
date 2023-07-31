import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/generic_questionnare/cubit/onboarding_questionnare/generic_questionnare_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegisterSuccessDialog1Widget extends StatefulWidget {
  @override
  _RegisterSuccessDialogWidget1State createState() =>
      _RegisterSuccessDialogWidget1State();
}

class _RegisterSuccessDialogWidget1State
    extends State<RegisterSuccessDialog1Widget> {
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
                          bottom: 30.h,
                          child: Container(
                            width: 1.sw,
                            child: SvgPicture.asset(
                              'assets/images/register_success_page_1_top.svg',
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
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
                      S.of(context).onboardingComplatedPage1Title,
                      textAlign: TextAlign.center,
                      style: DanaTheme.textMarketingHeadline(
                              DanaTheme.paletteWhite)
                          .copyWith(fontSize: 24.sp),
                    ),
                    12.h.verticalSpace,
                    Text(
                      S.of(context).onboardingComplatedPage1Body,
                      textAlign: TextAlign.center,
                      style:
                          DanaTheme.textBody(DanaTheme.paletteWhite).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 80.h,
                      child: GestureDetector(
                        onTap: () async {
                          context.goNamed(
                              AppRoutes.onboardingQuestionnarePage.name);
                          locator<GenericQuestionnareCubit>()
                              .startGenericQuestionnare(
                                  questionType: QuestionnareType
                                      .ONBOARDING_QUESTIONNAIRE, reason: '');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 80,
                          width: 330,
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
                                        .screenInitialProfilePagesButtonNext,
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
                    24.h.verticalSpace,
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
