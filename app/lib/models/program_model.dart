import 'package:cloud_firestore/cloud_firestore.dart';

class Program {
  final String? id;
  final String? name;
  final String? description;
  final String? title;
  final String? subtitle;
  final bool? isPremium;
  final bool? isPremiumGroupB;
  final String? poster;
  final List<DocumentReference>? unitsRefs;
  final DocumentReference? reference;
  final List<DocumentReference>? tagsRefs;
  Timestamp? createdAt;

  Program(
      {this.id,
      this.name,
      this.description,
      this.title,
      this.subtitle,
      this.isPremium,
      this.poster,
      this.unitsRefs,
      this.reference,
      this.tagsRefs,
        this.isPremiumGroupB,
      this.createdAt});

  factory Program.fromSnapshot(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, dynamic>;

    return Program(
        id: doc.id,
        name: data['name'],
        description: data['description'],
        title: data['title'],
        subtitle: data['subtitle'],
        isPremium: data['isPremium'],
        isPremiumGroupB: data['isPremiumGroupB'],
        poster: data['poster'],
        unitsRefs: List.from(data['unitsRefs']),
        reference: doc.reference,
        tagsRefs: data['tagsRefs'] != null ? List.from(data['tagsRefs']) : []);
  }
}
