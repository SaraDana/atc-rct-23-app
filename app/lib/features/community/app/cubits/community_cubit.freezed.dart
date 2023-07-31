// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommunityState {
  List<Filter> get filters => throw _privateConstructorUsedError;
  String? get tagSelected => throw _privateConstructorUsedError;
  SocialConfig? get socialConfig => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommunityStateCopyWith<CommunityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityStateCopyWith<$Res> {
  factory $CommunityStateCopyWith(
          CommunityState value, $Res Function(CommunityState) then) =
      _$CommunityStateCopyWithImpl<$Res, CommunityState>;
  @useResult
  $Res call(
      {List<Filter> filters, String? tagSelected, SocialConfig? socialConfig});
}

/// @nodoc
class _$CommunityStateCopyWithImpl<$Res, $Val extends CommunityState>
    implements $CommunityStateCopyWith<$Res> {
  _$CommunityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? tagSelected = freezed,
    Object? socialConfig = freezed,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
      tagSelected: freezed == tagSelected
          ? _value.tagSelected
          : tagSelected // ignore: cast_nullable_to_non_nullable
              as String?,
      socialConfig: freezed == socialConfig
          ? _value.socialConfig
          : socialConfig // ignore: cast_nullable_to_non_nullable
              as SocialConfig?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $CommunityStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Filter> filters, String? tagSelected, SocialConfig? socialConfig});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CommunityStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? tagSelected = freezed,
    Object? socialConfig = freezed,
  }) {
    return _then(_$_Initial(
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
      tagSelected: freezed == tagSelected
          ? _value.tagSelected
          : tagSelected // ignore: cast_nullable_to_non_nullable
              as String?,
      socialConfig: freezed == socialConfig
          ? _value.socialConfig
          : socialConfig // ignore: cast_nullable_to_non_nullable
              as SocialConfig?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {final List<Filter> filters = const [],
      this.tagSelected,
      this.socialConfig})
      : _filters = filters;

  final List<Filter> _filters;
  @override
  @JsonKey()
  List<Filter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  final String? tagSelected;
  @override
  final SocialConfig? socialConfig;

  @override
  String toString() {
    return 'CommunityState(filters: $filters, tagSelected: $tagSelected, socialConfig: $socialConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.tagSelected, tagSelected) ||
                other.tagSelected == tagSelected) &&
            (identical(other.socialConfig, socialConfig) ||
                other.socialConfig == socialConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filters), tagSelected, socialConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CommunityState {
  const factory _Initial(
      {final List<Filter> filters,
      final String? tagSelected,
      final SocialConfig? socialConfig}) = _$_Initial;

  @override
  List<Filter> get filters;
  @override
  String? get tagSelected;
  @override
  SocialConfig? get socialConfig;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
