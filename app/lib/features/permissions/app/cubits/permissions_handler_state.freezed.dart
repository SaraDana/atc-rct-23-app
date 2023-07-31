// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_handler_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PermissionsHandlerState {
  bool get isNotificationsAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionsHandlerStateCopyWith<PermissionsHandlerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsHandlerStateCopyWith<$Res> {
  factory $PermissionsHandlerStateCopyWith(PermissionsHandlerState value,
          $Res Function(PermissionsHandlerState) then) =
      _$PermissionsHandlerStateCopyWithImpl<$Res, PermissionsHandlerState>;
  @useResult
  $Res call({bool isNotificationsAllowed});
}

/// @nodoc
class _$PermissionsHandlerStateCopyWithImpl<$Res,
        $Val extends PermissionsHandlerState>
    implements $PermissionsHandlerStateCopyWith<$Res> {
  _$PermissionsHandlerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotificationsAllowed = null,
  }) {
    return _then(_value.copyWith(
      isNotificationsAllowed: null == isNotificationsAllowed
          ? _value.isNotificationsAllowed
          : isNotificationsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PermissionsHandlerStateCopyWith<$Res>
    implements $PermissionsHandlerStateCopyWith<$Res> {
  factory _$$_PermissionsHandlerStateCopyWith(_$_PermissionsHandlerState value,
          $Res Function(_$_PermissionsHandlerState) then) =
      __$$_PermissionsHandlerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isNotificationsAllowed});
}

/// @nodoc
class __$$_PermissionsHandlerStateCopyWithImpl<$Res>
    extends _$PermissionsHandlerStateCopyWithImpl<$Res,
        _$_PermissionsHandlerState>
    implements _$$_PermissionsHandlerStateCopyWith<$Res> {
  __$$_PermissionsHandlerStateCopyWithImpl(_$_PermissionsHandlerState _value,
      $Res Function(_$_PermissionsHandlerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotificationsAllowed = null,
  }) {
    return _then(_$_PermissionsHandlerState(
      isNotificationsAllowed: null == isNotificationsAllowed
          ? _value.isNotificationsAllowed
          : isNotificationsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PermissionsHandlerState implements _PermissionsHandlerState {
  const _$_PermissionsHandlerState({this.isNotificationsAllowed = false});

  @override
  @JsonKey()
  final bool isNotificationsAllowed;

  @override
  String toString() {
    return 'PermissionsHandlerState(isNotificationsAllowed: $isNotificationsAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PermissionsHandlerState &&
            (identical(other.isNotificationsAllowed, isNotificationsAllowed) ||
                other.isNotificationsAllowed == isNotificationsAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNotificationsAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionsHandlerStateCopyWith<_$_PermissionsHandlerState>
      get copyWith =>
          __$$_PermissionsHandlerStateCopyWithImpl<_$_PermissionsHandlerState>(
              this, _$identity);
}

abstract class _PermissionsHandlerState implements PermissionsHandlerState {
  const factory _PermissionsHandlerState({final bool isNotificationsAllowed}) =
      _$_PermissionsHandlerState;

  @override
  bool get isNotificationsAllowed;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionsHandlerStateCopyWith<_$_PermissionsHandlerState>
      get copyWith => throw _privateConstructorUsedError;
}
