//IMPORT EXTERN APP
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/data/repositories/user_delete/user_delete_repository.dart';
import 'package:app/models/user_delete_model.dart';

class FirebaseUserDeleteRepository extends UserDeleteRepository {
  @override
  Future<void> setDeleteUserFirebase(
      {required String userId, required String? userEmail}) async {
    await _setDeleteUserFirebase(userId: userId, userEmail: userEmail);
  }

  @override
  Future<UserDeleteModel> getDeleteUserFirebase() async {
    UserDeleteModel userDeleteModel = UserDeleteModel();
    try {
      final querySnapshot = await _getDeleteUserFirebase();
      userDeleteModel = querySnapshot.data()!;
      return userDeleteModel;
    } catch (e) {
      log('$e');
    }

    return userDeleteModel;
  }

  Future<void> _setDeleteUserFirebase(
      {required String userId, required String? userEmail}) async {
    final doc = FirebaseFirestore.instance
        .collection(COLLECTION_DELETE_USERS)
        .doc(userEmail);

    DateTime? date = DateTime.now();

    Map<String, dynamic> data = {
      'userId': userId,
      'requestDate': [date]
    };

    await doc.set(
      data,
      SetOptions(merge: true),
    );
  }

  Future<DocumentSnapshot<UserDeleteModel>> _getDeleteUserFirebase() async {
    return await FirebaseFirestore.instance
        .collection(COLLECTION_DELETE_USERS)
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .withConverter<UserDeleteModel>(
          fromFirestore: (snapshot, _) =>
              UserDeleteModel.fromJson(snapshot.data()!),
          toFirestore: (userDelete, _) => userDelete.toJson(),
        )
        .get();
  }
}
