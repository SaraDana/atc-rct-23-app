// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUserModel _$NewUserModelFromJson(Map json) => NewUserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      appRole: json['appRole'] as String?,
      specialistRole: json['specialistRole'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      birthday: json['birthday'] as String?,
      genre: json['genre'] as String?,
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedAt'], const TimestampConverter().fromJson),
      lastAccessAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastAccessAt'], const TimestampConverter().fromJson),
      lastAcceptedCommunityRules: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastAcceptedCommunityRules'],
          const TimestampConverter().fromJson),
      motherMonths: json['motherMonths'] as String?,
      pregnantWeeks: json['pregnantWeeks'] as int?,
      profilePsychologicalTherapy:
          json['profilePsychologicalTherapy'] as String?,
      profileMoment: json['profileMoment'] as String?,
      profileMotherExperience: json['profileMotherExperience'] as String?,
      profileHelp: (json['profileHelp'] as List<dynamic>?)
          ?.map((e) => Map<String, dynamic>.from(e as Map))
          .toList(),
      profileContentType: (json['profileContentType'] as List<dynamic>?)
          ?.map((e) => Map<String, dynamic>.from(e as Map))
          .toList(),
      profileSupportGroup: json['profileSupportGroup'] as String?,
      profileEmotions: (json['profileEmotions'] as List<dynamic>?)
          ?.map((e) => Map<String, dynamic>.from(e as Map))
          .toList(),
      lastPeriod: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastPeriod'], const TimestampConverter().fromJson),
      childBirthDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['childBirthDate'], const TimestampConverter().fromJson),
      completedOnboarding: json['completedOnboarding'] as bool?,
      premiumGroupB: json['premiumGroupB'] as bool?,
      childCountSelection: json['childCountSelection'] as String?,
      childCount: json['childCount'] as int?,
      childBirthDates: (json['childBirthDates'] as List<dynamic>?)
          ?.map((e) => Map<String, dynamic>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$NewUserModelToJson(NewUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'location': instance.location,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'appRole': instance.appRole,
      'specialistRole': instance.specialistRole,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'birthday': instance.birthday,
      'genre': instance.genre,
      'updatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
      'lastAccessAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastAccessAt, const TimestampConverter().toJson),
      'lastAcceptedCommunityRules': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastAcceptedCommunityRules,
          const TimestampConverter().toJson),
      'motherMonths': instance.motherMonths,
      'pregnantWeeks': instance.pregnantWeeks,
      'profileMoment': instance.profileMoment,
      'profileMotherExperience': instance.profileMotherExperience,
      'profilePsychologicalTherapy': instance.profilePsychologicalTherapy,
      'profileSupportGroup': instance.profileSupportGroup,
      'profileHelp': instance.profileHelp,
      'profileContentType': instance.profileContentType,
      'profileEmotions': instance.profileEmotions,
      'lastPeriod': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastPeriod, const TimestampConverter().toJson),
      'childBirthDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.childBirthDate, const TimestampConverter().toJson),
      'completedOnboarding': instance.completedOnboarding,
      'premiumGroupB': instance.premiumGroupB,
      'childCountSelection': instance.childCountSelection,
      'childCount': instance.childCount,
      'childBirthDates': instance.childBirthDates,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
