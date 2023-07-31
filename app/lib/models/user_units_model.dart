import 'package:cloud_firestore/cloud_firestore.dart';

class UserUnits {
  String? unitId;
  String? programId;
  String? userId;
  bool? useful;
  Timestamp? updatedAt;
  Timestamp? createdAt;

  UserUnits(
      {this.unitId,
      this.programId,
      this.userId,
      this.useful,
      this.updatedAt,
      this.createdAt});

  UserUnits.fromJson(Map<String, dynamic> json) {
    unitId = json['unitId'];
    programId = json['programId'];
    userId = json['userId'];
    useful = json['useful'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  factory UserUnits.fromSnapshot(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, dynamic>;
    return UserUnits(
      unitId: data['unitId'],
      programId: data['programId'],
      userId: data['userId'],
      useful: data['useful'],
      updatedAt: data['updatedAt'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'unitId': unitId,
        'programId': programId,
        'userId': userId,
        'useful': useful,
        'updatedAt': updatedAt,
        'createdAt': createdAt
      };
}
