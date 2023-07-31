//IMPORT EXTERN APP
import 'package:app/data/repositories/tag/firebase_tag_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/models/home_config_model.dart';
import 'package:app/models/tag_model.dart';
import 'package:app/data/repositories/home_config/home_config_repository.dart';

class FirebaseHomeConfigRepository extends HomeConfigRepository {
  final FirebaseTagRepository tagRepository;

  FirebaseHomeConfigRepository({required this.tagRepository});

  @override
  Future<List<Tag>> getAllTags() async {
    final querySnapshot = await _getHomeConfigFirebase();

    var hc = querySnapshot.data();
    if (hc == null || hc.tagsRefs == null) return [];

    var tags = hc.tagsRefs!.map((e) => tagRepository.getTag(e.id)).toList();
    List<Tag> t = await Future.wait(tags);
    return t;
  }

  Future<DocumentSnapshot<HomeConfig>> _getHomeConfigFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_APP_CONFIG')
        .doc('$DOCUMENT_ID_HOME_CONFIG')
        .withConverter<HomeConfig>(
          fromFirestore: (snapshot, _) => HomeConfig.fromJson(snapshot.data()!),
          toFirestore: (homeConfig, _) => homeConfig.toJson(),
        )
        .get();
  }
}
