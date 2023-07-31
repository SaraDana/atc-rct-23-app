//IMPORT EXTERN APP
import 'dart:async';

import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/program/program_cubit.dart';
//IMPORT INTERN APP
import 'package:app/cubits/program/program_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/program_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/banner.dart';
import 'package:app/utils/programs.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/content/header_content_program_widget.dart';
import 'package:app/widgets/content/header_program_detail_content_widget.dart';
import 'package:app/widgets/content/render_units_programs_content_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/interested_event_enum.dart';

class ProgramDetailArguments {
  final Program? program;
  final VoidCallback? onBackPressed;
  final String? programId;

  const ProgramDetailArguments({
    this.program,
    this.onBackPressed,
    this.programId,
  });
}

class ProgramDetailPage extends StatefulWidget {
  final ProgramDetailArguments arguments;

  const ProgramDetailPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  _ProgramDetailPageState createState() => _ProgramDetailPageState();
}

class _ProgramDetailPageState extends State<ProgramDetailPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  StreamController<bool>? _bookmarkController;

  @override
  void initState() {
    super.initState();

    _bookmarkController = StreamController<bool>.broadcast();

    if (widget.arguments.program != null) {
      ProgramsUtils().initDialogProgramUserById(context,
          program: widget.arguments.program!);
    }

    BannerUtils.checkVisibility('program');
  }

  @override
  void dispose() {
    _bookmarkController?.close();

    super.dispose();
  }

  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProgramCubit>(
      create: (context) => ProgramCubit()
        ..getProgram(
            widget.arguments.program?.id! ?? widget.arguments.programId!),
      child: BlocConsumer<ProgramCubit, ProgramState>(
        listener: (context, state) async {
          if (state.status == StatusCubit.CHARGE_ERROR) {
            context.pop();
          }
          if (state.status == StatusCubit.INITIAL) {
            context.read<ProgramCubit>().getProgram(
                widget.arguments.program?.id ?? widget.arguments.programId!);
          }
          if (state.statusProgram == StatusProgram.FINISHED) {
            DanaAnalyticsService.trackProgramFinished(
                widget.arguments.program?.id ?? widget.arguments.programId!);
            if (widget.arguments.program != null && !opened) {
              await ProgramsUtils().showModalProgramByID(
                context,
                program: widget.arguments.program!,
              );
              opened = true;
            } else {
              opened = false;
            }
          }
        },
        builder: (context, state) {
          if (state.status == StatusCubit.SUCCESS) {
            return Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              body: Container(
                height: getScreenHeight(context),
                color: DanaTheme.paletteWhite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (state.program != null)
                        HeaderContentProgramWidget(
                          imageUrl: state.imageUrl,
                          program: state.program!,
                        ),
                      HeaderProgramDetailContentWidget(
                        program: state.program!,
                        userUnits: state.userUnits!.length,
                      ),
                      RenderUnitsProgramContentWidget(
                        onBackPressed: () {
                          context.read<ProgramCubit>().chargeProgram();
                          widget.arguments.onBackPressed!();
                        },
                        onFinishedProgramPressed: () async {
                          if (widget.arguments.onBackPressed != null)
                            widget.arguments.onBackPressed!();
                          if (state.program != null) {
                            await context
                                .read<ProgramCubit>()
                                .finishProgram(state.program!.id!);

                            locator<InterestedEventCubit>()
                                .eventOfInterestHappened(
                                    EventOfInterestedType.FINISHED_PROGRAM,
                                    {"programId": state.program!.id ?? ""});
                          }
                        },
                        programState: state,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          if (state.status == StatusCubit.LOADING) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                height: getScreenHeight(context),
                color: DanaTheme.paletteWhite,
                child: Center(
                  child: CircularProgressIndicator(
                    color: DanaTheme.paletteGreyTonesLightGrey20,
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
