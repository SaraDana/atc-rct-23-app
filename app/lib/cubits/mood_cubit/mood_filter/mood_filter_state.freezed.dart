// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoodFilterState {
  FilterUserMood? get filterUserMood => throw _privateConstructorUsedError;
  GrapichType? get graphichType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodFilterStateCopyWith<MoodFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodFilterStateCopyWith<$Res> {
  factory $MoodFilterStateCopyWith(
          MoodFilterState value, $Res Function(MoodFilterState) then) =
      _$MoodFilterStateCopyWithImpl<$Res, MoodFilterState>;
  @useResult
  $Res call({FilterUserMood? filterUserMood, GrapichType? graphichType});
}

/// @nodoc
class _$MoodFilterStateCopyWithImpl<$Res, $Val extends MoodFilterState>
    implements $MoodFilterStateCopyWith<$Res> {
  _$MoodFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterUserMood = freezed,
    Object? graphichType = freezed,
  }) {
    return _then(_value.copyWith(
      filterUserMood: freezed == filterUserMood
          ? _value.filterUserMood
          : filterUserMood // ignore: cast_nullable_to_non_nullable
              as FilterUserMood?,
      graphichType: freezed == graphichType
          ? _value.graphichType
          : graphichType // ignore: cast_nullable_to_non_nullable
              as GrapichType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoodFilterStateCopyWith<$Res>
    implements $MoodFilterStateCopyWith<$Res> {
  factory _$$_MoodFilterStateCopyWith(
          _$_MoodFilterState value, $Res Function(_$_MoodFilterState) then) =
      __$$_MoodFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FilterUserMood? filterUserMood, GrapichType? graphichType});
}

/// @nodoc
class __$$_MoodFilterStateCopyWithImpl<$Res>
    extends _$MoodFilterStateCopyWithImpl<$Res, _$_MoodFilterState>
    implements _$$_MoodFilterStateCopyWith<$Res> {
  __$$_MoodFilterStateCopyWithImpl(
      _$_MoodFilterState _value, $Res Function(_$_MoodFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterUserMood = freezed,
    Object? graphichType = freezed,
  }) {
    return _then(_$_MoodFilterState(
      filterUserMood: freezed == filterUserMood
          ? _value.filterUserMood
          : filterUserMood // ignore: cast_nullable_to_non_nullable
              as FilterUserMood?,
      graphichType: freezed == graphichType
          ? _value.graphichType
          : graphichType // ignore: cast_nullable_to_non_nullable
              as GrapichType?,
    ));
  }
}

/// @nodoc

class _$_MoodFilterState implements _MoodFilterState {
  const _$_MoodFilterState({this.filterUserMood, this.graphichType});

  @override
  final FilterUserMood? filterUserMood;
  @override
  final GrapichType? graphichType;

  @override
  String toString() {
    return 'MoodFilterState(filterUserMood: $filterUserMood, graphichType: $graphichType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoodFilterState &&
            (identical(other.filterUserMood, filterUserMood) ||
                other.filterUserMood == filterUserMood) &&
            (identical(other.graphichType, graphichType) ||
                other.graphichType == graphichType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterUserMood, graphichType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoodFilterStateCopyWith<_$_MoodFilterState> get copyWith =>
      __$$_MoodFilterStateCopyWithImpl<_$_MoodFilterState>(this, _$identity);
}

abstract class _MoodFilterState implements MoodFilterState {
  const factory _MoodFilterState(
      {final FilterUserMood? filterUserMood,
      final GrapichType? graphichType}) = _$_MoodFilterState;

  @override
  FilterUserMood? get filterUserMood;
  @override
  GrapichType? get graphichType;
  @override
  @JsonKey(ignore: true)
  _$$_MoodFilterStateCopyWith<_$_MoodFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
