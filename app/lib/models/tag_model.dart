import 'package:cloud_firestore/cloud_firestore.dart';

class Tag {
  final String? id;
  final String? name;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;

  Tag({
    this.id = '',
    this.name,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(
            (json["createdAt"] as Timestamp).toDate().toString()),
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(
            (json["updatedAt"] as Timestamp).toDate().toString()),
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
      };
}
