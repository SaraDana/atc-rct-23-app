//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT INTERN APP
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/cubits/unit_program/unit_program_state.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';

import '../../data/services/dana_analytics_service.dart';

class UnitProgramCubit extends Cubit<UnitProgramState> {
  UnitProgramCubit() : super(UnitProgramState());

  Future<void> init({required String unitId}) async {
    emit(state.copyWith(
      status: StatusCubit.LOADING,
    ));
    try {
      final Unit unit = await FirebaseProgramRepository().getUnitById(unitId);
      DanaAnalyticsService.trackUnitOpened(
          unit.id, unit.audio?.isNotEmpty ?? false);
      final bool contentIsNotEmpty = state.unit?.content != null &&
          state.unit?.content?.isNotEmpty == true;
      emit(state.copyWith(
        unit: unit,
        status: StatusCubit.SUCCESS,
        isRead: contentIsNotEmpty ? state.isRead : false,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: StatusCubit.ERROR,
          errorMessage: 'Error en la carga de datos',
        ),
      );
    }
  }

  Future<void> readUnit(
      {required String unitId, required String programId}) async {
    final Unit unit = await FirebaseProgramRepository().getUnitById(unitId);

    var obj = {
      'updatedAt': Timestamp.now(),
      'programId': programId,
      'unitId': unit.id,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
    if (unit.createdAt == null) {
      obj['createdAt'] = Timestamp.now();
    }
    DanaAnalyticsService.trackUnitFinished(
        unit.id, unit.audio != null && unit.audio!.isNotEmpty);

    locator<InterestedEventCubit>()
        .eventOfInterestHappened(EventOfInterestedType.FINISHED_UNIT, {
      "unitId": unit.id ?? "",
      "programId": programId,
    });

    await FirebaseUserUnitsRepository()
        .setUserUnitByUnitId(data: obj, unitId: unit.id!);
  }

  void updateIsRead({required bool isRead}) {
    emit(state.copyWith(
      isRead: isRead,
    ));
  }
}
