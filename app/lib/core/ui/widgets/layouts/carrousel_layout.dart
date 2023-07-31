import 'package:app/config/constants.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/utils/function_guard.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/shared/progress_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _Constants {
  static const baseTimeAnimation = 500;
}

class WidgetWithCallback {
  final Widget widget;
  final String? title;
  final String? description;

  final VoidCallback? onTap;
  final bool validation;
  final bool isOptional;
  final bool? cantGoBack;
  final bool isStepQuestion;

  WidgetWithCallback({
    required this.widget,
    this.title,
    this.description,
    this.onTap,
    this.isOptional = false,
    required this.validation,
    this.cantGoBack,
    this.isStepQuestion = true,
  });
}

class CarouselLayout extends StatefulWidget {
  final List<WidgetWithCallback> content;
  final bool? showNextStep;
  final String nextStepButtonText;
  final String previousStepButtonText;
  final String? lastStepButtonText;
  final bool useAppbar;
  final int actualStep;
  final VoidCallback? onTapBack;
  final Color bgColor;
  final bool isOnboardingQuestionnare;
  final int? totalValue;

  const CarouselLayout({
    Key? key,
    required this.content,
    this.showNextStep,
    required this.nextStepButtonText,
    required this.previousStepButtonText,
    this.lastStepButtonText,
    this.useAppbar = false,
    required this.actualStep,
    this.bgColor = DanaTheme.paletteFPink,
    this.onTapBack,
    required this.isOnboardingQuestionnare,
    this.totalValue,
  }) : super(key: key);

  @override
  State<CarouselLayout> createState() => _CarouselLayoutState();
}

class _CarouselLayoutState extends State<CarouselLayout> {
  final CarouselController contentController = CarouselController();
  bool isLoading = false;

  _isLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.content;
    final isStepQuestion = content[widget.actualStep].isStepQuestion;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: isStepQuestion
          ? Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        30.h.verticalSpace,
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ProgressAppBar(
                                appBarType: AppBarType.ONLY_CLOSE,
                                bgColor: widget.bgColor,
                                currentValue: widget.totalValue != null
                                    ? widget.actualStep -
                                        (content.length - widget.totalValue!)
                                    : widget.actualStep,
                                totalValue: widget.totalValue == null
                                    ? content.length
                                    : widget.totalValue,
                                skip: false,
                                horizontalPadding: 15),
                          ),
                        ),
                        gapH20,
                        content[widget.actualStep].title != null
                            ? Container(
                                margin: EdgeInsets.only(top: 0),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Html(
                                  data: content[widget.actualStep].title,
                                  style: {
                                    'body': Style(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      fontSize: FontSize(20.sp),
                                      color: DanaTheme.paletteDarkBlue,
                                      textAlign: TextAlign.start,
                                      maxLines: 8,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  },
                                ),
                              )
                            : SizedBox.shrink(),
                        content[widget.actualStep].description != null
                            ? Container(
                                margin: EdgeInsets.only(top: 0),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Html(
                                  data: content[widget.actualStep].description,
                                  style: {
                                    'body': Style(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                      fontSize: FontSize(18.sp),
                                      color: DanaTheme.paletteDarkBlue,
                                      textAlign: TextAlign.start,
                                      maxLines: 8,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  },
                                ),
                              )
                            : SizedBox.shrink(),
                        content[widget.actualStep].title != null
                            ? gapH20
                            : SizedBox.shrink(),
                        Container(
                            margin: EdgeInsets.only(top: 0),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: content[widget.actualStep].widget)),
                      ],
                    ),
                  ),
                ),
                _FooterBackground(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.actualStep > 0) ...[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                widget.onTapBack!();
                              },
                              child: Container(
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    color: DanaTheme.paletteWhite,
                                    child: buildSvgImage(
                                      'ic_previous.svg',
                                      16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      !isLoading
                          ? Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: content[widget.actualStep].isOptional
                                    ? () {}
                                    : content[widget.actualStep].validation
                                        ? () async {
                                            bool success = false;
                                            _isLoading(true);
                                            if (content[widget.actualStep]
                                                    .onTap !=
                                                null) {
                                              success = await guard(
                                                  content[widget.actualStep]
                                                      .onTap!);
                                              _isLoading(false);
                                            }
                                          }
                                        : null,
                                child: Container(
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(180),
                                    child: Container(
                                      color: DanaTheme.paletteWhite,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                  widget.nextStepButtonText,
                                                  style: DanaTheme.textCta(
                                                      DanaTheme
                                                          .paletteDarkBlue))),
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child:
                                                buildSvgImage('ic_next.svg', 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                )),
              ],
            )
          : content[widget.actualStep].widget,
    );
  }
}

class _FooterBackground extends StatelessWidget {
  final Widget child;
  const _FooterBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      height: size.height * 0.21,
      width: getScreenWidth(context),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: size.height * 0.23,
        width: double.infinity,
        color: Colors.transparent,
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: SizedBox(
                height: size.height * 0.22,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/bg_unit_detail_footer.svg',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              height: size.height * 0.12,
              width: getScreenWidth(context),
              child: Container(
                height: size.height * 0.12,
                width: double.infinity,
                color: DanaTheme.paletteDarkBlue,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
