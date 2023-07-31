//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/myprogress/cubit/myprogress_cubit.dart';
import 'package:app/cubits/program/program_cubit.dart';
//IMPORT INTERN APP
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';
import 'package:app/data/repositories/user_programs/firebase_user_programs_repository.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/models/user_programs_model.dart';
import 'package:app/screens/content/unit_detail_page.dart';
import 'package:app/utils/content.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum StatusProgram { INITIAL, FINISHED, RATE_SELECTED }

class ProgramsUtils {
  Future<void> evalueUnitByFirebase(
    BuildContext context, {
    required String programId,
    required Unit unit,
    required Program program,
    VoidCallback? onNextPressed,
    VoidCallback? onBackPressed,
    VoidCallback? onFinishedProgramPressed,
    required bool activeAutoPlay,
    bool forceNavigate = false,
  }) async {
    if (unit.order == program.unitsRefs!.length - 1) {
      onFinishedProgramPressed!();
    } else {
      var nextUnitRef = program.unitsRefs?[unit.order! + 1];
      final Unit nextUnit =
          await FirebaseProgramRepository().getUnitById(nextUnitRef!.id);

      onNextPressed!();
      if (forceNavigate || activeAutoPlay) {
        locator<UserPremiumCubit>().navigateTo(
          () => context.pushNamed(
            AppRoutes.unitDetail.name,
            extra: UnitDetailPageObject(
              onBackPressed: onBackPressed,
              program: program,
              unitRef: nextUnitRef,
              unitWithImage: null,
              onFinishedProgramPressed: onFinishedProgramPressed,
              fromAutoPlay: activeAutoPlay,
            ),
          ),
          nextUnit,
          program,
        );
      }
    }
  }

  Future<void> showModalProgramByID(
    BuildContext context, {
    required Program program,
  }) async {
    final UserPrograms newUserProgram = await FirebaseUserProgramsRepository()
        .getUserProgramsByProgramId(program.id ?? '');

    if (newUserProgram.programRate == null) {
      ContentUtils().showBottomModalContent(
        context,
        onCloseTap: () async {
          await FirebaseProgramRepository()
              .setRateProgramById(programId: program.id!, rate: -1);
          context.pop();

          if (locator<MyprogressCubit>().isMyProgressPregnantWeeksProgram(
              program.id)) // if this is a "semanas" program
            context.replaceNamed(AppRoutes.programDialogSuccess.name);
        },
        onRateButtonTap: () async {
          final int rate = context.read<ProgramCubit>().state.rate ?? -1;
          DanaAnalyticsService.trackProgramRating(program.id, rate);

          try {
            await FirebaseProgramRepository()
                .setRateProgramById(programId: program.id!, rate: rate);
            context.pop();
            if (locator<MyprogressCubit>().isMyProgressPregnantWeeksProgram(
                program.id)) // if this is a "semanas" program
              context.replaceNamed(AppRoutes.programDialogSuccess.name);
          } catch (error) {
            print("Failed to add user: $error");
          }
        },
      );
    } else {
      context.pop();
      context.pop();
    }
  }

  Future<void> initDialogProgramUserById(
    BuildContext context, {
    required Program program,
  }) async {
    final UserPrograms newUserProgram = await FirebaseUserProgramsRepository()
        .getUserProgramsByProgramId(program.id!);
    if (newUserProgram.userId == null) {
      await FirebaseProgramRepository()
          .createUserProgramByProgramId(programId: program.id!);
    }
  }
}
