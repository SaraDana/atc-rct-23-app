//IMPORT EXETERN APP
import 'package:app/cubits/program/program_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/utils/modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

//IMPORT INTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/screens/content/unit_detail_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/widgets/dialogs/blocked_content_dialog.dart';

class UnitItemWidget extends StatelessWidget {
  final Unit unit;
  final ProgramState programState;
  final VoidCallback? onBackPressed;
  final VoidCallback? onFinishedProgramPressed;
  final int position;
  final bool programIsBuyed;
  // final VoidCallback? onPressed;
  final bool locked;

  const UnitItemWidget({
    Key? key,
    required this.unit,
    required this.locked,
    required this.position,
    required this.programState,
    required this.onBackPressed,
    required this.programIsBuyed,
    required this.onFinishedProgramPressed,
    //this.onPressed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final bool isPremiumUnit = locator<InitialProfileCubit>().isPremium(unit.isPremium, unit.isPremiumGroupB);
    final bool isContentBlocked = !programIsBuyed && isPremiumUnit;

    var contentTime =
        ((unit.audioDuration! / 60) + (unit.content!.split(' ').length / 150))
            .toStringAsFixed(0);

    return Opacity(
      opacity: isContentBlocked ? 0.3 : 1.0,
      child: TextButton(
        //add color
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
          backgroundColor: locked ? Colors.grey[100] : DanaTheme.paletteWhite,
        ),
        onPressed: () {
          locked && unit.order != -1
              ? _showModal(context, unit.id)
              : _navToUnitDetail(unit, programState.program!, context);
        },
        child: Container(
          width: double.infinity,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 80,
                      child: Stack(
                        children: [
                          SvgPicture.asset('assets/images/bg_unit_number.svg',
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.fitHeight,
                              color: DanaTheme.lightGrayColor),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                      position > 9
                                          ? position.toString()
                                          : '0${position.toString()}',
                                      style: DanaTheme.textCta(
                                          DanaTheme.paletteDarkBlue))))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(children: [
                        Container(
                            height: 50,
                            width: double.infinity,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  unit.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: DanaTheme.textCta(
                                      DanaTheme.paletteDarkBlue),
                                ))),
                        Container(height: 5),
                        SizedBox(
                          height: 25,
                          child: Row(
                            children: [
                              unit.audio!.isNotEmpty
                                  ? buildSvgImage('ic_content_audio.svg', 15)
                                  : Text(''),
                              unit.audio!.isNotEmpty && unit.content!.isNotEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: buildSvgImage(
                                          'ic_content_text_plus.svg', 35))
                                  : Text(''),
                              unit.audio!.isEmpty && unit.content!.isNotEmpty
                                  ? buildSvgImage('ic_content_text.svg', 20)
                                  : Text(''),
                              Container(width: DanaTheme.smallPadding),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: DanaTheme.paletteGreyTonesDarkGrey,
                                ),
                              ),
                              Container(width: DanaTheme.smallPadding),
                              buildSvgImage('ic_content_time.svg', 15),
                              Container(width: DanaTheme.smallPadding),
                              Text(
                                S.of(context).widgetUnitItemContentTime(
                                      contentTime,
                                    ),
                                style: TextStyle(
                                  color: DanaTheme.paletteGreyTonesDarkGrey,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(height: 5)
                      ])),
                  Expanded(
                      flex: 1,
                      child: isContentBlocked
                          ? SvgPicture.asset('assets/images/ic_lock.svg')
                          : Icon(Icons.chevron_right,
                              color: DanaTheme.paletteGreyTonesDarkGrey))
                ],
              ),
              Divider(
                color: DanaTheme.paletteLightGrey.withOpacity(0.5),
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navToUnitDetail(Unit unit, Program program, BuildContext context) {
    locator<UserPremiumCubit>().navigateTo(
        () => context.pushNamed(
              AppRoutes.unitDetail.name,
              extra: UnitDetailPageObject(
                onBackPressed: onBackPressed,
                program: program,
                unitRef: unit.reference,
                unitWithImage: null,
                onFinishedProgramPressed: onFinishedProgramPressed,
              ),
            ),
        unit,
        program);
  }

  _showModal(BuildContext context, String? unitId) {
    DanaAnalyticsService.trackTryOpenUnitBlocked(unitId, false, true);
    ShowModal.showBottomSheet(context: context, widget: BlockedContentDialog());
  }
}
