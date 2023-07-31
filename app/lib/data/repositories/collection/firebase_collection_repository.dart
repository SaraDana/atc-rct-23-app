//IMPORT INTERN APP
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/models/collection_model.dart';
import 'package:app/data/repositories/collection/collection_repository.dart';

class FirebaseCollectionRepository extends CollectionRepository {
  @override
  Future<List<CollectionModel>> getAllCollections() async {
    try {
      final querySnapshot = await _getCollectionsFirebase();
      final data =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<QuerySnapshot<CollectionModel>> _getCollectionsFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_COLLECTIONS')
        .where('isHidden', isEqualTo: false)
        .orderBy('order', descending: false)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              CollectionModel.fromSnapshot(snapshot),
          toFirestore: (dynamic publication, _) => publication.toJson(),
        )
        .get();
  }
}
