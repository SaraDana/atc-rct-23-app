//IMPORT EXTERN APP
import 'dart:developer';
import 'package:app/features/deeplinks/app/cubits/footer_deeplink_unit/footer_deeplink_unit_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT INTERN APP
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/models/user_units_model.dart';

class FooterDeeplinkUnitCubit extends Cubit<FooterDeeplinkUnitState> {
  final Unit unit;
  final Program program;
  final bool? useful;
  FooterDeeplinkUnitCubit({
    required this.unit,
    required this.program,
    this.useful,
  }) : super(FooterDeeplinkUnitState()) {
    getUseful();
  }

  Future<void> getUseful() async {
    try {
      List<UserUnits> newUserUnits = await FirebaseUserUnitsRepository()
          .getAllUserUnitsByProgramIdAndUnitId(unit.id!);

      UserUnits newUserUnit = newUserUnits.first;
      changeUseful(
        useful: newUserUnit.useful!,
      );
    } catch (e) {
      log('$e');
    }
  }

  Future<void> changeUseful({required bool useful}) async {
    await _setUsefulUnitToFirebase(useful: useful);
    emit(state.copyWith(useful: useful));
  }

  Future<String> getDeeplinkUrl() async {
    String? newDeeplink;
    if (unit.relatedContentUrl == null || unit.relatedContentUrl == '') {
      newDeeplink = "https://dana.health/publications/";
    } else {
      newDeeplink = unit.relatedContentUrl;
    }

    emit(state.copyWith(deeplinkUrl: newDeeplink));
    return newDeeplink!;
  }

  Future<void> _setUsefulUnitToFirebase({required bool useful}) async {
    List<UserUnits> newUserUnits = await FirebaseUserUnitsRepository()
        .getAllUserUnitsByProgramIdAndUnitId(unit.id!);

    var obj = {
      'updatedAt': Timestamp.now(),
      'programId': program.id,
      'unitId': unit.id,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'useful': useful
    };
    if (newUserUnits.isEmpty) {
      obj['createdAt'] = Timestamp.now();
    }

    await FirebaseUserUnitsRepository()
        .setUserUnitByUnitId(data: obj, unitId: unit.id!);
  }
}
