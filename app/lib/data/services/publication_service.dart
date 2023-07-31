import 'package:cloud_firestore/cloud_firestore.dart';

import '../../config/constants.dart';
import '../../models/publication_model.dart';

class PublicationService {
  Future<QuerySnapshot<Publication>> _getPublicationsFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .withConverter(
          fromFirestore: (snapshot, _) =>
              Publication.fromJson(snapshot.data()!),
          toFirestore: (dynamic publication, _) => publication.toJson(),
        )
        .get();
  }

  Future<List<Publication>> getPublications() async {
    final querySnapshot = await _getPublicationsFirebase();
    final data = querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return data;
  }
}
