import 'package:cloud_firestore/cloud_firestore.dart';

class Unit {
  String? id;
  String? title;
  String? subtitle;
  int? order;
  String? content;
  int? contentDuration;
  String? audio;
  int? audioDuration;
  bool? isPremium;
  bool? isPremiumGroupB;
  String? relatedContentUrl;
  String? createdBy;
  String? updatedBy;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  DocumentReference? reference;
  String? programId;

  Unit({
    this.id,
    this.title,
    this.subtitle,
    this.order,
    this.content,
    this.contentDuration,
    this.audio,
    this.audioDuration,
    this.isPremium,
    this.isPremiumGroupB,
    this.relatedContentUrl,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.reference,
    this.programId,
  });

  factory Unit.fromSnapshot(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, dynamic>;

    return Unit(
        id: doc.id,
        title: data['title'],
        subtitle: data['subtitle'],
        order: data['order'] ?? -1,
        content: data['content'] ?? '',
        contentDuration: int.parse(data['contentDuration'].toString()),
        audio: data['audio'] ?? '',
        audioDuration: int.parse(data['audioDuration'].toString()),
        isPremium: data['isPremium'] ?? false,
        relatedContentUrl: data['relatedContentUrl'] ?? '',
        createdBy: data['createdBy'],
        updatedBy: data['updatedBy'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
        programId: data['programId'] ?? '',
        isPremiumGroupB: data['isPremiumGroupB'] ?? false,
        reference: doc.reference);
  }

  factory Unit.fromFirestore(DocumentSnapshot doc) {
    return Unit(
      id: doc.id,
      reference: doc.reference,
      title: doc.get('title'),
      subtitle: doc.get('subtitle'),
      order: doc.get('order') ?? -1,
      content: doc.get('content') ?? '',
      contentDuration: int.parse(doc.get('contentDuration').toString()),
      audio: doc.get('audio') ?? '',
      audioDuration: int.parse(doc.get('audioDuration').toString()),
      isPremium: doc.get('isPremium') ?? false,
      relatedContentUrl: doc.get('relatedContentUrl') ?? '',
      programId: doc.get('programId') ?? '',
      createdBy: doc.get('createdBy'),
      updatedBy: doc.get('updatedBy'),
      createdAt: doc.get('createdAt'),
      updatedAt: doc.get('updatedAt'),
      isPremiumGroupB: doc.get('isPremiumGroupB') ?? false,
    );
  }

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    order = json['order'];
    content = json['content'];
    contentDuration = json['contentDuration'];
    relatedContentUrl = json['relatedContentUrl'];
    audio = json['audio'];
    audioDuration = json['audioDuration'];
    isPremium = json['isPremium'];
    programId = json['programId'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    isPremiumGroupB = json['isPremiumGroupB'];

  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'order': order,
        'content': content,
        'contentDuration': contentDuration,
        'audio': audio,
        'audioDuration': audioDuration,
        'isPremium': isPremium,
        'createdBy': createdBy,
        'updatedBy': updatedBy,
        'relatedContentUrl': relatedContentUrl,
        'programId': programId,
        'isPremiumGroupB': isPremiumGroupB,
        // 'createdAt': createdAt,
        // 'updatedAt': updatedAt,
        // 'reference': reference,
      };
}
