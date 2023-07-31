import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_mood_model.g.dart';

enum FilterUserMood {
  week,
  month,
  year,
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserMood {
  String? id;
  int? rate;
  String? comment;
  @TimestampConverter()
  DateTime? at;

  UserMood({this.id, this.rate, this.comment, this.at});

  factory UserMood.fromJson(Map<String, dynamic> json) =>
      _$UserMoodFromJson(json);

  Map<String, dynamic> toJson() => _$UserMoodToJson(this);
}
