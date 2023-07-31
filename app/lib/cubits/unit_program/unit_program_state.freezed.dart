// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnitProgramState {
  StatusCubit get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Unit? get unit => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnitProgramStateCopyWith<UnitProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitProgramStateCopyWith<$Res> {
  factory $UnitProgramStateCopyWith(
          UnitProgramState value, $Res Function(UnitProgramState) then) =
      _$UnitProgramStateCopyWithImpl<$Res, UnitProgramState>;
  @useResult
  $Res call(
      {StatusCubit status, String? errorMessage, Unit? unit, bool isRead});
}

/// @nodoc
class _$UnitProgramStateCopyWithImpl<$Res, $Val extends UnitProgramState>
    implements $UnitProgramStateCopyWith<$Res> {
  _$UnitProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? unit = freezed,
    Object? isRead = null,
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
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnitProgramStateCopyWith<$Res>
    implements $UnitProgramStateCopyWith<$Res> {
  factory _$$_UnitProgramStateCopyWith(
          _$_UnitProgramState value, $Res Function(_$_UnitProgramState) then) =
      __$$_UnitProgramStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status, String? errorMessage, Unit? unit, bool isRead});
}

/// @nodoc
class __$$_UnitProgramStateCopyWithImpl<$Res>
    extends _$UnitProgramStateCopyWithImpl<$Res, _$_UnitProgramState>
    implements _$$_UnitProgramStateCopyWith<$Res> {
  __$$_UnitProgramStateCopyWithImpl(
      _$_UnitProgramState _value, $Res Function(_$_UnitProgramState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? unit = freezed,
    Object? isRead = null,
  }) {
    return _then(_$_UnitProgramState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UnitProgramState implements _UnitProgramState {
  const _$_UnitProgramState(
      {this.status = StatusCubit.INITIAL,
      this.errorMessage,
      this.unit,
      this.isRead = true});

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  final String? errorMessage;
  @override
  final Unit? unit;
  @override
  @JsonKey()
  final bool isRead;

  @override
  String toString() {
    return 'UnitProgramState(status: $status, errorMessage: $errorMessage, unit: $unit, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitProgramState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, unit, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnitProgramStateCopyWith<_$_UnitProgramState> get copyWith =>
      __$$_UnitProgramStateCopyWithImpl<_$_UnitProgramState>(this, _$identity);
}

abstract class _UnitProgramState implements UnitProgramState {
  const factory _UnitProgramState(
      {final StatusCubit status,
      final String? errorMessage,
      final Unit? unit,
      final bool isRead}) = _$_UnitProgramState;

  @override
  StatusCubit get status;
  @override
  String? get errorMessage;
  @override
  Unit? get unit;
  @override
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  _$$_UnitProgramStateCopyWith<_$_UnitProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}
