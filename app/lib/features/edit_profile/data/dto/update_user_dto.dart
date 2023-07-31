// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_dto.freezed.dart';

@freezed
class UpdateUserDTO with _$UpdateUserDTO {
  const UpdateUserDTO._();
  const factory UpdateUserDTO(
      {String? name,
      String? birthday,
      String? location,
      DateTime? lastPeriod,
      String? profileMoment,
      DateTime? childBirthDate,
      dynamic updatedAt,
      String? genre}) = _UpdateUserDTO;

   Map<String, dynamic> toJson(UpdateUserDTO instance) =>
      <String, dynamic>{
        'name': instance.name,
        'birthday': instance.birthday,
        'location': instance.location,
        'lastPeriod': instance.lastPeriod,
        'profileMoment': instance.profileMoment,
        'childBirthDate': instance.childBirthDate,
        'updatedAt': instance.updatedAt,
        'genre': instance.genre,
      };
}

