//IMPORT EXTERN APP
import 'dart:async';

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
//IMPORT INTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/cubits/program/program_state.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/program_model.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/spacers.utils.dart';
import 'package:app/widgets/program/program_progress_bar_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ProgramItemWidget extends StatefulWidget {
  final String programPath;
  final String? programId;
  final int position;
  final VoidCallback? onPressed;
  final double customWith;
  final double customImageHeight;
  final double customContentHeight;
  final bool isWeekProgram;
  final bool checkFirstPosition;
  final bool showFavourites;
  final bool showHorizontal;
  final bool hideCompleted;
  final bool hideInProgress;
  final String? tagFilter;
  final bool? showCheck;
  final Function()? programSelectedCallback;
  final BuildContext contextPage;
  final bool isHomePage;
  final String? trailingPath;
  final int? week;
  final int? userWekk;

  const ProgramItemWidget(
      {Key? key,
      required this.programPath,
      required this.programId,
      required this.position,
      required this.tagFilter,
      required this.contextPage,
      required this.isWeekProgram,
      this.onPressed,
      this.customWith = 264,
      this.checkFirstPosition = true,
      this.customImageHeight = 160,
      this.customContentHeight = 120,
      this.showFavourites = false,
      this.showHorizontal = true,
      this.hideCompleted = false,
      this.hideInProgress = false,
      this.showCheck = true,
      this.isHomePage = false,
      this.programSelectedCallback,
      this.trailingPath,
      this.week,
      this.userWekk,
      rq})
      : super(key: key);

  @override
  _ProgramItemWidgetState createState() => _ProgramItemWidgetState();
}

class _ProgramItemWidgetState extends State<ProgramItemWidget> {
  FirebaseStorage storage = FirebaseStorage.instance;

  StreamController<bool>? _showController;

  @override
  void initState() {
    super.initState();

    _showController = StreamController<bool>.broadcast();
  }

  @override
  void dispose() {
    _showController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProgramCubit>(
            create: (context) => ProgramCubit()..getProgram(widget.programId!),
          ),
        ],
        child: BlocConsumer<ProgramCubit, ProgramState>(
          listener: (context, state) {
            if (state.status == StatusCubit.INITIAL) {
              context.read<ProgramCubit>().getProgram(widget.programId!);
            }
          },
          builder: (context, state) {
            return BlocBuilder<ProgramCubit, ProgramState>(
                builder: (context, programState) {
              if (programState.status == StatusCubit.LOADING &&
                  !widget.isWeekProgram) {
                return Container(
                  width: 246,
                  height: 272.h,
                  margin: EdgeInsets.only(
                    left: 5,
                    right: 5,
                    bottom: 10,
                  ),
                  decoration: _getBoxDecoration(),
                  child: Center(
                    child: CircularProgressIndicator(
                        color: DanaTheme.paletteGreyTonesLightGrey20),
                  ),
                );
              }
              if (programState.status == StatusCubit.LOADING &&
                  widget.isWeekProgram) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(.2),
                  highlightColor: Colors.grey.withOpacity(.1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 3.h),
                    width: 1.sw,
                    height: 40.h,
                  ),
                );
              }
              if (programState.status == StatusCubit.SUCCESS) {
                if (widget.tagFilter != null &&
                    widget.tagFilter!.length > 0 &&
                    !programState.program!.tagsRefs!
                        .map((e) => e.id)
                        .toList()
                        .contains(widget.tagFilter)) {
                  return SizedBox.shrink();
                }
                if (widget.isWeekProgram) {
                  bool isBlockedProgram =
                      widget.trailingPath! == "$ASSETS_IMAGES/ic_lock.svg";
                  bool isNewProgram = widget.userWekk == widget.week &&
                      (programState.userUnits!.length *
                              1 /
                              programState.program!.unitsRefs!.length) <
                          0.1;
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 5.w),
                    leading: Container(
                      width: .25.sw,
                      child: Text(
                        programState.program!.title.toString(),
                        textAlign: TextAlign.start,
                        style: DanaTheme.textCta(
                          isBlockedProgram
                              ? DanaTheme.paletteGreyTonesLightGrey20
                              : DanaTheme.paletteDarkBlue,
                        ).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: .65.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (isNewProgram)
                            Container(
                              height: 30.h,
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      170.w,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: DanaTheme.paletteLightGrey,
                                    width: 1,
                                  )),
                              child: Center(
                                child: Text(
                                  S.current.currentWeekButtonText,
                                  style: DanaTheme.textCta(
                                    DanaTheme.paletteOrange,
                                  ).copyWith(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            ),
                          if (isBlockedProgram && !isNewProgram)
                            Container(
                              height: 30.h,
                              width: .5.sw,
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      170.w,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: DanaTheme.paletteLightGrey,
                                    width: 1,
                                  )),
                              child: Center(
                                child: Text(
                                  S.current.disableWeekButtonText(
                                    widget.week.toString(),
                                  ),
                                  style: DanaTheme.textCta(
                                    DanaTheme.paletteGreyTonesLightGrey20,
                                  ).copyWith(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            ),
                          if (!isBlockedProgram && !isNewProgram)
                            Container(
                              height: 30.h,
                              width: .5.sw,
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      170.w,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: DanaTheme.paletteLightGrey,
                                    width: 1,
                                  )),
                              child: Container(
                                child: ProgramProgressBarWidget(
                                  program: programState.program!,
                                  showCheck: false,
                                  showController: _showController!,
                                  showHorizontal: false,
                                  userUnits: programState.userUnits!.length,
                                  isWeekProgram: true,
                                ),
                              ),
                            ),
                          3.w.horizontalSpace,
                          Container(
                            width: 25.w,
                            child: SvgPicture.asset(
                              widget.trailingPath!,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () {
                    if (widget.programSelectedCallback != null) {
                      widget.programSelectedCallback!();
                    }
                    _navToProgramDetail(
                      onBackPressed: () async {
                        await context.read<ProgramCubit>().chargeProgram();
                      },
                      program: programState.program!,
                    );
                  },
                  child: _createCardContent2(programState, widget.isHomePage),
                );
              }
              return Container();
            });
          },
        ));
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: DanaTheme.bgCardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: DanaTheme.paletteGreyShadow.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }

  Widget _createCardContent2(ProgramState programState, bool isHomePage) {
    return Container(
      width: widget.customWith,
      margin: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 8.h),
      decoration: _getBoxDecoration(),
      child: Column(
        children: [
          _showPicture(
              program: programState.program!, imageUrl: programState.imageUrl),
          Container(
            height: widget.customContentHeight.h,
            padding: EdgeInsets.only(
              left: DanaTheme.smallPadding,
              right: DanaTheme.smallPadding,
              top: 8.h,
              bottom: 8.h,
            ),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                programState.program!.title!,
                                style: DanaTheme.textCta(
                                    DanaTheme.paletteDarkBlue),
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (programState.program != null)
                              _PremiumTag(
                                program: programState.program!,
                                isHomePage: isHomePage,
                              ),
                          ],
                        ))),
                SizedBox(
                  height: getSpaceTitleSubtitleCard(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      programState.program!.subtitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: DanaTheme.textSuperSmallText(
                          DanaTheme.paletteGreyTonesLightGrey60),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Spacer(),
                ProgramProgressBarWidget(
                  program: programState.program!,
                  showCheck: widget.showCheck,
                  showController: _showController!,
                  showHorizontal: widget.showHorizontal,
                  userUnits: programState.userUnits!.length,
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.showFavourites,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 18,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showPicture({required Program program, required String? imageUrl}) {
    return imageUrl == null
        ? SizedBox(
            height: widget.customImageHeight.h,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: DanaTheme.paletteDanaPink,
                color: DanaTheme.paletteFPink,
              ),
            ),
          )
        : SizedBox(
            height: widget.customImageHeight.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Hero(
                tag: program.id!,
                child: FadeInImage.memoryNetwork(
                  fadeInCurve: Curves.easeInCirc,
                  fadeInDuration: Duration(milliseconds: 50),
                  image: imageUrl,
                  fit: BoxFit.fitWidth,
                  placeholder: kTransparentImage,
                ),
              ),
            ),
          );
  }

  void _navToProgramDetail({
    required Program program,
    required VoidCallback? onBackPressed,
  }) {
    //DanaAnalyticsService.trackProgramOpened(program.id);

    context.pushNamed(AppRoutes.programDetailPage.name,
        queryParams: {
          'programId': program.id,
        },
        extra: ProgramDetailArguments(
          program: program,
          onBackPressed: onBackPressed,
        ));

    if (widget.onPressed != null) widget.onPressed!();
  }
}

class _PremiumTag extends StatelessWidget {
  final bool isHomePage;
  final Program program;
  const _PremiumTag({
    required this.isHomePage,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    if (locator<InitialProfileCubit>()
            .isPremium(program.isPremium, program.isPremiumGroupB) &&
        !locator<UserPremiumCubit>().programUnlocked(program))
      return Container(
        padding: isHomePage
            ? EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h)
            : EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: DanaTheme.paletteLightBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(30.sp),
          ),
        ),
        child: Text(
          S.current.userPremmium,
          style: DanaTheme.textShowPrograms,
        ),
      );

    return SizedBox();
  }
}
