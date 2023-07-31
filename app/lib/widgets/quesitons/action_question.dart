import 'package:app/core/di/locator.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/generic_questionnare/cubit/onboarding_questionnare/generic_questionnare_cubit.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActionQuestionWidget extends GenericQuestionWidget {
  ActionQuestionWidget({super.key, super.question, super.statement});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DanaTheme.paletteDarkBlue,
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: DanaTheme.paletteFPink,
              padding: EdgeInsets.only(top: 80.h),
              width: 1.sw,
              height: 250.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: buildSvgImage(
                        "questionnare_final_girl_clock.svg", 180.w),
                  ),
                  Positioned(
                    bottom: -5,
                    child: CustomPaint(
                      size: Size(
                          1.sw,
                          (1.sw * .28)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: WavePainter(),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: DanaTheme.bodyPadding),
                  child: Html(
                    data: question?.description,
                    style: {
                      'body': Style(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize(16.sp),
                        color: DanaTheme.whiteColor,
                        textAlign: TextAlign.center,
                        maxLines: 40,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    },
                  ),
                ),
                50.h.verticalSpace,
                if (question?.actions != null)
                  Container(
                    margin: EdgeInsets.only(bottom: 24.h),
                    child: Column(
                      children: question!.actions!.map((e) {
                        print(e!.toJson().toString());
                        if (e.relevance == "HIGH")
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: DanaTheme.bodyPadding,
                                vertical: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(162),
                                color: DanaTheme.whiteColor),
                            width: double.infinity,
                            height: 60.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      DanaTheme.whiteColor, // foreground
                                ),
                                child: Text(e.title ?? "",
                                    style: DanaTheme.textCta(
                                        DanaTheme.paletteDarkBlue)),
                                onPressed: () async {
                                  print(await locator<QuestionnareCubit>()
                                      .state
                                      .questionnaire
                                      ?.redirectUrl);
                                  if (e != null) {
                                    await locator<GenericQuestionnareCubit>()
                                        .answerQuestion(
                                      question!,
                                      e.id.toString(),
                                      isNewQuestionnare:
                                          e.type == "NEW_QUESTIONNAIRE",
                                      actionModel: e,
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        if (e.relevance == "MEDIUM")
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: DanaTheme.bodyPadding,
                                vertical: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(162),
                                color: DanaTheme.whiteColor),
                            width: double.infinity,
                            height: 60.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      DanaTheme.whiteColor, // foreground
                                ),
                                child: Text(e.title ?? "",
                                    style: DanaTheme.textCta(
                                        DanaTheme.paletteDarkBlue)),
                                onPressed: () async {
                                  print(e.toJson().toString());
                                  print(await locator<QuestionnareCubit>()
                                      .state
                                      .questionnaire
                                      ?.redirectUrl);
                                  if (e != null) {
                                    await locator<GenericQuestionnareCubit>()
                                        .answerQuestion(
                                      question!,
                                      e.id.toString(),
                                      isNewQuestionnare:
                                          e.type == "NEW_QUESTIONNAIRE",
                                      actionModel: e,
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        if (e.relevance == "LOW")
                          return GestureDetector(
                            onTap: () async {
                              if (e != null && question != null) {
                                await locator<GenericQuestionnareCubit>()
                                    .answerQuestion(question!, e.id.toString(),
                                        isNewQuestionnare:
                                            e.type == "NEW_QUESTIONNAIRE",
                                        actionModel: e);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(
                                e.title ?? "",
                                textAlign: TextAlign.center,
                                style: DanaTheme.textBody(DanaTheme.whiteColor)
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        return Container();
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = DanaTheme.paletteDarkBlue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.4718000);
    path0.lineTo(0, size.height * 0.9975000);
    path0.lineTo(size.width, size.height * 0.9939000);
    path0.quadraticBezierTo(size.width * 1.0022286, size.height * 0.8896000,
        size.width, size.height * 0.5036000);
    path0.cubicTo(
        size.width * 0.9464857,
        size.height * 0.5572000,
        size.width * 0.5044286,
        size.height * 0.2769000,
        size.width * 0.3770000,
        size.height * 0.2150000);
    path0.quadraticBezierTo(size.width * 0.1456286, size.height * 0.2212000, 0,
        size.height * 0.4718000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
