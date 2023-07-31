// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgramState {
  StatusCubit get status => throw _privateConstructorUsedError;
  StatusProgram get statusProgram => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Program? get program => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<Unit>? get units => throw _privateConstructorUsedError;
  List<UserUnits>? get userUnits => throw _privateConstructorUsedError;
  int? get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgramStateCopyWith<ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramStateCopyWith<$Res> {
  factory $ProgramStateCopyWith(
          ProgramState value, $Res Function(ProgramState) then) =
      _$ProgramStateCopyWithImpl<$Res, ProgramState>;
  @useResult
  $Res call(
      {StatusCubit status,
      StatusProgram statusProgram,
      String? errorMessage,
      Program? program,
      String? imageUrl,
      List<Unit>? units,
      List<UserUnits>? userUnits,
      int? rate});
}

/// @nodoc
class _$ProgramStateCopyWithImpl<$Res, $Val extends ProgramState>
    implements $ProgramStateCopyWith<$Res> {
  _$ProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusProgram = null,
    Object? errorMessage = freezed,
    Object? program = freezed,
    Object? imageUrl = freezed,
    Object? units = freezed,
    Object? userUnits = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      statusProgram: null == statusProgram
          ? _value.statusProgram
          : statusProgram // ignore: cast_nullable_to_non_nullable
              as StatusProgram,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as Program?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      units: freezed == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
      userUnits: freezed == userUnits
          ? _value.userUnits
          : userUnits // ignore: cast_nullable_to_non_nullable
              as List<UserUnits>?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgramStateCopyWith<$Res>
    implements $ProgramStateCopyWith<$Res> {
  factory _$$_ProgramStateCopyWith(
          _$_ProgramState value, $Res Function(_$_ProgramState) then) =
      __$$_ProgramStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      StatusProgram statusProgram,
      String? errorMessage,
      Program? program,
      String? imageUrl,
      List<Unit>? units,
      List<UserUnits>? userUnits,
      int? rate});
}

/// @nodoc
class __$$_ProgramStateCopyWithImpl<$Res>
    extends _$ProgramStateCopyWithImpl<$Res, _$_ProgramState>
    implements _$$_ProgramStateCopyWith<$Res> {
  __$$_ProgramStateCopyWithImpl(
      _$_ProgramState _value, $Res Function(_$_ProgramState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusProgram = null,
    Object? errorMessage = freezed,
    Object? program = freezed,
    Object? imageUrl = freezed,
    Object? units = freezed,
    Object? userUnits = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_ProgramState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      statusProgram: null == statusProgram
          ? _value.statusProgram
          : statusProgram // ignore: cast_nullable_to_non_nullable
              as StatusProgram,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as Program?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      units: freezed == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
      userUnits: freezed == userUnits
          ? _value._userUnits
          : userUnits // ignore: cast_nullable_to_non_nullable
              as List<UserUnits>?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ProgramState implements _ProgramState {
  const _$_ProgramState(
      {this.status = StatusCubit.INITIAL,
      this.statusProgram = StatusProgram.INITIAL,
      this.errorMessage,
      this.program,
      this.imageUrl,
      final List<Unit>? units,
      final List<UserUnits>? userUnits,
      this.rate})
      : _units = units,
        _userUnits = userUnits;

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  @JsonKey()
  final StatusProgram statusProgram;
  @override
  final String? errorMessage;
  @override
  final Program? program;
  @override
  final String? imageUrl;
  final List<Unit>? _units;
  @override
  List<Unit>? get units {
    final value = _units;
    if (value == null) return null;
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserUnits>? _userUnits;
  @override
  List<UserUnits>? get userUnits {
    final value = _userUnits;
    if (value == null) return null;
    if (_userUnits is EqualUnmodifiableListView) return _userUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? rate;

  @override
  String toString() {
    return 'ProgramState(status: $status, statusProgram: $statusProgram, errorMessage: $errorMessage, program: $program, imageUrl: $imageUrl, units: $units, userUnits: $userUnits, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusProgram, statusProgram) ||
                other.statusProgram == statusProgram) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            const DeepCollectionEquality()
                .equals(other._userUnits, _userUnits) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusProgram,
      errorMessage,
      program,
      imageUrl,
      const DeepCollectionEquality().hash(_units),
      const DeepCollectionEquality().hash(_userUnits),
      rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramStateCopyWith<_$_ProgramState> get copyWith =>
      __$$_ProgramStateCopyWithImpl<_$_ProgramState>(this, _$identity);
}

abstract class _ProgramState implements ProgramState {
  const factory _ProgramState(
      {final StatusCubit status,
      final StatusProgram statusProgram,
      final String? errorMessage,
      final Program? program,
      final String? imageUrl,
      final List<Unit>? units,
      final List<UserUnits>? userUnits,
      final int? rate}) = _$_ProgramState;

  @override
  StatusCubit get status;
  @override
  StatusProgram get statusProgram;
  @override
  String? get errorMessage;
  @override
  Program? get program;
  @override
  String? get imageUrl;
  @override
  List<Unit>? get units;
  @override
  List<UserUnits>? get userUnits;
  @override
  int? get rate;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramStateCopyWith<_$_ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}
