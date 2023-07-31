//IMPORT EXTERN APP
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/models/tag_model.dart';

import 'tag_repository.dart';

class FirebaseTagRepository extends TagRepository {
  @override
  Future<List<Tag>> getAllTags() async {
    final querySnapshot = await _getAllTagsFirebase();
    final tags = querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return tags;
  }

  @override
  Future<Tag> getTag(String tagId) async {
    final querySnapshot = await _getTagFirebase(tagId);
    final tag = querySnapshot.data();
    return tag!;
  }

  Future<QuerySnapshot<Tag>> _getAllTagsFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_TAGS')
        .withConverter<Tag>(
          fromFirestore: (snapshot, _) => Tag.fromJson(snapshot.data()!),
          toFirestore: (tag, _) => tag.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<Tag>> _getTagFirebase(String tagId) async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_TAGS')
        .doc(tagId)
        .withConverter<Tag>(
          fromFirestore: (snapshot, _) => Tag.fromJson(snapshot.data()!),
          toFirestore: (tag, _) => tag.toJson(),
        )
        .get();
  }
}
