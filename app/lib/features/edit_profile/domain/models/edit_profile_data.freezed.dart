// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditProfileData _$EditProfileDataFromJson(Map<String, dynamic> json) {
  return _EditProfileData.fromJson(json);
}

/// @nodoc
mixin _$EditProfileData {
  String? get name => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  DateTime? get lastPeriod => throw _privateConstructorUsedError;
  String? get profileMoment => throw _privateConstructorUsedError;
  DateTime? get childBirthDate => throw _privateConstructorUsedError;
  Genre? get genre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditProfileDataCopyWith<EditProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileDataCopyWith<$Res> {
  factory $EditProfileDataCopyWith(
          EditProfileData value, $Res Function(EditProfileData) then) =
      _$EditProfileDataCopyWithImpl<$Res, EditProfileData>;
  @useResult
  $Res call(
      {String? name,
      String? birthday,
      String? location,
      DateTime? lastPeriod,
      String? profileMoment,
      DateTime? childBirthDate,
      Genre? genre});
}

/// @nodoc
class _$EditProfileDataCopyWithImpl<$Res, $Val extends EditProfileData>
    implements $EditProfileDataCopyWith<$Res> {
  _$EditProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthday = freezed,
    Object? location = freezed,
    Object? lastPeriod = freezed,
    Object? profileMoment = freezed,
    Object? childBirthDate = freezed,
    Object? genre = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPeriod: freezed == lastPeriod
          ? _value.lastPeriod
          : lastPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileMoment: freezed == profileMoment
          ? _value.profileMoment
          : profileMoment // ignore: cast_nullable_to_non_nullable
              as String?,
      childBirthDate: freezed == childBirthDate
          ? _value.childBirthDate
          : childBirthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditProfileDataCopyWith<$Res>
    implements $EditProfileDataCopyWith<$Res> {
  factory _$$_EditProfileDataCopyWith(
          _$_EditProfileData value, $Res Function(_$_EditProfileData) then) =
      __$$_EditProfileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? birthday,
      String? location,
      DateTime? lastPeriod,
      String? profileMoment,
      DateTime? childBirthDate,
      Genre? genre});
}

/// @nodoc
class __$$_EditProfileDataCopyWithImpl<$Res>
    extends _$EditProfileDataCopyWithImpl<$Res, _$_EditProfileData>
    implements _$$_EditProfileDataCopyWith<$Res> {
  __$$_EditProfileDataCopyWithImpl(
      _$_EditProfileData _value, $Res Function(_$_EditProfileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthday = freezed,
    Object? location = freezed,
    Object? lastPeriod = freezed,
    Object? profileMoment = freezed,
    Object? childBirthDate = freezed,
    Object? genre = freezed,
  }) {
    return _then(_$_EditProfileData(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPeriod: freezed == lastPeriod
          ? _value.lastPeriod
          : lastPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileMoment: freezed == profileMoment
          ? _value.profileMoment
          : profileMoment // ignore: cast_nullable_to_non_nullable
              as String?,
      childBirthDate: freezed == childBirthDate
          ? _value.childBirthDate
          : childBirthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditProfileData implements _EditProfileData {
  const _$_EditProfileData(
      {this.name,
      this.birthday,
      this.location,
      this.lastPeriod,
      this.profileMoment,
      this.childBirthDate,
      this.genre});

  factory _$_EditProfileData.fromJson(Map<String, dynamic> json) =>
      _$$_EditProfileDataFromJson(json);

  @override
  final String? name;
  @override
  final String? birthday;
  @override
  final String? location;
  @override
  final DateTime? lastPeriod;
  @override
  final String? profileMoment;
  @override
  final DateTime? childBirthDate;
  @override
  final Genre? genre;

  @override
  String toString() {
    return 'EditProfileData(name: $name, birthday: $birthday, location: $location, lastPeriod: $lastPeriod, profileMoment: $profileMoment, childBirthDate: $childBirthDate, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.lastPeriod, lastPeriod) ||
                other.lastPeriod == lastPeriod) &&
            (identical(other.profileMoment, profileMoment) ||
                other.profileMoment == profileMoment) &&
            (identical(other.childBirthDate, childBirthDate) ||
                other.childBirthDate == childBirthDate) &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, birthday, location,
      lastPeriod, profileMoment, childBirthDate, genre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileDataCopyWith<_$_EditProfileData> get copyWith =>
      __$$_EditProfileDataCopyWithImpl<_$_EditProfileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditProfileDataToJson(
      this,
    );
  }
}

abstract class _EditProfileData implements EditProfileData {
  const factory _EditProfileData(
      {final String? name,
      final String? birthday,
      final String? location,
      final DateTime? lastPeriod,
      final String? profileMoment,
      final DateTime? childBirthDate,
      final Genre? genre}) = _$_EditProfileData;

  factory _EditProfileData.fromJson(Map<String, dynamic> json) =
      _$_EditProfileData.fromJson;

  @override
  String? get name;
  @override
  String? get birthday;
  @override
  String? get location;
  @override
  DateTime? get lastPeriod;
  @override
  String? get profileMoment;
  @override
  DateTime? get childBirthDate;
  @override
  Genre? get genre;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileDataCopyWith<_$_EditProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}
