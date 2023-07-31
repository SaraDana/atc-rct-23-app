import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentSerializer implements JsonConverter<DocumentReference, String> {
  const DocumentSerializer();

  @override
  DocumentReference fromJson(String path) =>
      FirebaseFirestore.instance.doc(path);

  @override
  String toJson(DocumentReference docRef) => docRef.path;
}
