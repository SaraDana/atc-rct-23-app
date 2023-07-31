import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'timestamp_convert.dart';

part 'comment_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Comment {
  String? id;
  final String? userId;
  final String? text;
  @TimestampConverter()
  final DateTime? date;
  final List<String>? likedBy;
  String userName;
  String userSpecialistRole;
  final List<String>? reportedBy;

  int get numLikes => likedBy!.length;

  Comment({
    this.id = '',
    this.userId,
    this.text,
    this.date,
    this.likedBy,
    this.userName = '',
    this.userSpecialistRole = '',
    this.reportedBy,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  bool isLiked(String userId) {
    return likedBy!.contains(userId);
  }

  bool toogleLike(String userId) {
    if (likedBy!.contains(userId)) {
      likedBy!.remove(userId);
      return false;
    } else {
      likedBy!.add(userId);
      return true;
    }
  }

  bool isReportedBy(String userId) {
    return reportedBy!.contains(userId);
  }

  void report(String userId) {
    if (reportedBy!.contains(userId)) return;
    reportedBy!.add(userId);
  }
}
