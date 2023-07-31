//IMPORT EXTERN APP
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/data/repositories/banner/banner_repository.dart';
import 'package:app/models/banner_model.dart';

class FirebaseBannerRepository extends BaseBannerRepository {
  @override
  Future<List<CustomBanner>> getBanners() async {
    final querySnapshot = await _getBannersFirebase();
    final data = querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return data;
  }

  @override
  Future<List<CustomBannerScreen>> getBannerScreens(String? id) async {
    final colSnapshop2 = await _getBannerScreensFirebase(id);
    final colRef2 = colSnapshop2.docs.map((m) => m.data()).toList();
    return colRef2;
  }

  @override
  Future<void> updatePhone(String phone) async {
    return _updatePhoneFirebase(phone);
  }

  Future<QuerySnapshot<CustomBanner>> _getBannersFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_APP_CONFIG/marketing/banners')
        .withConverter(
          fromFirestore: (snapshot, _) =>
              CustomBanner.fromJson(snapshot.data()!),
          toFirestore: (dynamic customBanner, _) => customBanner.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<CustomBannerScreen>> _getBannerScreensFirebase(
      String? id) async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_APP_CONFIG/marketing/banners/$id/popupScreens')
        .withConverter(
          fromFirestore: (snapshot, _) =>
              CustomBannerScreen.fromJson(snapshot.data()!),
          toFirestore: (dynamic customBannerScreen, _) =>
              customBannerScreen.toJson(),
        )
        .get();
  }

  Future<void> _updatePhoneFirebase(String phone) async {
    return FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .update({"phone": phone});
  }
}
