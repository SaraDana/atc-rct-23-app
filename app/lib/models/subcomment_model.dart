// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:app/models/comment_model.dart';

part 'subcomment_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Subcomment {
  String? id;
  String? idComment;
  Comment? comment;

  Subcomment({
    this.id,
    this.idComment,
    this.comment,
  });

  void toogleLike(String userId) {
    if (comment!.likedBy!.contains(userId)) {
      comment!.likedBy!.remove(userId);
    } else {
      comment!.likedBy!.add(userId);
    }
  }

  factory Subcomment.fromJson(Map<String, dynamic> json) =>
      _$SubcommentFromJson(json);

  Map<String, dynamic> toJson() => _$SubcommentToJson(this);
}
