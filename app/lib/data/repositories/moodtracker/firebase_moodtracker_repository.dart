//IMPORT EXTERN APP
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/data/repositories/moodtracker/moodtracker_repository.dart';

class FirebaseMoodtrackerRepository extends MoodtrackerRepository {
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Future<void> setUserMoods(
      {required int emotionSelected, required String comment}) async {
    try {
      await _setUserMoodsFirebase(
          emotionSelected: emotionSelected, comment: comment);
    } catch (error) {
      log("Failed to add user: $error");
    }
  }

  Future<void> _setUserMoodsFirebase(
      {required int emotionSelected, required String comment}) async {
    String userId =  FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .doc(
            '$COLLECTION_USER_MOOD/${FirebaseAuth.instance.currentUser!.uid}/$COLLECTION_USER_MOOD_MOODS/${DateFormat('dd-MM-yyyy').format(DateTime.now())}')
        .set({
      'id': FirebaseFirestore.instance
          .doc(
              '$COLLECTION_USER_MOOD/$userId/$COLLECTION_USER_MOOD_MOODS/$formattedDate')
          .id,
      'rate': emotionSelected,
      'comment': comment,
      'at': Timestamp.now()
    }, SetOptions(merge: true));
  }
}
