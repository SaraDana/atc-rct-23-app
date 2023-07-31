// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  EmailForm get email => throw _privateConstructorUsedError;
  PasswordForm get password => throw _privateConstructorUsedError;
  ConfirmedPasswordForm get passwordRepeat =>
      throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  CheckboxConfirmationForm get acceptTerms =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {EmailForm email,
      PasswordForm password,
      ConfirmedPasswordForm passwordRepeat,
      FormzStatus status,
      CheckboxConfirmationForm acceptTerms,
      String? errorMessage});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordRepeat = null,
    Object? status = null,
    Object? acceptTerms = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailForm,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordForm,
      passwordRepeat: null == passwordRepeat
          ? _value.passwordRepeat
          : passwordRepeat // ignore: cast_nullable_to_non_nullable
              as ConfirmedPasswordForm,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as CheckboxConfirmationForm,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailForm email,
      PasswordForm password,
      ConfirmedPasswordForm passwordRepeat,
      FormzStatus status,
      CheckboxConfirmationForm acceptTerms,
      String? errorMessage});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordRepeat = null,
    Object? status = null,
    Object? acceptTerms = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_Initial(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailForm,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordForm,
      passwordRepeat: null == passwordRepeat
          ? _value.passwordRepeat
          : passwordRepeat // ignore: cast_nullable_to_non_nullable
              as ConfirmedPasswordForm,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as CheckboxConfirmationForm,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.email = const EmailForm.pure(),
      this.password = const PasswordForm.pure(),
      this.passwordRepeat = const ConfirmedPasswordForm.pure(),
      this.status = FormzStatus.pure,
      this.acceptTerms = const CheckboxConfirmationForm.pure(),
      this.errorMessage});

  @override
  @JsonKey()
  final EmailForm email;
  @override
  @JsonKey()
  final PasswordForm password;
  @override
  @JsonKey()
  final ConfirmedPasswordForm passwordRepeat;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final CheckboxConfirmationForm acceptTerms;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignUpState(email: $email, password: $password, passwordRepeat: $passwordRepeat, status: $status, acceptTerms: $acceptTerms, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordRepeat, passwordRepeat) ||
                other.passwordRepeat == passwordRepeat) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.acceptTerms, acceptTerms) ||
                other.acceptTerms == acceptTerms) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, passwordRepeat,
      status, acceptTerms, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements SignUpState {
  const factory _Initial(
      {final EmailForm email,
      final PasswordForm password,
      final ConfirmedPasswordForm passwordRepeat,
      final FormzStatus status,
      final CheckboxConfirmationForm acceptTerms,
      final String? errorMessage}) = _$_Initial;

  @override
  EmailForm get email;
  @override
  PasswordForm get password;
  @override
  ConfirmedPasswordForm get passwordRepeat;
  @override
  FormzStatus get status;
  @override
  CheckboxConfirmationForm get acceptTerms;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
