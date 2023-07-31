import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionModel {
  String? id;
  String? title;
  String? subtitle;
  bool? isPremium;
  List<DocumentReference>? programsRefs;
  DocumentReference? reference;
  List<String>? programsPaths;
  List<String>? programsIds;

  CollectionModel({
    this.id,
    this.title,
    this.subtitle,
    this.isPremium,
    this.programsRefs,
    this.reference,
    this.programsPaths,
    this.programsIds,
  });

  factory CollectionModel.fromSnapshot(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, dynamic>;
    final List<DocumentReference> programRefList =
        List.from(data['programsRefs']);
    final List<String> programPathList =
        programRefList.map((e) => e.path).toList();
    final List<String> programIdList = programRefList.map((e) => e.id).toList();

    return CollectionModel(
        id: doc.id,
        title: data['title'],
        subtitle: data['subtitle'],
        isPremium: data['isPremium'],
        programsRefs: programRefList,
        reference: doc.reference,
        programsPaths: programPathList,
        programsIds: programIdList);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isubtitled': subtitle,
        'isPremium': isPremium,
        'programsPaths': programsPaths,
        'programsIds': programsIds,
      };
}
