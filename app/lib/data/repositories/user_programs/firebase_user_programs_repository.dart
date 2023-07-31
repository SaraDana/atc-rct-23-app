//IMPORT EXTERN APP
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/data/repositories/user_programs/user_programs_repository.dart';
import 'package:app/models/user_programs_model.dart';

class FirebaseUserProgramsRepository extends UserProgramsRepository {
  CollectionReference userPrograms =
      FirebaseFirestore.instance.collection(COLLECTION_USER_PROGRAMS);
  @override
  Future<UserPrograms> getUserProgramsByProgramId(String programId) async {
    UserPrograms userProgram = UserPrograms();
    try {
      final querySnapshot =
          await _getUserProgramsByProgramIdFirebase(programId: programId);
      userProgram = querySnapshot.data()!;
      return userProgram;
    } catch (e) {
      return userProgram;
    }
  }

  Future<DocumentSnapshot<UserPrograms>> _getUserProgramsByProgramIdFirebase(
      {required String programId}) async {
    return await userPrograms
        .doc('${FirebaseAuth.instance.currentUser!.uid}-$programId')
        .withConverter<UserPrograms>(
          fromFirestore: (snapshot, _) =>
              UserPrograms.fromJson(snapshot.data()!),
          toFirestore: (userPrograms, _) => userPrograms.toJson(),
        )
        .get();
  }
}
