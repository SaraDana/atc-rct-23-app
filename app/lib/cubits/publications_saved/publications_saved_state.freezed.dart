// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publications_saved_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PublicationsSavedState {
  StatusCubit get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<Publication>? get publications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublicationsSavedStateCopyWith<PublicationsSavedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationsSavedStateCopyWith<$Res> {
  factory $PublicationsSavedStateCopyWith(PublicationsSavedState value,
          $Res Function(PublicationsSavedState) then) =
      _$PublicationsSavedStateCopyWithImpl<$Res, PublicationsSavedState>;
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      List<Publication>? publications});
}

/// @nodoc
class _$PublicationsSavedStateCopyWithImpl<$Res,
        $Val extends PublicationsSavedState>
    implements $PublicationsSavedStateCopyWith<$Res> {
  _$PublicationsSavedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
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
      publications: freezed == publications
          ? _value.publications
          : publications // ignore: cast_nullable_to_non_nullable
              as List<Publication>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicationsSavedStateCopyWith<$Res>
    implements $PublicationsSavedStateCopyWith<$Res> {
  factory _$$_PublicationsSavedStateCopyWith(_$_PublicationsSavedState value,
          $Res Function(_$_PublicationsSavedState) then) =
      __$$_PublicationsSavedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      String? errorMessage,
      List<Publication>? publications});
}

/// @nodoc
class __$$_PublicationsSavedStateCopyWithImpl<$Res>
    extends _$PublicationsSavedStateCopyWithImpl<$Res,
        _$_PublicationsSavedState>
    implements _$$_PublicationsSavedStateCopyWith<$Res> {
  __$$_PublicationsSavedStateCopyWithImpl(_$_PublicationsSavedState _value,
      $Res Function(_$_PublicationsSavedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? publications = freezed,
  }) {
    return _then(_$_PublicationsSavedState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      publications: freezed == publications
          ? _value._publications
          : publications // ignore: cast_nullable_to_non_nullable
              as List<Publication>?,
    ));
  }
}

/// @nodoc

class _$_PublicationsSavedState implements _PublicationsSavedState {
  const _$_PublicationsSavedState(
      {this.status = StatusCubit.INITIAL,
      this.errorMessage,
      final List<Publication>? publications})
      : _publications = publications;

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  final String? errorMessage;
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
    return 'PublicationsSavedState(status: $status, errorMessage: $errorMessage, publications: $publications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicationsSavedState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._publications, _publications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_publications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicationsSavedStateCopyWith<_$_PublicationsSavedState> get copyWith =>
      __$$_PublicationsSavedStateCopyWithImpl<_$_PublicationsSavedState>(
          this, _$identity);
}

abstract class _PublicationsSavedState implements PublicationsSavedState {
  const factory _PublicationsSavedState(
      {final StatusCubit status,
      final String? errorMessage,
      final List<Publication>? publications}) = _$_PublicationsSavedState;

  @override
  StatusCubit get status;
  @override
  String? get errorMessage;
  @override
  List<Publication>? get publications;
  @override
  @JsonKey(ignore: true)
  _$$_PublicationsSavedStateCopyWith<_$_PublicationsSavedState> get copyWith =>
      throw _privateConstructorUsedError;
}
