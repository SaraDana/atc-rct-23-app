import 'package:app/core/di/locator.dart';
import 'package:app/core/utils/remote_config/remote_config.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultationProfessionalChatPage extends StatelessWidget {
  const ConsultationProfessionalChatPage({super.key});

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
                                height: .57.sh,
                                width: 1.sw,
                                color: DanaTheme.paletteDarkBlue,
                                padding: EdgeInsets.all(0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                              S
                                                  .of(context)
                                                  .consulationPageTitle,
                                              textAlign: TextAlign.center,
                                              style: DanaTheme
                                                  .textMarketingHeadline(
                                                DanaTheme.paletteWhite,
                                              ).copyWith(
                                                  fontSize: 20.sp,
                                                  fontFamily: "Comfortaa"))),
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                                        child: Text(
                                          S.of(context).consulationChatPageText,
                                          textAlign: TextAlign.center,
                                          style:
                                              DanaTheme.textMarketingHeadline(
                                            DanaTheme.paletteWhite,
                                          ).copyWith(
                                                  fontSize: 16.sp,
                                                  fontFamily: "Comfortaa",
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5
                                                  ),
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        height: 75.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            DanaAnalyticsService
                                                .selectedSaviaDefinitiveOption(
                                                    "chat_24h",
                                                    locator<DanaRemoteConfig>()
                                                        .saviaChat24hUrl);
                                            launchUrl(Uri.parse(
                                                locator<DanaRemoteConfig>()
                                                    .saviaChat24hUrl));
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
                                                      horizontal: 20.w),
                                                  child: Center(
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .consulationPageButton2Text,
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
                                      Spacer(),
                                      Container(
                                        width: .8.sw,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            S
                                                .of(context)
                                                .consulationPageBottomText,
                                            textAlign: TextAlign.center,
                                            style: DanaTheme
                                                .textSuperSmallTextBoldLabel(
                                              DanaTheme.paletteWhite,
                                            ).copyWith(
                                                fontFamily: "Comfortaa",
                                                fontSize: 10.sp,
                                                height: 1.5
                                                ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
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
