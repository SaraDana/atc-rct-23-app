// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'footer_deeplink_unit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FooterDeeplinkUnitState {
  StatusCubit get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get deeplinkUrl => throw _privateConstructorUsedError;
  bool? get useful => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FooterDeeplinkUnitStateCopyWith<FooterDeeplinkUnitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FooterDeeplinkUnitStateCopyWith<$Res> {
  factory $FooterDeeplinkUnitStateCopyWith(FooterDeeplinkUnitState value,
          $Res Function(FooterDeeplinkUnitState) then) =
      _$FooterDeeplinkUnitStateCopyWithImpl<$Res, FooterDeeplinkUnitState>;
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      String? deeplinkUrl,
      bool? useful});
}

/// @nodoc
class _$FooterDeeplinkUnitStateCopyWithImpl<$Res,
        $Val extends FooterDeeplinkUnitState>
    implements $FooterDeeplinkUnitStateCopyWith<$Res> {
  _$FooterDeeplinkUnitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? deeplinkUrl = freezed,
    Object? useful = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      deeplinkUrl: freezed == deeplinkUrl
          ? _value.deeplinkUrl
          : deeplinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      useful: freezed == useful
          ? _value.useful
          : useful // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FooterDeeplinkUnitStateCopyWith<$Res>
    implements $FooterDeeplinkUnitStateCopyWith<$Res> {
  factory _$$_FooterDeeplinkUnitStateCopyWith(_$_FooterDeeplinkUnitState value,
          $Res Function(_$_FooterDeeplinkUnitState) then) =
      __$$_FooterDeeplinkUnitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      String? deeplinkUrl,
      bool? useful});
}

/// @nodoc
class __$$_FooterDeeplinkUnitStateCopyWithImpl<$Res>
    extends _$FooterDeeplinkUnitStateCopyWithImpl<$Res,
        _$_FooterDeeplinkUnitState>
    implements _$$_FooterDeeplinkUnitStateCopyWith<$Res> {
  __$$_FooterDeeplinkUnitStateCopyWithImpl(_$_FooterDeeplinkUnitState _value,
      $Res Function(_$_FooterDeeplinkUnitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? deeplinkUrl = freezed,
    Object? useful = freezed,
  }) {
    return _then(_$_FooterDeeplinkUnitState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      deeplinkUrl: freezed == deeplinkUrl
          ? _value.deeplinkUrl
          : deeplinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      useful: freezed == useful
          ? _value.useful
          : useful // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FooterDeeplinkUnitState implements _FooterDeeplinkUnitState {
  const _$_FooterDeeplinkUnitState(
      {this.status = StatusCubit.INITIAL,
      this.errorMessage,
      this.deeplinkUrl,
      this.useful});

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  final String? errorMessage;
  @override
  final String? deeplinkUrl;
  @override
  final bool? useful;

  @override
  String toString() {
    return 'FooterDeeplinkUnitState(status: $status, errorMessage: $errorMessage, deeplinkUrl: $deeplinkUrl, useful: $useful)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FooterDeeplinkUnitState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.deeplinkUrl, deeplinkUrl) ||
                other.deeplinkUrl == deeplinkUrl) &&
            (identical(other.useful, useful) || other.useful == useful));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, deeplinkUrl, useful);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FooterDeeplinkUnitStateCopyWith<_$_FooterDeeplinkUnitState>
      get copyWith =>
          __$$_FooterDeeplinkUnitStateCopyWithImpl<_$_FooterDeeplinkUnitState>(
              this, _$identity);
}

abstract class _FooterDeeplinkUnitState implements FooterDeeplinkUnitState {
  const factory _FooterDeeplinkUnitState(
      {final StatusCubit status,
      final String? errorMessage,
      final String? deeplinkUrl,
      final bool? useful}) = _$_FooterDeeplinkUnitState;

  @override
  StatusCubit get status;
  @override
  String? get errorMessage;
  @override
  String? get deeplinkUrl;
  @override
  bool? get useful;
  @override
  @JsonKey(ignore: true)
  _$$_FooterDeeplinkUnitStateCopyWith<_$_FooterDeeplinkUnitState>
      get copyWith => throw _privateConstructorUsedError;
}
