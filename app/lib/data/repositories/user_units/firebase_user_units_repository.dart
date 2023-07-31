//IMPORT EXTERN APP
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/models/user_units_model.dart';
import 'package:app/data/repositories/user_units/user_units_repository.dart';

class FirebaseUserUnitsRepository extends UserUnitsRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  CollectionReference userUnits =
      FirebaseFirestore.instance.collection(COLLECTION_USER_UNITS);

  @override
  Future<List<UserUnits>> getAllUserUnitsByProgramId(String programId) async {
    List<UserUnits> units = [];
    try {
      final querySnapshot =
          await _getAllUserUnitsByProgramIdFirebase(programId);
      final data =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return data;
    } catch (e) {
      return units;
    }
  }

  @override
  Future<List<UserUnits>> getAllUserUnits({String? userId}) async {
    List<UserUnits> units = [];
    try {
      final querySnapshot = await _getAllUserUnitsFirebase(userId: userId);
      final data =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return data;
    } catch (e) {
      return units;
    }
  }

  @override
  Future<List<UserUnits>> getAllUserUnitsByProgramIdAndUnitId(
      String unitId) async {
    List<UserUnits> units = [];
    try {
      final querySnapshot =
          await _getAllUserUnitsByProgramIdAndUnitIdFirebase(unitId: unitId);
      final data =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return data;
    } catch (e) {
      return units;
    }
  }

  @override
  Future<void> setUserUnitByUnitId(
      {required Map<String, dynamic> data, required String unitId}) async {
    await _setUserUnitFirebaseByUnitIdFirebase(data: data, unitId: unitId);
  }

  Future<QuerySnapshot<UserUnits>> _getAllUserUnitsFirebase({String? userId}) async {
    String unitsForUserId = userId??_firebaseAuth.currentUser!.uid;
    return await userUnits
        .where(DOCUMENT_USER_UNITS_USER_ID,
            isEqualTo: unitsForUserId)
        .withConverter(
          fromFirestore: (snapshot, _) => UserUnits.fromJson(snapshot.data()!),
          toFirestore: (dynamic userUnits, _) => userUnits.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<UserUnits>> _getAllUserUnitsByProgramIdFirebase(
      String programId) async {
    return await userUnits
        .where('programId', isEqualTo: programId)
        .where(DOCUMENT_USER_UNITS_USER_ID,
            isEqualTo: _firebaseAuth.currentUser!.uid)
        .withConverter(
          fromFirestore: (snapshot, _) => UserUnits.fromJson(snapshot.data()!),
          toFirestore: (dynamic userUnits, _) => userUnits.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<UserUnits>> _getAllUserUnitsByProgramIdAndUnitIdFirebase(
      {required String unitId}) async {
    return await userUnits
        .where(DOCUMENT_USER_UNITS_USER_ID,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(DOCUMENT_USER_UNITS_UNIT_ID, isEqualTo: unitId)
        .withConverter<UserUnits>(
          fromFirestore: (snapshot, _) => UserUnits.fromJson(snapshot.data()!),
          toFirestore: (userUnit, _) => userUnit.toJson(),
        )
        .get();
  }

  Future<void> _setUserUnitFirebaseByUnitIdFirebase(
      {required Map<String, dynamic> data, required String unitId}) async {
    await userUnits
        .doc('${FirebaseAuth.instance.currentUser!.uid}-$unitId')
        .set(data, SetOptions(merge: true));
  }
}
