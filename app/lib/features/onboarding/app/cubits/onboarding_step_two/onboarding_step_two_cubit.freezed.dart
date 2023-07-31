// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_two_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStepTwoState {
  FormzStatus get formzStatus => throw _privateConstructorUsedError;
  BirthDateForm get birthdate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepTwoStateCopyWith<OnboardingStepTwoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepTwoStateCopyWith<$Res> {
  factory $OnboardingStepTwoStateCopyWith(OnboardingStepTwoState value,
          $Res Function(OnboardingStepTwoState) then) =
      _$OnboardingStepTwoStateCopyWithImpl<$Res, OnboardingStepTwoState>;
  @useResult
  $Res call({FormzStatus formzStatus, BirthDateForm birthdate});
}

/// @nodoc
class _$OnboardingStepTwoStateCopyWithImpl<$Res,
        $Val extends OnboardingStepTwoState>
    implements $OnboardingStepTwoStateCopyWith<$Res> {
  _$OnboardingStepTwoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? birthdate = null,
  }) {
    return _then(_value.copyWith(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStepTwoStateCopyWith<$Res>
    implements $OnboardingStepTwoStateCopyWith<$Res> {
  factory _$$_OnboardingStepTwoStateCopyWith(_$_OnboardingStepTwoState value,
          $Res Function(_$_OnboardingStepTwoState) then) =
      __$$_OnboardingStepTwoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus formzStatus, BirthDateForm birthdate});
}

/// @nodoc
class __$$_OnboardingStepTwoStateCopyWithImpl<$Res>
    extends _$OnboardingStepTwoStateCopyWithImpl<$Res,
        _$_OnboardingStepTwoState>
    implements _$$_OnboardingStepTwoStateCopyWith<$Res> {
  __$$_OnboardingStepTwoStateCopyWithImpl(_$_OnboardingStepTwoState _value,
      $Res Function(_$_OnboardingStepTwoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? birthdate = null,
  }) {
    return _then(_$_OnboardingStepTwoState(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as BirthDateForm,
    ));
  }
}

/// @nodoc

class _$_OnboardingStepTwoState implements _OnboardingStepTwoState {
  const _$_OnboardingStepTwoState(
      {this.formzStatus = FormzStatus.pure,
      this.birthdate = const BirthDateForm.pure()});

  @override
  @JsonKey()
  final FormzStatus formzStatus;
  @override
  @JsonKey()
  final BirthDateForm birthdate;

  @override
  String toString() {
    return 'OnboardingStepTwoState(formzStatus: $formzStatus, birthdate: $birthdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingStepTwoState &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, birthdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStepTwoStateCopyWith<_$_OnboardingStepTwoState> get copyWith =>
      __$$_OnboardingStepTwoStateCopyWithImpl<_$_OnboardingStepTwoState>(
          this, _$identity);
}

abstract class _OnboardingStepTwoState implements OnboardingStepTwoState {
  const factory _OnboardingStepTwoState(
      {final FormzStatus formzStatus,
      final BirthDateForm birthdate}) = _$_OnboardingStepTwoState;

  @override
  FormzStatus get formzStatus;
  @override
  BirthDateForm get birthdate;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStepTwoStateCopyWith<_$_OnboardingStepTwoState> get copyWith =>
      throw _privateConstructorUsedError;
}
