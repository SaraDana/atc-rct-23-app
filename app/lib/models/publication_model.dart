import 'package:app/models/subcomment_model.dart';
import 'package:app/models/timestamp_convert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'answer_model.dart';
import 'comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publication_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Publication {
  final String? creatorId;
  final String? id;
  final List<String>? likedBy;
  List<String>? bookmarkedBy;
  @TimestampConverter()
  final DateTime? publicationDate;
  final List<String>? tags;
  final List<String>? socialSections;
  final String? title;
  final String? type;
  List<Comment>? comments;
  List<Subcomment>? subcomments;
  Map<String, int> percentages;
  int? commentsCount;

  // POST
  String backgroundImage;
  // POLL
  List<Answer> answers;

  int get numLikes => likedBy!.length;
  int get numComments => comments?.length ?? 0;
  int get numSubcomments => subcomments?.length ?? 0;

  Publication({
    this.creatorId,
    this.id,
    this.likedBy,
    this.bookmarkedBy,
    this.publicationDate,
    this.tags,
    this.socialSections,
    this.title,
    this.type,
    this.comments,
    this.subcomments,
    // POST
    this.backgroundImage = '',
    // POLL
    this.answers = const [],
    this.percentages = const {},
    this.commentsCount,
  });

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationToJson(this);

  bool isBookmarked(String userId) {
    if (bookmarkedBy != null) {
      return bookmarkedBy!.contains(userId);
    }
    return false;
  }

  bool isLiked(String userId) {
    return likedBy!.contains(userId);
  }

  bool isSelected(String userId) {
    var selected = false;
    answers.forEach((answer) {
      answer.selections.forEach((selection) {
        selected = selected || selection.userId == userId;
      });
    });

    return selected;
  }

  String? selection(String userId) {
    String? selected = '';
    answers.forEach((answer) {
      answer.selections.forEach((selection) {
        if (selection.userId == userId) {
          selected = answer.id;
        }
      });
    });

    return selected;
  }

  void refreshPercentages() {
    if (type != 'POLL') {
      return;
    }

    Map<String, int> percentages = {};
    var totalAnswers = 0;

    for (final answer in answers) {
      totalAnswers += answer.selections.length;
    }

    for (final answer in answers) {
      percentages[answer.id!] = totalAnswers == 0
          ? 0
          : ((answer.selections.length / totalAnswers) * 100).round();
    }
    this.percentages = percentages;
  }

  void toogleBookmark(String userId) {
    if (bookmarkedBy == null) {
      bookmarkedBy = [];
    }
    if (bookmarkedBy!.contains(userId)) {
      bookmarkedBy!.remove(userId);
    } else {
      bookmarkedBy!.add(userId);
    }
  }

  void toogleLike(String userId) {
    if (likedBy!.contains(userId)) {
      likedBy!.remove(userId);
    } else {
      likedBy!.add(userId);
    }
  }
}
