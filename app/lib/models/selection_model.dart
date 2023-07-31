import 'package:cloud_firestore/cloud_firestore.dart';

class Selection {
  String? id;
  final String? userId;
  final DateTime? date;

  Selection({
    this.id = '',
    this.userId,
    this.date,
  });

  factory Selection.fromJson(Map<String, dynamic> json) => Selection(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse((json["date"] as Timestamp).toDate().toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": Timestamp.fromDate(date!),
      };
}
