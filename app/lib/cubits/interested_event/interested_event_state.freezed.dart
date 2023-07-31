// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interested_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InterstedEventState {
  StatusCubit get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterstedEventStateCopyWith<InterstedEventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterstedEventStateCopyWith<$Res> {
  factory $InterstedEventStateCopyWith(
          InterstedEventState value, $Res Function(InterstedEventState) then) =
      _$InterstedEventStateCopyWithImpl<$Res, InterstedEventState>;
  @useResult
  $Res call({StatusCubit status});
}

/// @nodoc
class _$InterstedEventStateCopyWithImpl<$Res, $Val extends InterstedEventState>
    implements $InterstedEventStateCopyWith<$Res> {
  _$InterstedEventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InterstedEventStateCopyWith<$Res>
    implements $InterstedEventStateCopyWith<$Res> {
  factory _$$_InterstedEventStateCopyWith(_$_InterstedEventState value,
          $Res Function(_$_InterstedEventState) then) =
      __$$_InterstedEventStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StatusCubit status});
}

/// @nodoc
class __$$_InterstedEventStateCopyWithImpl<$Res>
    extends _$InterstedEventStateCopyWithImpl<$Res, _$_InterstedEventState>
    implements _$$_InterstedEventStateCopyWith<$Res> {
  __$$_InterstedEventStateCopyWithImpl(_$_InterstedEventState _value,
      $Res Function(_$_InterstedEventState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_InterstedEventState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
    ));
  }
}

/// @nodoc

class _$_InterstedEventState implements _InterstedEventState {
  const _$_InterstedEventState({this.status = StatusCubit.INITIAL});

  @override
  @JsonKey()
  final StatusCubit status;

  @override
  String toString() {
    return 'InterstedEventState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InterstedEventState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InterstedEventStateCopyWith<_$_InterstedEventState> get copyWith =>
      __$$_InterstedEventStateCopyWithImpl<_$_InterstedEventState>(
          this, _$identity);
}

abstract class _InterstedEventState implements InterstedEventState {
  const factory _InterstedEventState({final StatusCubit status}) =
      _$_InterstedEventState;

  @override
  StatusCubit get status;
  @override
  @JsonKey(ignore: true)
  _$$_InterstedEventStateCopyWith<_$_InterstedEventState> get copyWith =>
      throw _privateConstructorUsedError;
}
