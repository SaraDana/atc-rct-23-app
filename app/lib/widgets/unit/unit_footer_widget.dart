//IMPORT EXTERN APP
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/deeplinks/app/cubits/footer_deeplink_unit/footer_deeplink_unit_cubit.dart';
import 'package:app/features/deeplinks/app/cubits/footer_deeplink_unit/footer_deeplink_unit_state.dart';
import 'package:app/features/units/app/cubit/user_units/user_units_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

//IMPORT INTERN APP
import 'package:app/widgets/buttons/like_dislike_footer_widget.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/widgets/buttons/icon_community_footer_widget.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/programs.utils.dart';
import 'package:just_audio/just_audio.dart';

class UnitFooterWidget extends StatefulWidget {
  final Unit unit;
  final Program? program;
  final VoidCallback? onPressed;
  final VoidCallback? onPreviousUnit;
  final VoidCallback? onFinishedProgramPressed;
  final VoidCallback? startNavigation;
  final bool isFinish;
  final AudioPlayer player;

  const UnitFooterWidget({
    Key? key,
    required this.unit,
    required this.program,
    required this.onPressed,
    required this.onPreviousUnit,
    required this.startNavigation,
    required this.onFinishedProgramPressed,
    required this.isFinish,
    required this.player,
  }) : super(key: key);

  @override
  State<UnitFooterWidget> createState() => _UnitFooterWidgetState();
}

class _UnitFooterWidgetState extends State<UnitFooterWidget> {
final cubit = locator<UserUnitsCubit>();
@override
  void initState() {
    super.initState();
    if (widget.unit.id != null) {
      cubit.getUserUnits(widget.unit.id!);
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<FooterDeeplinkUnitCubit>(
      create: (context) => FooterDeeplinkUnitCubit(
        program: widget.program!,
        unit: widget.unit,
      ),
      child: BlocBuilder<FooterDeeplinkUnitCubit, FooterDeeplinkUnitState>(
        builder: (context, state) {
          return Container(
            color: DanaTheme.paletteDarkBlue,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  transform: Matrix4.translationValues(0, -1, 0),
                  color: widget.unit.content!.isEmpty
                      ? DanaTheme.paletteLightGrey
                      : DanaTheme.paletteWhite,
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
                LikeDislikeFooterWidget(
                    unit: widget.unit,
                    useful: state.useful,
                    setValueFalse: () async {
                      DanaAnalyticsService.trackUnitRating(widget.unit.id, false,
                          widget.unit.audio != null && widget.unit.audio!.isNotEmpty);
                      await context
                          .read<FooterDeeplinkUnitCubit>()
                          .changeUseful(useful: false);
                    },
                    setValueTrue: () async {
                      DanaAnalyticsService.trackUnitRating(widget.unit.id, true,
                          widget.unit.audio != null && widget.unit.audio!.isNotEmpty);
                      await context
                          .read<FooterDeeplinkUnitCubit>()
                          .changeUseful(useful: true);
                    },
                    onPressedLikeButton: () async {
                      DanaAnalyticsService.trackGoToCommunityFromUnit(
                          widget.unit.id, widget.unit.relatedContentUrl);
                      final String newUrl = await context
                          .read<FooterDeeplinkUnitCubit>()
                          .getDeeplinkUrl();
                      await locator<DeeplinkCubit>()
                          .openLink(deeplink: Uri.parse(newUrl));
                      if (widget.unit.audio != null && widget.unit.audio!.isNotEmpty)
                        widget.startNavigation!();
                    }),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: DanaTheme.bodyPadding,
                      vertical: DanaTheme.bodyPadding),
                  color: DanaTheme.paletteDarkBlue,
                  width: double.infinity,
                  child: Row(
                    children: [
                      if (widget.unit.order != 0)
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: InkWell(
                            onTap: () {
                              if (widget.unit.audio != null && widget.unit.audio!.isNotEmpty)
                                widget.startNavigation!();
                              widget.onPreviousUnit!();
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: RotatedBox(
                                  quarterTurns: 2,
                                  child: buildSvgImage('ic_next.svg', 8)),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: IconCommunityFooterWidget(
                          unit: widget.unit,
                          onPressed: () async {
                            DanaAnalyticsService.trackGoToCommunityFromUnit(
                                widget.unit.id, widget.unit.relatedContentUrl);
                            final String newUrl = await context
                                .read<FooterDeeplinkUnitCubit>()
                                .getDeeplinkUrl();
                            await locator<DeeplinkCubit>()
                                .openLink(deeplink: Uri.parse(newUrl));
                            if (widget.unit.audio != null && widget.unit.audio!.isNotEmpty)
                              widget.startNavigation!();
                          },
                        ),
                      ),
                      (widget.unit.order == -1)
                          ? Container(height: 0)
                          : (widget.program != null)
                              ?Expanded(
                                      child: GestureDetector(
                                        onTap: cubit.state.isCompleted || widget.isFinish
                                            ? () => _onNextClick(context)
                                            : null,
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: widget.isFinish || cubit.state.isCompleted
                                                ? DanaTheme.paletteWhite
                                                : DanaTheme.paletteLightGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(180),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  widget.unit.order ==
                                                          (widget.program!.unitsRefs !=
                                                                  null
                                                              ? widget.program!
                                                                      .unitsRefs!
                                                                      .length -
                                                                  1
                                                              : true)
                                                      ? S
                                                          .of(context)
                                                          .widgetUnitFooterContinue
                                                      : S
                                                          .of(context)
                                                          .widgetUnitFooterNextUnit,
                                                  style: DanaTheme.textCta(
                                                      DanaTheme
                                                          .paletteDarkBlue),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: buildSvgImage(
                                                    'ic_next.svg', 8),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                )
                              : Container(
                                  color: DanaTheme.paletteDarkBlue,
                                  height: 30,
                                ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onNextClick(
    BuildContext context,
  ) async {
    //DanaAnalyticsService.trackUnitFinished(
    //    unit.id, unit.audio != null && unit.audio!.isNotEmpty);
    if (widget.unit.audio != null && widget.unit.audio!.isNotEmpty) widget.startNavigation!();
    await ProgramsUtils().evalueUnitByFirebase(
      context,
      onFinishedProgramPressed: widget.onFinishedProgramPressed,
      onBackPressed: widget.onPressed,
      programId: widget.program!.id!,
      unit: widget.unit,
      program: widget.program!,
      activeAutoPlay: widget.player.playing,
      onNextPressed: widget.onPressed,
      forceNavigate: true
    );
  }
}
