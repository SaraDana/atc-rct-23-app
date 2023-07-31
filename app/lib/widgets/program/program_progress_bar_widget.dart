import 'dart:async';

import 'package:app/generated/l10n.dart';
import 'package:app/models/program_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgramProgressBarWidget extends StatelessWidget {
  final Program program;
  final StreamController<bool>? showController;
  final int? userUnits;
  final bool showHorizontal;
  final bool? showCheck;
  final bool isWeekProgram;
  const ProgramProgressBarWidget({
    Key? key,
    required this.program,
    required this.showController,
    required this.userUnits,
    required this.showHorizontal,
    required this.showCheck,
    this.isWeekProgram = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = calculateProgramProgress(
      program,
      userUnits!,
    );

    showController!.sink.add(program.unitsRefs!.length == userUnits);

    final progressText = showHorizontal
        ? '${S.of(context).widgetProgramItemProgress}${(progress * 100).round()}%'
        : '${(progress * 100).round()}%';

    return isWeekProgram
        ? WeekProgramProgressArea(
            progress: progress, stream: showController!.stream)
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 18,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: StreamBuilder<bool>(
                              stream: showController!.stream,
                              builder: (_, snapshot) {
                                final value = snapshot.data ?? false;

                                if (showCheck == true) {
                                  if (value) {
                                    return Text(
                                      showHorizontal
                                          ? S
                                              .of(context)
                                              .widgetProgramItemProgressCompleted
                                          : '¡Completado!',
                                      style: DanaTheme.textProgramProgress(
                                        DanaTheme.paletteGreen,
                                      ),
                                      textAlign: TextAlign.left,
                                    );
                                  }
                                }

                                return Text(
                                  progressText,
                                  style: DanaTheme.textProgramProgress(
                                    DanaTheme.paletteGreen,
                                  ),
                                  textAlign: TextAlign.left,
                                );
                              }),
                        ),
                      ),
                      Container(height: 8),
                      Container(
                        height: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          child: LinearProgressIndicator(
                            backgroundColor:
                                DanaTheme.paletteGreyTonesLightGrey20,
                            valueColor: AlwaysStoppedAnimation(
                              DanaTheme.paletteGreen,
                            ),
                            value: progress,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showCheck == true)
                  Container(
                    margin: const EdgeInsets.only(left: 16.0, top: 8),
                    width: 24,
                    child: SvgPicture.asset(
                      program.unitsRefs!.length == userUnits
                          ? 'assets/images/check.svg'
                          : 'assets/images/uncheck.svg',
                      width: 24,
                    ),
                  ),
              ],
            ),
          );
  }
}

class WeekProgramProgressArea extends StatelessWidget {
  Stream<bool>? stream;
  double? progress;
  WeekProgramProgressArea(
      {required this.progress, required this.stream, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: .25.sw,
            height: 18,
            child: Align(
              alignment: Alignment.centerLeft,
              child: StreamBuilder<bool>(
                stream: stream,
                builder: (_, snapshot) {
                  final value = snapshot.data ?? false;

                  return Container(
                    child: Row(
                      children: [
                        if (progress == 100)
                          Text(
                            "¡Completado! ",
                            style: DanaTheme.textProgramProgressFlex(
                              DanaTheme.paletteGreen,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        if (progress! < 100)
                          Text(
                            "Progreso ",
                            style: DanaTheme.textProgramProgressFlex(
                              DanaTheme.paletteGreyTonesLightGrey60,
                            ).copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        if (progress != 100)
                          Text(
                            " ${(progress! * 100).round()}%",
                            style: DanaTheme.textProgramProgressFlex(
                              DanaTheme.paletteGreyTonesLightGrey60,
                            ).copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          3.w.horizontalSpace,
          Container(
            width: .15.sw,
            height: 3.h,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(80)),
              child: LinearProgressIndicator(
                backgroundColor: DanaTheme.paletteGreyTonesLightGrey20,
                valueColor: AlwaysStoppedAnimation(
                  DanaTheme.paletteGreen,
                ),
                value: progress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
