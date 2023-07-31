// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_units_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserUnitsState {
  StatusCubit get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<UserUnits> get units => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserUnitsStateCopyWith<UserUnitsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUnitsStateCopyWith<$Res> {
  factory $UserUnitsStateCopyWith(
          UserUnitsState value, $Res Function(UserUnitsState) then) =
      _$UserUnitsStateCopyWithImpl<$Res, UserUnitsState>;
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      List<UserUnits> units,
      bool isCompleted});
}

/// @nodoc
class _$UserUnitsStateCopyWithImpl<$Res, $Val extends UserUnitsState>
    implements $UserUnitsStateCopyWith<$Res> {
  _$UserUnitsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? units = null,
    Object? isCompleted = null,
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
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<UserUnits>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserUnitsStateCopyWith<$Res>
    implements $UserUnitsStateCopyWith<$Res> {
  factory _$$_UserUnitsStateCopyWith(
          _$_UserUnitsState value, $Res Function(_$_UserUnitsState) then) =
      __$$_UserUnitsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      List<UserUnits> units,
      bool isCompleted});
}

/// @nodoc
class __$$_UserUnitsStateCopyWithImpl<$Res>
    extends _$UserUnitsStateCopyWithImpl<$Res, _$_UserUnitsState>
    implements _$$_UserUnitsStateCopyWith<$Res> {
  __$$_UserUnitsStateCopyWithImpl(
      _$_UserUnitsState _value, $Res Function(_$_UserUnitsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? units = null,
    Object? isCompleted = null,
  }) {
    return _then(_$_UserUnitsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      units: null == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<UserUnits>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserUnitsState implements _UserUnitsState {
  const _$_UserUnitsState(
      {this.status = StatusCubit.INITIAL,
      this.errorMessage,
      final List<UserUnits> units = const [],
      this.isCompleted = false})
      : _units = units;

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  final String? errorMessage;
  final List<UserUnits> _units;
  @override
  @JsonKey()
  List<UserUnits> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'UserUnitsState(status: $status, errorMessage: $errorMessage, units: $units, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserUnitsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_units), isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserUnitsStateCopyWith<_$_UserUnitsState> get copyWith =>
      __$$_UserUnitsStateCopyWithImpl<_$_UserUnitsState>(this, _$identity);
}

abstract class _UserUnitsState implements UserUnitsState {
  const factory _UserUnitsState(
      {final StatusCubit status,
      final String? errorMessage,
      final List<UserUnits> units,
      final bool isCompleted}) = _$_UserUnitsState;

  @override
  StatusCubit get status;
  @override
  String? get errorMessage;
  @override
  List<UserUnits> get units;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_UserUnitsStateCopyWith<_$_UserUnitsState> get copyWith =>
      throw _privateConstructorUsedError;
}
