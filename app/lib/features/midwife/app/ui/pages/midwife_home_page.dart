import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/core/utils/remote_config/remote_config.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/midwife/app/ui/widgets/midwife_modal.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/modal.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../styles/dana_theme.dart';

class MidwifeHomePage extends StatelessWidget {
  const MidwifeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DanaTheme.paletteFBrown,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              ),
              Container(
                width: getScreenWidth(context),
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    30.h.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      child: SvgPicture.asset('assets/images/logo.svg',
                          fit: BoxFit.fitHeight),
                    ),
                    20.h.verticalSpace,
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 1.sw,
                            height: 350.h,
                            child: buildSvgImage(
                              "consultation_page_girl.svg",
                              350.h,
                              BoxFit.contain,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                transform: Matrix4.translationValues(0, 1, 0),
                                child: SizedBox(
                                  height: 80,
                                  width: double.infinity,
                                  child: SvgPicture.asset(
                                    'assets/images/bg_unit_detail_footer.svg',
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Container(
                                height: .55.sh,
                                width: 1.sw,
                                color: DanaTheme.paletteDarkBlue,
                                padding: EdgeInsets.all(0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: .8.sw,
                                          child: Text(
                                              S.of(context).midwifePageTitle,
                                              textAlign: TextAlign.center,
                                              style: DanaTheme
                                                  .textMarketingHeadline(
                                                DanaTheme.paletteWhite,
                                              ).copyWith(
                                                  fontSize: 18.sp,
                                                  fontFamily: "Comfortaa"))),
                                      Spacer(),
                                      Container(
                                        width: .8.sw,
                                        child: _buildSectionTextArea(
                                            S
                                                .of(context)
                                                .midwifePageSection1Title,
                                            []),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: .8.sw,
                                        child: _buildSectionTextArea(
                                            S
                                                .of(context)
                                                .midwifePageSection2Title,
                                            []),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: .8.sw,
                                        child: _buildSectionTextArea(
                                            S
                                                .of(context)
                                                .midwifePageSection3Title,
                                            []),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: .8.sw,
                                        child: _buildSectionTextArea(
                                            S
                                                .of(context)
                                                .midwifePageSection4Title,
                                            []),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        height: 75.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            DanaAnalyticsService
                                                .selectedMidwifeDefinitiveOption(
                                                    "online");
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              builder: (context) {
                                                return FractionallySizedBox(
                                                    heightFactor: .9,
                                                    child: MidWidwifeModal(
                                                      option: "online",
                                                    ));
                                              },
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10.h),
                                            width: 330.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(180),
                                              child: Container(
                                                color: DanaTheme.paletteWhite,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Center(
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .midwifePageOnlineButtonText,
                                                      style: DanaTheme.textCta(
                                                          DanaTheme
                                                              .paletteDarkBlue),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 75.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            DanaAnalyticsService
                                                .selectedMidwifeDefinitiveOption(
                                                    "home");

                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              builder: (context) {
                                                return FractionallySizedBox(
                                                    heightFactor: 0.85,
                                                    child: MidWidwifeModal(
                                                      option: "home",
                                                    ));
                                              },
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10.h),
                                            width: 330.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(180),
                                              child: Container(
                                                color: DanaTheme.paletteWhite,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Center(
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .midwifePageDomiclioButtonText,
                                                      style: DanaTheme.textCta(
                                                          DanaTheme
                                                              .paletteDarkBlue),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      25.h.verticalSpace,
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildSectionTextArea(String title, List<String> sections) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Text(
          "• $title",
          textAlign: TextAlign.left,
          style: DanaTheme.textMarketingHeadline(
            DanaTheme.paletteWhite,
          ).copyWith(
              fontSize: 14.sp,
              fontFamily: "Comfortaa",
              fontWeight: FontWeight.w500),
        ),
      ),
      5.h.verticalSpace,
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sections.map((e) {
            return Container(
              margin: EdgeInsets.only(left: 20.w, bottom: 3.h),
              child: Text(
                "• $e",
                style: DanaTheme.textMarketingHeadline(
                  DanaTheme.paletteWhite,
                ).copyWith(
                    fontSize: 14.sp,
                    fontFamily: "Comfortaa",
                    fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      )
    ],
  );
}
