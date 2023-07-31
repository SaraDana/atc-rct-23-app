//IMPORT EXTERN APP
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/data/repositories/program/program_repository.dart';
import 'package:app/models/user_programs_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:developer';

class FirebaseProgramRepository extends ProgramRepository {
  CollectionReference programCollectionRef =
      FirebaseFirestore.instance.collection(COLLECTION_PROGRAMS);
  CollectionReference userProgramsCollectionRef =
      FirebaseFirestore.instance.collection(COLLECTION_USER_PROGRAMS);
  @override
  Future<List<Program>> getAllPrograms() async {
    try {
      final querySnapshot = await _getAllProgramsFirebase();
      final programs =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return programs;
    } catch ( e){
      log(e.toString());
      return [];
    }
  }

  @override
  Future<Program> getProgram(String ref) async {
    try {
      final docSnapshot = await _getProgramFirebase(ref);
      final data = docSnapshot.data();
      return data!;
    } catch (e) {
      return Program();
    }
  }

  @override
  Future<Program?> getProgramById(String programId) async {
    try {
      final querySnapshot = await _getProgramByIdFirebase(programId);
      final newprogram = querySnapshot.data();

      return newprogram;
    } catch (e) {
      return Program();
    }
  }

  @override
  Future<List<Unit>> getUnitsByProgramId(String programId) async {
    try {
      final querySnapshot = await _getUnitsByProgramIdFirebase(programId);
      final units =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return units;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<Unit> getUnitById(String id) async {
    final docSnapshot = await _getUnitByIdFirebase(id);
    final data = docSnapshot.data();
    return data!;
  }

  @override
  Future<void> setRateProgramById(
      {required String programId, required int rate}) async {
    await _setRateProgramByIdFirebase(programId: programId, rate: rate);
  }

  @override
  Future<void> createUserProgramByProgramId({required String programId}) async {
    await _createUserProgramByProgramIdFirebase(programId: programId);
  }

  @override
  Future<String> getImageUrl({required String poster}) async {
    return await FirebaseStorage.instance.refFromURL(poster).getDownloadURL();
  }

  Future<QuerySnapshot<Program>> _getAllProgramsFirebase() async {
      return await programCollectionRef
          .where('isHidden', isEqualTo: false)
          .withConverter(
        fromFirestore: (snapshot, _) => Program.fromSnapshot(snapshot),
        toFirestore: (dynamic program, _) => program.toJson(),
      )
          .get();
  }

  Future<DocumentSnapshot<Program>> _getProgramFirebase(String ref) async {
    return await programCollectionRef
        .doc(ref)
        .withConverter(
          fromFirestore: (snapshot, _) => Program.fromSnapshot(snapshot),
          toFirestore: (dynamic program, _) => program.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<Program>> _getProgramByIdFirebase(
      String programId) async {
    return await programCollectionRef
        .doc(programId)
        .withConverter<Program>(
            fromFirestore: (snapshot, _) => Program.fromSnapshot(snapshot),
            toFirestore: (Program value, SetOptions? options) {
              return {};
            })
        .get();
  }

  Future<void> _setRateProgramByIdFirebase(
      {required String programId, required int rate}) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_USER_PROGRAMS)
        .where(DOCUMENT_USER_PROGRAM_USER_ID,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(DOCUMENT_USER_PROGRAM_PROGRAM_ID, isEqualTo: programId)
        .withConverter<UserPrograms>(
          fromFirestore: (snapshot, _) =>
              UserPrograms.fromJson(snapshot.data()!),
          toFirestore: (userProgram, _) => userProgram.toJson(),
        )
        .get()
        .then((value) {
      userProgramsCollectionRef.doc(value.docs.first.id).set(
        {
          'programRate': rate,
          'updatedAt': Timestamp.now(),
        },
        SetOptions(merge: true),
      );
    });
  }

  Future<void> _createUserProgramByProgramIdFirebase(
      {required String programId}) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_USER_PROGRAMS)
        .doc('${FirebaseAuth.instance.currentUser!.uid}-$programId')
        .set({
      'initialRate': -1,
      'programId': programId,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'createdAt': Timestamp.now(),
    }, SetOptions(merge: true));
  }

  Future<QuerySnapshot<Unit>> _getUnitsByProgramIdFirebase(
      String programId) async {
    return await FirebaseFirestore.instance
        .collection('units')
        .where('programId', isEqualTo: programId)
        .where('isHidden', isEqualTo: false)
        .orderBy('order')
        .withConverter<Unit>(
          fromFirestore: (snapshot, _) => Unit.fromSnapshot(snapshot),
          toFirestore: (unit, _) => unit.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<Unit>> _getUnitByIdFirebase(String id) async {
    return await FirebaseFirestore.instance
        .collection('units')
        .doc(id)
        .withConverter<Unit>(
          fromFirestore: (snapshot, _) => Unit.fromJson(snapshot.data()!),
          toFirestore: (unit, _) => unit.toJson(),
        )
        .get();
  }

  Future<void> _setUserProgramById({required String programId}) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_USER_PROGRAMS)
        .where(DOCUMENT_USER_PROGRAM_USER_ID,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(DOCUMENT_USER_PROGRAM_PROGRAM_ID, isEqualTo: programId)
        .withConverter<UserPrograms>(
          fromFirestore: (snapshot, _) =>
              UserPrograms.fromJson(snapshot.data()!),
          toFirestore: (userProgram, _) => userProgram.toJson(),
        )
        .get()
        .then((value) {
      userProgramsCollectionRef.doc(value.docs.first.id).set(
        {
          'programRate': -1,
          'updatedAt': Timestamp.now(),
        },
        SetOptions(merge: true),
      );
    });
  }
}
