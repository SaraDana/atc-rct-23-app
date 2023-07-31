import 'package:app/features/notifications/domain/models/notification.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseNotificationsRepository implements NotificationRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String notificationCenter = "notification_center";
  final String notifications = "notifications";


  @override
  Future<List<NotificationModel>> getNotifications(
      {int limit = 15, int offset = 0}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    try {
      if (offset == 0) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
            .collection(notificationCenter)
            .doc(userId)
            .collection(notifications)
            .limit(limit)
            .get();
        return _docsToNotificationModelList(querySnapshot);
      } else {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
            .collection(notificationCenter)
            .doc(userId)
            .collection(notifications)
            .limit(limit)
            .startAfter([offset]).get();
        return _docsToNotificationModelList(querySnapshot);
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> markNotificationsAsRead() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot<Map<String, dynamic>> subCollectionQuerySnapshot = await _db
        .collection(notificationCenter)
        .doc(userId)
        .collection(notifications)
        .where("is_read", isEqualTo: false)
        .get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc
        in subCollectionQuerySnapshot.docs) {
      await _db
          .collection(notificationCenter)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(notifications)
          .doc(doc.id)
          .update({"is_read": true});
    }
  }

  _docsToNotificationModelList(QuerySnapshot<Map<String, dynamic>> docs) {
    List<NotificationModel> notifications = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs.docs) {
      try{
        notifications.add(NotificationModel.fromJson(doc.data()));

      }catch(e){
      }
    }
    return notifications;
  }

  @override
  Future<int> totalNotifications() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    QuerySnapshot<Map<String, dynamic>> subCollectionQuerySnapshot = await _db
        .collection(notificationCenter)
        .doc(userId)
        .collection(notifications)
        .where("is_read", isEqualTo: false)
        .get();
    return subCollectionQuerySnapshot.docs.length;
  }
}
