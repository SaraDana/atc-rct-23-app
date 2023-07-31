import 'package:app/core/utils/date_time_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'new_user_model.g.dart';

enum CMSRole { SUPER_ADMIN, ADMIN, CMS }

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
class NewUserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? location;
  @TimestampConverter()
  final DateTime? createdAt;
  // final CMSRole? cmsRole;
  final String? appRole;
  final String? specialistRole;
  final String? createdBy;
  final String? updatedBy;
  final String? birthday;
  final String? genre;
  @TimestampConverter()
  final DateTime? updatedAt;
  @TimestampConverter()
  final DateTime? lastAccessAt;
  @TimestampConverter()
  final DateTime? lastAcceptedCommunityRules;
  final String? motherMonths;
  final int? pregnantWeeks;
  final String? profileMoment;
  final String? profileMotherExperience;
  final String? profilePsychologicalTherapy;
  final String? profileSupportGroup;
  final List<Map<String, dynamic>>? profileHelp;
  final List<Map<String, dynamic>>? profileContentType;
  final List<Map<String, dynamic>>? profileEmotions;
  @TimestampConverter()
  final DateTime? lastPeriod;
  @TimestampConverter()
  final DateTime? childBirthDate;
  final bool? completedOnboarding;
   bool? premiumGroupB;
  final String? childCountSelection;
  final int? childCount;
  final List<Map<String, dynamic>>? childBirthDates;

  NewUserModel(
      {this.id,
      this.name,
      this.email,
      this.location,
      this.createdAt,
      // this.cmsRole,
      this.appRole,
      this.specialistRole,
      this.createdBy,
      this.updatedBy,
      this.birthday,
      this.genre,
      this.updatedAt,
      this.lastAccessAt,
      this.lastAcceptedCommunityRules,
      this.motherMonths,
      this.pregnantWeeks,
      this.profilePsychologicalTherapy,
      this.profileMoment,
      this.profileMotherExperience,
      this.profileHelp,
      this.profileContentType,
      this.profileSupportGroup,
      this.profileEmotions,
      this.lastPeriod,
      this.childBirthDate,
      this.completedOnboarding,
      this.premiumGroupB,
      this.childCountSelection,
      this.childCount,
      this.childBirthDates});

  factory NewUserModel.fromJson(Map<String, dynamic> json) =>
      _$NewUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserModelToJson(this);

  int? getUserAge() {
    if (this.birthday == null) return null;
    var birthday = new DateFormat('dd-MM-yyyy').parse(this.birthday!);
    if (birthday == null) return null;
    final now = DateTime.now();

    int yearDifference = now.year - birthday.year;
    bool hasYetToCelebrateBirthday = now.month < birthday.month ||
        (now.month == birthday.month && now.day < birthday.day);

    int userAge = yearDifference - (hasYetToCelebrateBirthday ? 1 : 0);

    return userAge;
  }

  int calculateWeeksPregnant() {
    if (this.lastPeriod == null) return 0;
    return calculateWeeksBetweenDate(
        fromTime: this.lastPeriod!, toTime: DateTime.now());
  }

  int calculateChildMonths() {
    if (this.childBirthDate == null) return 0;
    return calculateMonthsBetweenDate(
        fromTime: this.childBirthDate!, toTime: DateTime.now());
  }
}


