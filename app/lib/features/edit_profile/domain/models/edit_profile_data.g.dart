// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditProfileData _$$_EditProfileDataFromJson(Map<String, dynamic> json) =>
    _$_EditProfileData(
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      location: json['location'] as String?,
      lastPeriod: json['lastPeriod'] == null
          ? null
          : DateTime.parse(json['lastPeriod'] as String),
      profileMoment: json['profileMoment'] as String?,
      childBirthDate: json['childBirthDate'] == null
          ? null
          : DateTime.parse(json['childBirthDate'] as String),
      genre: $enumDecodeNullable(_$GenreEnumMap, json['genre']),
    );

Map<String, dynamic> _$$_EditProfileDataToJson(_$_EditProfileData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthday': instance.birthday,
      'location': instance.location,
      'lastPeriod': instance.lastPeriod?.toIso8601String(),
      'profileMoment': instance.profileMoment,
      'childBirthDate': instance.childBirthDate?.toIso8601String(),
      'genre': _$GenreEnumMap[instance.genre],
    };

const _$GenreEnumMap = {
  Genre.MAN: 'MAN',
  Genre.WOMAN: 'WOMAN',
  Genre.NO_BINARY: 'NO_BINARY',
  Genre.NO_ANSWER: 'NO_ANSWER',
};
