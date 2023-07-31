//IMPORT EXTERN APP
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:app/data/repositories/user_mood/user_mood_repository.dart';

class FirebaseUserMoodRepository extends UserMoodRepository {
  @override
  Future<List<UserMood>> getAllUserMoods() async {
    List<UserMood> userMoods = [];
    try {
      final querySnapshot = await _getAllUserMoodsFirebase();
      userMoods =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return userMoods;
    } catch (e) {
      log('$e');
    }
    return userMoods;
  }

  @override
  Future<UserMood> getUserMoodById() async {
    UserMood emotion = UserMood();

    try {
      final querySnapshot = await _getUserMoodByIdFirebase();
      final emotion =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList().first;
      return emotion;
    } catch (e) {
      log('$e');
    }
    return emotion;
  }

  Future<QuerySnapshot<UserMood>> _getAllUserMoodsFirebase() async {
    CollectionReference collectionUserMoods = FirebaseFirestore.instance.collection(
        '$COLLECTION_USER_MOOD/${FirebaseAuth.instance.currentUser!.uid}/$COLLECTION_USER_MOOD_MOODS');
    return await collectionUserMoods
        .withConverter<UserMood>(
          fromFirestore: (snapshot, _) => UserMood.fromJson(snapshot.data()!),
          toFirestore: (userMood, _) => userMood.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<UserMood>> _getUserMoodByIdFirebase() async {
    CollectionReference collectionUserMoods = FirebaseFirestore.instance.collection(
        '$COLLECTION_USER_MOOD/${FirebaseAuth.instance.currentUser!.uid}/$COLLECTION_USER_MOOD_MOODS');
    return await collectionUserMoods
        .where(
          'id',
          isEqualTo: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        )
        .withConverter<UserMood>(
          fromFirestore: (snapshot, _) => UserMood.fromJson(snapshot.data()!),
          toFirestore: (userMood, _) => userMood.toJson(),
        )
        .get();
  }
}
