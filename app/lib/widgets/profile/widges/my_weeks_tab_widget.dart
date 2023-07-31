//IMPORT EXTERN APP

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/myprogress/cubit/myprogress_cubit.dart';
import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/models/program_model.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/styles/dana_theme.dart';
//IMPORT INTERN APP
import 'package:app/utils/modal.dart';
import 'package:app/widgets/dialogs/blocked_week_content_dialog.dart';
import 'package:app/widgets/profile/models/week_model.dart';
import 'package:app/widgets/program/program_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;
import 'package:go_router/go_router.dart';

class MyWeekTabWidget extends StatefulWidget {
  int userWeek;
  List<WeekModel> allSections;
  MyWeekTabWidget({required this.userWeek, required this.allSections});

  @override
  State<MyWeekTabWidget> createState() => _MyWeekTabWidgetState();
}

class _MyWeekTabWidgetState extends State<MyWeekTabWidget> {
  ScrollController? singleChildScrollViewScrollController;

  @override
  void dispose() {
    locator<MyprogressCubit>().setClosedAllTabs();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    singleChildScrollViewScrollController = ScrollController();
  }

  animate(int id, bool value) async {
    if (id == 3 && value) {
      await Future.delayed(Duration(milliseconds: 300));

      singleChildScrollViewScrollController!.animateTo(
        singleChildScrollViewScrollController!.position.maxScrollExtent - 350,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyprogressCubit, MyprogressState>(
      bloc: locator<MyprogressCubit>(),
      builder: (context, state) {
        if (state is MyprogressLoaded)
          return SingleChildScrollView(
            controller: singleChildScrollViewScrollController,
            child: Column(
              children: widget.allSections.map((section) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6.h),
                  child: Stack(
                    children: [
                      Container(
                        width: 1.sw,
                        height: 139,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12,
                            ),
                          ),
                          image: DecorationImage(
                            image: svgProvider.Svg(
                              section.backgroundPath,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (section.sectionTitle).toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: DanaTheme.textHeadlineSmallLight(
                                      DanaTheme.paletteDarkBlue,
                                    ).copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  section.isOpened
                                      ? SvgPicture.asset(
                                          '$ASSETS_IMAGES/weeks/dropup.svg',
                                        )
                                      : SvgPicture.asset(
                                          '$ASSETS_IMAGES/weeks/dropdown.svg',
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            key: Key(section.sectionId.toString()),
                            maintainState: true,
                            onExpansionChanged: (value) async {
                              animate(section.sectionId, value);

                              locator<MyprogressCubit>().onClickedPrgram(
                                  section.sectionId, widget.userWeek, value);
                            },
                            trailing: const SizedBox(),
                            tilePadding: EdgeInsets.zero,
                            title: Container(
                              width: 1.sw,
                              height: 139,
                              color: Colors.transparent,
                            ),
                            children: section.programs.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (widget.userWeek >= e.week) {
                                    context.pushNamed(
                                      AppRoutes.programDetailPage.name,
                                      queryParams: {
                                        'programId': e.programId,
                                      },
                                      extra: ProgramDetailArguments(
                                        program: Program(
                                          id: e.programId,
                                        ),
                                        onBackPressed: () async {
                                          await locator<ProgramCubit>()
                                              .chargeProgram();
                                        },
                                      ),
                                    );
                                  } else {
                                    _showModal(context, e.week.toString());
                                  }
                                },
                                child: Container(
                                  child: ProgramItemWidget(
                                    programPath: "",
                                    programId: e.programId,
                                    position: 0,
                                    tagFilter: "",
                                    contextPage: context,
                                    isWeekProgram: true,
                                    trailingPath: widget.userWeek >= e.week
                                        ? '$ASSETS_IMAGES/weeks/right.svg'
                                        : '$ASSETS_IMAGES/ic_lock.svg',
                                    week: e.week,
                                    userWekk: widget.userWeek,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        else
          return SizedBox();
      },
    );
  }

  _showModal(BuildContext context, String week) {
    ShowModal.showBottomSheet(
        context: context, widget: BlockedWeekContentDialog(week: week));
  }
}
