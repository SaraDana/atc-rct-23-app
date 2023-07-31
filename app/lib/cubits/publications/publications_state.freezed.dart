// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PublicationsState {
  StatusCubit get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Publication? get publication => throw _privateConstructorUsedError;
  List<Publication>? get publications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublicationsStateCopyWith<PublicationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationsStateCopyWith<$Res> {
  factory $PublicationsStateCopyWith(
          PublicationsState value, $Res Function(PublicationsState) then) =
      _$PublicationsStateCopyWithImpl<$Res, PublicationsState>;
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      Publication? publication,
      List<Publication>? publications});
}

/// @nodoc
class _$PublicationsStateCopyWithImpl<$Res, $Val extends PublicationsState>
    implements $PublicationsStateCopyWith<$Res> {
  _$PublicationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? publication = freezed,
    Object? publications = freezed,
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
      publication: freezed == publication
          ? _value.publication
          : publication // ignore: cast_nullable_to_non_nullable
              as Publication?,
      publications: freezed == publications
          ? _value.publications
          : publications // ignore: cast_nullable_to_non_nullable
              as List<Publication>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicationsStateCopyWith<$Res>
    implements $PublicationsStateCopyWith<$Res> {
  factory _$$_PublicationsStateCopyWith(_$_PublicationsState value,
          $Res Function(_$_PublicationsState) then) =
      __$$_PublicationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      Publication? publication,
      List<Publication>? publications});
}

/// @nodoc
class __$$_PublicationsStateCopyWithImpl<$Res>
    extends _$PublicationsStateCopyWithImpl<$Res, _$_PublicationsState>
    implements _$$_PublicationsStateCopyWith<$Res> {
  __$$_PublicationsStateCopyWithImpl(
      _$_PublicationsState _value, $Res Function(_$_PublicationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? publication = freezed,
    Object? publications = freezed,
  }) {
    return _then(_$_PublicationsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      publication: freezed == publication
          ? _value.publication
          : publication // ignore: cast_nullable_to_non_nullable
              as Publication?,
      publications: freezed == publications
          ? _value._publications
          : publications // ignore: cast_nullable_to_non_nullable
              as List<Publication>?,
    ));
  }
}

/// @nodoc

class _$_PublicationsState implements _PublicationsState {
  const _$_PublicationsState(
      {this.status = StatusCubit.INITIAL,
      this.errorMessage,
      this.publication,
      final List<Publication>? publications})
      : _publications = publications;

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  final String? errorMessage;
  @override
  final Publication? publication;
  final List<Publication>? _publications;
  @override
  List<Publication>? get publications {
    final value = _publications;
    if (value == null) return null;
    if (_publications is EqualUnmodifiableListView) return _publications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PublicationsState(status: $status, errorMessage: $errorMessage, publication: $publication, publications: $publications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicationsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.publication, publication) ||
                other.publication == publication) &&
            const DeepCollectionEquality()
                .equals(other._publications, _publications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      publication, const DeepCollectionEquality().hash(_publications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicationsStateCopyWith<_$_PublicationsState> get copyWith =>
      __$$_PublicationsStateCopyWithImpl<_$_PublicationsState>(
          this, _$identity);
}

abstract class _PublicationsState implements PublicationsState {
  const factory _PublicationsState(
      {final StatusCubit status,
      final String? errorMessage,
      final Publication? publication,
      final List<Publication>? publications}) = _$_PublicationsState;

  @override
  StatusCubit get status;
  @override
  String? get errorMessage;
  @override
  Publication? get publication;
  @override
  List<Publication>? get publications;
  @override
  @JsonKey(ignore: true)
  _$$_PublicationsStateCopyWith<_$_PublicationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
