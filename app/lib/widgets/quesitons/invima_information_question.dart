import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/features/generic_questionnare/cubit/onboarding_questionnare/generic_questionnare_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/category_investment_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:app/widgets/shared/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvimaInformationQuestionWidget extends GenericQuestionWidget {
  InvimaInformationQuestionWidget({super.key, super.question, super.statement});

  CategoryInvestment? findBubbleInvestment(int index) {
    if (question != null) {
      if (question!.categoryInvestment != null) {
        var a = question!.categoryInvestment!.sort((a, b) {
          if (a != null && b != null) {
            return b.percentage!.compareTo(a.percentage!);
          }

          return -1;
        });
        return question!.categoryInvestment![index];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.bgPollColor,
      body: Container(
        height: 1.sh,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: DanaTheme.bodyPadding),
                      color: DanaTheme.paletteFPink,
                      width: 1.sw,
                      child: Column(
                        children: [
                          20.h.verticalSpace,
                          Text(
                            question?.title ?? "",
                            style:
                                DanaTheme.titleAppbar.copyWith(fontSize: 14.sp),
                          ),
                          20.h.verticalSpace,
                          Html(
                            data: question?.description,
                            style: {
                              'body': Style(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                                fontSize: FontSize(14.sp),
                                color: DanaTheme.paletteDarkBlue,
                                textAlign: TextAlign.center,
                                maxLines: 12,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/bg_grey_header.png',
                        alignment: Alignment.bottomRight,
                        color: DanaTheme.paletteFPink,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 350.h,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                    Center(
                  child: Container(
                    width: 1.sw,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Stack(
                      children: [
                        Positioned(
                          left: constraints.maxWidth * .1,
                          top: 0,
                          child: Container(
                            width: constraints.maxWidth * .43,
                            height: constraints.maxHeight * .43,
                            child: _buildBublePercentage(
                              buildSvgImage(
                                "percentage_vector_blue.svg",
                              ),
                              findBubbleInvestment(2),
                            ),
                          ),
                        ),
                        Positioned(
                          top: constraints.maxHeight * .4,
                          left: 0,
                          child: Container(
                            width: constraints.maxWidth * .55,
                            height: constraints.maxHeight * .55,
                            child: _buildBublePercentage(
                              buildSvgImage(
                                "percentage_vector_grey.svg",
                              ),
                              findBubbleInvestment(0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: constraints.maxHeight * .5,
                          left: constraints.maxWidth * .53,
                          child: Container(
                            width: constraints.maxWidth * .4,
                            height: constraints.maxHeight * .4,
                            child: _buildBublePercentage(
                              buildSvgImage(
                                "percentage_vector_green.svg",
                              ),
                              findBubbleInvestment(3),
                            ),
                          ),
                        ),
                        Positioned(
                          top: constraints.maxHeight * .1,
                          left: constraints.maxWidth * .48,
                          child: Container(
                            width: constraints.maxWidth * .45,
                            height: constraints.maxHeight * .45,
                            child: _buildBublePercentage(
                              buildSvgImage(
                                "percentage_vector_pink.svg",
                              ),
                              findBubbleInvestment(1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            30.h.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(horizontal: DanaTheme.bodyPadding),
              width: double.infinity,
              child: CtaButton(
                onPressed: () async {
                  await locator<GenericQuestionnareCubit>()
                      .answerQuestion(question!, true);
                },
                text: S.of(context).screenInitialProfilePagesButtonNext,
                color: DanaTheme.paletteOrange,
              ),
            ),
            36.h.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildBublePercentage(
      Widget buble, CategoryInvestment? categoryInvestment) {
    return categoryInvestment == null
        ? SizedBox()
        : Stack(
            alignment: Alignment.center,
            children: [
              buble,
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${categoryInvestment.percentage!.toInt()}%",
                      style: DanaTheme.textMarketingHeadline(
                              DanaTheme.paletteDarkBlue)
                          .copyWith(fontSize: 26.sp),
                    ),
                    Container(
                      width: .4.sw,
                      child: Text(
                        categoryInvestment.category!.categoryName.toString(),
                        style: DanaTheme.textMarketingHeadline(
                                DanaTheme.paletteDarkBlue)
                            .copyWith(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
