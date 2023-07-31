import 'package:cloud_firestore/cloud_firestore.dart';

class HomeConfig {
  List<DocumentReference>? tagsRefs;

  HomeConfig({this.tagsRefs});

  factory HomeConfig.fromJson(Map<String, dynamic> json) {
    List<DocumentReference>? tagRefList;
    if (json['tagsRefs'] != null) tagRefList = List.from(json['tagsRefs']);
    return HomeConfig(
      tagsRefs: tagRefList,
    );
  }

  Map<String, dynamic> toJson() => {"tagsRefs": tagsRefs};
}
