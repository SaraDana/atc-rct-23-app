// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collections_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CollectionsState {
  StatusCubit get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<CollectionModel>? get collections => throw _privateConstructorUsedError;
  String? get tagSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollectionsStateCopyWith<CollectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionsStateCopyWith<$Res> {
  factory $CollectionsStateCopyWith(
          CollectionsState value, $Res Function(CollectionsState) then) =
      _$CollectionsStateCopyWithImpl<$Res, CollectionsState>;
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      List<CollectionModel>? collections,
      String? tagSelected});
}

/// @nodoc
class _$CollectionsStateCopyWithImpl<$Res, $Val extends CollectionsState>
    implements $CollectionsStateCopyWith<$Res> {
  _$CollectionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? collections = freezed,
    Object? tagSelected = freezed,
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
      collections: freezed == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>?,
      tagSelected: freezed == tagSelected
          ? _value.tagSelected
          : tagSelected // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CollectionsStateCopyWith<$Res>
    implements $CollectionsStateCopyWith<$Res> {
  factory _$$_CollectionsStateCopyWith(
          _$_CollectionsState value, $Res Function(_$_CollectionsState) then) =
      __$$_CollectionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      List<CollectionModel>? collections,
      String? tagSelected});
}

/// @nodoc
class __$$_CollectionsStateCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res, _$_CollectionsState>
    implements _$$_CollectionsStateCopyWith<$Res> {
  __$$_CollectionsStateCopyWithImpl(
      _$_CollectionsState _value, $Res Function(_$_CollectionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? collections = freezed,
    Object? tagSelected = freezed,
  }) {
    return _then(_$_CollectionsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      collections: freezed == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>?,
      tagSelected: freezed == tagSelected
          ? _value.tagSelected
          : tagSelected // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CollectionsState implements _CollectionsState {
  const _$_CollectionsState(
      {this.status = StatusCubit.INITIAL,
      this.errorMessage,
      final List<CollectionModel>? collections,
      this.tagSelected})
      : _collections = collections;

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  final String? errorMessage;
  final List<CollectionModel>? _collections;
  @override
  List<CollectionModel>? get collections {
    final value = _collections;
    if (value == null) return null;
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tagSelected;

  @override
  String toString() {
    return 'CollectionsState(status: $status, errorMessage: $errorMessage, collections: $collections, tagSelected: $tagSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollectionsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.tagSelected, tagSelected) ||
                other.tagSelected == tagSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_collections), tagSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectionsStateCopyWith<_$_CollectionsState> get copyWith =>
      __$$_CollectionsStateCopyWithImpl<_$_CollectionsState>(this, _$identity);
}

abstract class _CollectionsState implements CollectionsState {
  const factory _CollectionsState(
      {final StatusCubit status,
      final String? errorMessage,
      final List<CollectionModel>? collections,
      final String? tagSelected}) = _$_CollectionsState;

  @override
  StatusCubit get status;
  @override
  String? get errorMessage;
  @override
  List<CollectionModel>? get collections;
  @override
  String? get tagSelected;
  @override
  @JsonKey(ignore: true)
  _$$_CollectionsStateCopyWith<_$_CollectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
