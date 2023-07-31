import 'package:app/config/constants.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:app/utils/preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepository extends UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<NewUserModel?> getUserById(String? userId) async {
    final querySnapshot = await _getUserByIdFirebase(userId!);

    final users =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    return users.isEmpty ? null : users.first;
  }

  @override
  Future<NewUserModel?> getUserByEmail() async {
    try {
      final querySnapshot = await _getUserByEmailFirebase();
      final user = querySnapshot?.data();
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  String getUserId() {
    return _getUserIdFirebase();
  }

  @override
  Future<void> setUserByEmail({required Map<String, dynamic> data}) {
    return _setUserByEmailFirebase(data: data);
  }

  @override
  Future<void> createNewUser(User user) {
    return _createNewUserFirebase(user);
  }

  @override
  Future<void> editUser() {
    return _editUserFirebase();
  }

  String _getUserIdFirebase() {
    if (_auth.currentUser != null) return _auth.currentUser!.uid;
    return "";
  }

  Future<QuerySnapshot<NewUserModel>> _getUserByIdFirebase(
      String? userId) async {
    return await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .where('id', isEqualTo: userId)
        .withConverter<NewUserModel>(
          fromFirestore: (snapshot, _) =>
              NewUserModel.fromJson(snapshot.data()!),
          toFirestore: (newUserModel, _) => newUserModel.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<NewUserModel>?> _getUserByEmailFirebase() async {
    if (_auth.currentUser?.email == null) return null;
    return await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc('${_auth.currentUser!.email}')
        .withConverter<NewUserModel>(
          fromFirestore: (snapshot, _) =>
              NewUserModel.fromJson(snapshot.data()!),
          toFirestore: (newUserModel, _) => newUserModel.toJson(),
        )
        .get();
  }

  Future<void> _setUserByEmailFirebase(
      {required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .update(
          data,
        );
  }

  Future<void> _createNewUserFirebase(User user) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .set({
      'id': FirebaseAuth.instance.currentUser!.uid,
      'updatedAt': Timestamp.now(),
      'createdAt': Timestamp.now(),
      'termsAcceptedAt': Timestamp.now(),
      'lastAccessAt': Timestamp.now(),
      'createdBy': user.email,
      'name': user.displayName == null ? "" : user.displayName,
      'email': user.email,
    }, SetOptions(merge: true));
  }

  Future<void> _editUserFirebase() async {
    await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .set({'lastAccessAt': Timestamp.now()}, SetOptions(merge: true));
  }

  @override
  Future<void> logout() async {
    DanaAnalyticsService.trackUserLogout();
    DanaAnalyticsService.resetUserInfoBecauseLogout();
    await PreferenceUtils.removeAll();
    PreferenceUtils.remove(PREF_MOOD_QUESTION_DATE);
    PreferenceUtils.remove(PREF_IS_PREMIUM);
    PreferenceUtils.setBool(PREF_FIRST_PROFILE_QUESTION, false);
    await FirebaseAuth.instance.signOut();
    await resetUserInfoCubits();
  }

  @override
  Future<void> addOneSignalID(String oneSignalID) async {
    final String? id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null || oneSignalID == id) return;
    final playerIdsCollection =
        FirebaseFirestore.instance.collection(ONE_SIGNAL_ID).doc(id);

    final playerIdsDoc = await playerIdsCollection.get();

    if (playerIdsDoc.exists) {
      await playerIdsCollection.update({
        'playerIds': FieldValue.arrayUnion([oneSignalID])
      });
    } else {
      await playerIdsCollection.set({
        'playerIds': [oneSignalID]
      });
    }
  }

  @override
  Future<void> removeOneSignalID(String oneSignalID) async {
    final String? id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) return;
    final playerIdsCollection =
        FirebaseFirestore.instance.collection(ONE_SIGNAL_ID).doc(id);
    final playerIdsDoc = await playerIdsCollection.get();

    if (playerIdsDoc.exists) {
      await playerIdsCollection.update({
        'playerIds': FieldValue.arrayRemove([oneSignalID])
      });
    }
  }
}
