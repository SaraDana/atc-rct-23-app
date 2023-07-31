// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recover_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecoverPasswordState {
  EmailForm get email => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecoverPasswordStateCopyWith<RecoverPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoverPasswordStateCopyWith<$Res> {
  factory $RecoverPasswordStateCopyWith(RecoverPasswordState value,
          $Res Function(RecoverPasswordState) then) =
      _$RecoverPasswordStateCopyWithImpl<$Res, RecoverPasswordState>;
  @useResult
  $Res call({EmailForm email, FormzStatus status, String? errorMessage});
}

/// @nodoc
class _$RecoverPasswordStateCopyWithImpl<$Res,
        $Val extends RecoverPasswordState>
    implements $RecoverPasswordStateCopyWith<$Res> {
  _$RecoverPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailForm,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecoverPasswordStateCopyWith<$Res>
    implements $RecoverPasswordStateCopyWith<$Res> {
  factory _$$_RecoverPasswordStateCopyWith(_$_RecoverPasswordState value,
          $Res Function(_$_RecoverPasswordState) then) =
      __$$_RecoverPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EmailForm email, FormzStatus status, String? errorMessage});
}

/// @nodoc
class __$$_RecoverPasswordStateCopyWithImpl<$Res>
    extends _$RecoverPasswordStateCopyWithImpl<$Res, _$_RecoverPasswordState>
    implements _$$_RecoverPasswordStateCopyWith<$Res> {
  __$$_RecoverPasswordStateCopyWithImpl(_$_RecoverPasswordState _value,
      $Res Function(_$_RecoverPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_RecoverPasswordState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailForm,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RecoverPasswordState implements _RecoverPasswordState {
  const _$_RecoverPasswordState(
      {this.email = const EmailForm.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage});

  @override
  @JsonKey()
  final EmailForm email;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'RecoverPasswordState(email: $email, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecoverPasswordState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecoverPasswordStateCopyWith<_$_RecoverPasswordState> get copyWith =>
      __$$_RecoverPasswordStateCopyWithImpl<_$_RecoverPasswordState>(
          this, _$identity);
}

abstract class _RecoverPasswordState implements RecoverPasswordState {
  const factory _RecoverPasswordState(
      {final EmailForm email,
      final FormzStatus status,
      final String? errorMessage}) = _$_RecoverPasswordState;

  @override
  EmailForm get email;
  @override
  FormzStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_RecoverPasswordStateCopyWith<_$_RecoverPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
