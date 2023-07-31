// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseCopyWith<$Res> {
  factory _$$EmailAlreadyInUseCopyWith(
          _$EmailAlreadyInUse value, $Res Function(_$EmailAlreadyInUse) then) =
      __$$EmailAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$EmailAlreadyInUse>
    implements _$$EmailAlreadyInUseCopyWith<$Res> {
  __$$EmailAlreadyInUseCopyWithImpl(
      _$EmailAlreadyInUse _value, $Res Function(_$EmailAlreadyInUse) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'AppException.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AppException {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}

/// @nodoc
abstract class _$$WeakPasswordCopyWith<$Res> {
  factory _$$WeakPasswordCopyWith(
          _$WeakPassword value, $Res Function(_$WeakPassword) then) =
      __$$WeakPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeakPasswordCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$WeakPassword>
    implements _$$WeakPasswordCopyWith<$Res> {
  __$$WeakPasswordCopyWithImpl(
      _$WeakPassword _value, $Res Function(_$WeakPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WeakPassword implements WeakPassword {
  const _$WeakPassword();

  @override
  String toString() {
    return 'AppException.weakPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeakPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) {
    return weakPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) {
    return weakPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) {
    return weakPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) {
    return weakPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword(this);
    }
    return orElse();
  }
}

abstract class WeakPassword implements AppException {
  const factory WeakPassword() = _$WeakPassword;
}

/// @nodoc
abstract class _$$WrongPasswordCopyWith<$Res> {
  factory _$$WrongPasswordCopyWith(
          _$WrongPassword value, $Res Function(_$WrongPassword) then) =
      __$$WrongPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongPasswordCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$WrongPassword>
    implements _$$WrongPasswordCopyWith<$Res> {
  __$$WrongPasswordCopyWithImpl(
      _$WrongPassword _value, $Res Function(_$WrongPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WrongPassword implements WrongPassword {
  const _$WrongPassword();

  @override
  String toString() {
    return 'AppException.wrongPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) {
    return wrongPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) {
    return wrongPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) {
    return wrongPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) {
    return wrongPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(this);
    }
    return orElse();
  }
}

abstract class WrongPassword implements AppException {
  const factory WrongPassword() = _$WrongPassword;
}

/// @nodoc
abstract class _$$UserNotFoundCopyWith<$Res> {
  factory _$$UserNotFoundCopyWith(
          _$UserNotFound value, $Res Function(_$UserNotFound) then) =
      __$$UserNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UserNotFound>
    implements _$$UserNotFoundCopyWith<$Res> {
  __$$UserNotFoundCopyWithImpl(
      _$UserNotFound _value, $Res Function(_$UserNotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotFound implements UserNotFound {
  const _$UserNotFound();

  @override
  String toString() {
    return 'AppException.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) {
    return userNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class UserNotFound implements AppException {
  const factory UserNotFound() = _$UserNotFound;
}

/// @nodoc
abstract class _$$InvalidCredentialCopyWith<$Res> {
  factory _$$InvalidCredentialCopyWith(
          _$InvalidCredential value, $Res Function(_$InvalidCredential) then) =
      __$$InvalidCredentialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidCredentialCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$InvalidCredential>
    implements _$$InvalidCredentialCopyWith<$Res> {
  __$$InvalidCredentialCopyWithImpl(
      _$InvalidCredential _value, $Res Function(_$InvalidCredential) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidCredential implements InvalidCredential {
  const _$InvalidCredential();

  @override
  String toString() {
    return 'AppException.invalidCredential()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidCredential);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) {
    return invalidCredential();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) {
    return invalidCredential?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (invalidCredential != null) {
      return invalidCredential();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) {
    return invalidCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) {
    return invalidCredential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidCredential != null) {
      return invalidCredential(this);
    }
    return orElse();
  }
}

abstract class InvalidCredential implements AppException {
  const factory InvalidCredential() = _$InvalidCredential;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$Unknown>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'AppException.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? wrongPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? invalidCredential,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult? Function(WeakPassword value)? weakPassword,
    TResult? Function(WrongPassword value)? wrongPassword,
    TResult? Function(UserNotFound value)? userNotFound,
    TResult? Function(InvalidCredential value)? invalidCredential,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements AppException {
  const factory Unknown() = _$Unknown;
}
