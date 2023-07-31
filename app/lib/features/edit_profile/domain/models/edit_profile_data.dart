// ignore_for_file: invalid_annotation_target

import 'package:app/features/user/domain/enums/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_data.freezed.dart';
part 'edit_profile_data.g.dart';

@freezed
class EditProfileData with _$EditProfileData {
  const factory EditProfileData(
      {String? name,
      String? birthday,
      String? location,
      DateTime? lastPeriod,
      String? profileMoment,
        DateTime? childBirthDate,
      Genre? genre}) = _EditProfileData;

  factory EditProfileData.fromJson(Map<String, dynamic> json) =>
      _$EditProfileDataFromJson(json);
}
