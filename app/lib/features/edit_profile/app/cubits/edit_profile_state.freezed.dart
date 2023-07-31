// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileState {
  EditProfileData? get editProfileData => throw _privateConstructorUsedError;
  StatusCubit get status => throw _privateConstructorUsedError;
  FormzStatus get formzStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  BirthDateForm get birthdate => throw _privateConstructorUsedError;
  FirstNameForm get name => throw _privateConstructorUsedError;
  GenreForm get genre => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  int? get pregnantWeeks => throw _privateConstructorUsedError;
  int? get motherMonths => throw _privateConstructorUsedError;
  InitialProfileMoment? get profileMoment => throw _privateConstructorUsedError;
  bool get showPregnantWeeks => throw _privateConstructorUsedError;
  bool get showMotherMonths => throw _privateConstructorUsedError;
  BirthDateForm get lastPeriod => throw _privateConstructorUsedError;
  BirthDateForm get childBirthDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {EditProfileData? editProfileData,
      StatusCubit status,
      FormzStatus formzStatus,
      String? errorMessage,
      BirthDateForm birthdate,
      FirstNameForm name,
      GenreForm genre,
      String? city,
      int? pregnantWeeks,
      int? motherMonths,
      InitialProfileMoment? profileMoment,
      bool showPregnantWeeks,
      bool showMotherMonths,
      BirthDateForm lastPeriod,
      BirthDateForm childBirthDate});

  $EditProfileDataCopyWith<$Res>? get editProfileData;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editProfileData = freezed,
    Object? status = null,
    Object? formzStatus = null,
    Object? errorMessage = freezed,
    Object? birthdate = null,
    Object? name = null,
    Object? genre = null,
    Object? city = freezed,
    Object? pregnantWeeks = freezed,
    Object? motherMonths = freezed,
    Object? profileMoment = freezed,
    Object? showPregnantWeeks = null,
    Object? showMotherMonths = null,
    Object? lastPeriod = null,
    Object? childBirthDate = null,
  }) {
    return _then(_value.copyWith(
      editProfileData: freezed == editProfileData
          ? _value.editProfileData
          : editProfileData // ignore: cast_nullable_to_non_nullable
              as EditProfileData?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FirstNameForm,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as GenreForm,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      pregnantWeeks: freezed == pregnantWeeks
          ? _value.pregnantWeeks
          : pregnantWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      motherMonths: freezed == motherMonths
          ? _value.motherMonths
          : motherMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      profileMoment: freezed == profileMoment
          ? _value.profileMoment
          : profileMoment // ignore: cast_nullable_to_non_nullable
              as InitialProfileMoment?,
      showPregnantWeeks: null == showPregnantWeeks
          ? _value.showPregnantWeeks
          : showPregnantWeeks // ignore: cast_nullable_to_non_nullable
              as bool,
      showMotherMonths: null == showMotherMonths
          ? _value.showMotherMonths
          : showMotherMonths // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPeriod: null == lastPeriod
          ? _value.lastPeriod
          : lastPeriod // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
      childBirthDate: null == childBirthDate
          ? _value.childBirthDate
          : childBirthDate // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EditProfileDataCopyWith<$Res>? get editProfileData {
    if (_value.editProfileData == null) {
      return null;
    }

    return $EditProfileDataCopyWith<$Res>(_value.editProfileData!, (value) {
      return _then(_value.copyWith(editProfileData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$_EditProfileStateCopyWith(
          _$_EditProfileState value, $Res Function(_$_EditProfileState) then) =
      __$$_EditProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EditProfileData? editProfileData,
      StatusCubit status,
      FormzStatus formzStatus,
      String? errorMessage,
      BirthDateForm birthdate,
      FirstNameForm name,
      GenreForm genre,
      String? city,
      int? pregnantWeeks,
      int? motherMonths,
      InitialProfileMoment? profileMoment,
      bool showPregnantWeeks,
      bool showMotherMonths,
      BirthDateForm lastPeriod,
      BirthDateForm childBirthDate});

  @override
  $EditProfileDataCopyWith<$Res>? get editProfileData;
}

/// @nodoc
class __$$_EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$_EditProfileState>
    implements _$$_EditProfileStateCopyWith<$Res> {
  __$$_EditProfileStateCopyWithImpl(
      _$_EditProfileState _value, $Res Function(_$_EditProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editProfileData = freezed,
    Object? status = null,
    Object? formzStatus = null,
    Object? errorMessage = freezed,
    Object? birthdate = null,
    Object? name = null,
    Object? genre = null,
    Object? city = freezed,
    Object? pregnantWeeks = freezed,
    Object? motherMonths = freezed,
    Object? profileMoment = freezed,
    Object? showPregnantWeeks = null,
    Object? showMotherMonths = null,
    Object? lastPeriod = null,
    Object? childBirthDate = null,
  }) {
    return _then(_$_EditProfileState(
      editProfileData: freezed == editProfileData
          ? _value.editProfileData
          : editProfileData // ignore: cast_nullable_to_non_nullable
              as EditProfileData?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FirstNameForm,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as GenreForm,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      pregnantWeeks: freezed == pregnantWeeks
          ? _value.pregnantWeeks
          : pregnantWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      motherMonths: freezed == motherMonths
          ? _value.motherMonths
          : motherMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      profileMoment: freezed == profileMoment
          ? _value.profileMoment
          : profileMoment // ignore: cast_nullable_to_non_nullable
              as InitialProfileMoment?,
      showPregnantWeeks: null == showPregnantWeeks
          ? _value.showPregnantWeeks
          : showPregnantWeeks // ignore: cast_nullable_to_non_nullable
              as bool,
      showMotherMonths: null == showMotherMonths
          ? _value.showMotherMonths
          : showMotherMonths // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPeriod: null == lastPeriod
          ? _value.lastPeriod
          : lastPeriod // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
      childBirthDate: null == childBirthDate
          ? _value.childBirthDate
          : childBirthDate // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
    ));
  }
}

/// @nodoc

class _$_EditProfileState implements _EditProfileState {
  const _$_EditProfileState(
      {this.editProfileData,
      this.status = StatusCubit.INITIAL,
      this.formzStatus = FormzStatus.pure,
      this.errorMessage,
      this.birthdate = const BirthDateForm.pure(),
      this.name = const FirstNameForm.pure(),
      this.genre = const GenreForm.pure(),
      this.city,
      this.pregnantWeeks,
      this.motherMonths,
      this.profileMoment,
      this.showPregnantWeeks = false,
      this.showMotherMonths = false,
      this.lastPeriod = const BirthDateForm.pure(),
      this.childBirthDate = const BirthDateForm.pure()});

  @override
  final EditProfileData? editProfileData;
  @override
  @JsonKey()
  final StatusCubit status;
  @override
  @JsonKey()
  final FormzStatus formzStatus;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final BirthDateForm birthdate;
  @override
  @JsonKey()
  final FirstNameForm name;
  @override
  @JsonKey()
  final GenreForm genre;
  @override
  final String? city;
  @override
  final int? pregnantWeeks;
  @override
  final int? motherMonths;
  @override
  final InitialProfileMoment? profileMoment;
  @override
  @JsonKey()
  final bool showPregnantWeeks;
  @override
  @JsonKey()
  final bool showMotherMonths;
  @override
  @JsonKey()
  final BirthDateForm lastPeriod;
  @override
  @JsonKey()
  final BirthDateForm childBirthDate;

  @override
  String toString() {
    return 'EditProfileState(editProfileData: $editProfileData, status: $status, formzStatus: $formzStatus, errorMessage: $errorMessage, birthdate: $birthdate, name: $name, genre: $genre, city: $city, pregnantWeeks: $pregnantWeeks, motherMonths: $motherMonths, profileMoment: $profileMoment, showPregnantWeeks: $showPregnantWeeks, showMotherMonths: $showMotherMonths, lastPeriod: $lastPeriod, childBirthDate: $childBirthDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileState &&
            (identical(other.editProfileData, editProfileData) ||
                other.editProfileData == editProfileData) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pregnantWeeks, pregnantWeeks) ||
                other.pregnantWeeks == pregnantWeeks) &&
            (identical(other.motherMonths, motherMonths) ||
                other.motherMonths == motherMonths) &&
            (identical(other.profileMoment, profileMoment) ||
                other.profileMoment == profileMoment) &&
            (identical(other.showPregnantWeeks, showPregnantWeeks) ||
                other.showPregnantWeeks == showPregnantWeeks) &&
            (identical(other.showMotherMonths, showMotherMonths) ||
                other.showMotherMonths == showMotherMonths) &&
            (identical(other.lastPeriod, lastPeriod) ||
                other.lastPeriod == lastPeriod) &&
            (identical(other.childBirthDate, childBirthDate) ||
                other.childBirthDate == childBirthDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      editProfileData,
      status,
      formzStatus,
      errorMessage,
      birthdate,
      name,
      genre,
      city,
      pregnantWeeks,
      motherMonths,
      profileMoment,
      showPregnantWeeks,
      showMotherMonths,
      lastPeriod,
      childBirthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      __$$_EditProfileStateCopyWithImpl<_$_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {final EditProfileData? editProfileData,
      final StatusCubit status,
      final FormzStatus formzStatus,
      final String? errorMessage,
      final BirthDateForm birthdate,
      final FirstNameForm name,
      final GenreForm genre,
      final String? city,
      final int? pregnantWeeks,
      final int? motherMonths,
      final InitialProfileMoment? profileMoment,
      final bool showPregnantWeeks,
      final bool showMotherMonths,
      final BirthDateForm lastPeriod,
      final BirthDateForm childBirthDate}) = _$_EditProfileState;

  @override
  EditProfileData? get editProfileData;
  @override
  StatusCubit get status;
  @override
  FormzStatus get formzStatus;
  @override
  String? get errorMessage;
  @override
  BirthDateForm get birthdate;
  @override
  FirstNameForm get name;
  @override
  GenreForm get genre;
  @override
  String? get city;
  @override
  int? get pregnantWeeks;
  @override
  int? get motherMonths;
  @override
  InitialProfileMoment? get profileMoment;
  @override
  bool get showPregnantWeeks;
  @override
  bool get showMotherMonths;
  @override
  BirthDateForm get lastPeriod;
  @override
  BirthDateForm get childBirthDate;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
