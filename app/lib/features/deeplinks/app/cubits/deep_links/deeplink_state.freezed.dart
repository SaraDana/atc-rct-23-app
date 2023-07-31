// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deeplink_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeeplinkState {
  StatusCubit get status => throw _privateConstructorUsedError;
  DeepLinkType get deepLinkType => throw _privateConstructorUsedError;
  bool get forceNavigate => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get deeplink => throw _privateConstructorUsedError;
  Uri? get deeplinkInQueue => throw _privateConstructorUsedError;
  Uri? get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeeplinkStateCopyWith<DeeplinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkStateCopyWith<$Res> {
  factory $DeeplinkStateCopyWith(
          DeeplinkState value, $Res Function(DeeplinkState) then) =
      _$DeeplinkStateCopyWithImpl<$Res, DeeplinkState>;
  @useResult
  $Res call(
      {StatusCubit status,
      DeepLinkType deepLinkType,
      bool forceNavigate,
      String? errorMessage,
      String? deeplink,
      Uri? deeplinkInQueue,
      Uri? url});
}

/// @nodoc
class _$DeeplinkStateCopyWithImpl<$Res, $Val extends DeeplinkState>
    implements $DeeplinkStateCopyWith<$Res> {
  _$DeeplinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? deepLinkType = null,
    Object? forceNavigate = null,
    Object? errorMessage = freezed,
    Object? deeplink = freezed,
    Object? deeplinkInQueue = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      deepLinkType: null == deepLinkType
          ? _value.deepLinkType
          : deepLinkType // ignore: cast_nullable_to_non_nullable
              as DeepLinkType,
      forceNavigate: null == forceNavigate
          ? _value.forceNavigate
          : forceNavigate // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      deeplink: freezed == deeplink
          ? _value.deeplink
          : deeplink // ignore: cast_nullable_to_non_nullable
              as String?,
      deeplinkInQueue: freezed == deeplinkInQueue
          ? _value.deeplinkInQueue
          : deeplinkInQueue // ignore: cast_nullable_to_non_nullable
              as Uri?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeeplinkStateCopyWith<$Res>
    implements $DeeplinkStateCopyWith<$Res> {
  factory _$$_DeeplinkStateCopyWith(
          _$_DeeplinkState value, $Res Function(_$_DeeplinkState) then) =
      __$$_DeeplinkStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      DeepLinkType deepLinkType,
      bool forceNavigate,
      String? errorMessage,
      String? deeplink,
      Uri? deeplinkInQueue,
      Uri? url});
}

/// @nodoc
class __$$_DeeplinkStateCopyWithImpl<$Res>
    extends _$DeeplinkStateCopyWithImpl<$Res, _$_DeeplinkState>
    implements _$$_DeeplinkStateCopyWith<$Res> {
  __$$_DeeplinkStateCopyWithImpl(
      _$_DeeplinkState _value, $Res Function(_$_DeeplinkState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? deepLinkType = null,
    Object? forceNavigate = null,
    Object? errorMessage = freezed,
    Object? deeplink = freezed,
    Object? deeplinkInQueue = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_DeeplinkState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      deepLinkType: null == deepLinkType
          ? _value.deepLinkType
          : deepLinkType // ignore: cast_nullable_to_non_nullable
              as DeepLinkType,
      forceNavigate: null == forceNavigate
          ? _value.forceNavigate
          : forceNavigate // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      deeplink: freezed == deeplink
          ? _value.deeplink
          : deeplink // ignore: cast_nullable_to_non_nullable
              as String?,
      deeplinkInQueue: freezed == deeplinkInQueue
          ? _value.deeplinkInQueue
          : deeplinkInQueue // ignore: cast_nullable_to_non_nullable
              as Uri?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// @nodoc

class _$_DeeplinkState implements _DeeplinkState {
  const _$_DeeplinkState(
      {this.status = StatusCubit.INITIAL,
      this.deepLinkType = DeepLinkType.INITIAL,
      this.forceNavigate = false,
      this.errorMessage,
      this.deeplink,
      this.deeplinkInQueue,
      this.url});

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  @JsonKey()
  final DeepLinkType deepLinkType;
  @override
  @JsonKey()
  final bool forceNavigate;
  @override
  final String? errorMessage;
  @override
  final String? deeplink;
  @override
  final Uri? deeplinkInQueue;
  @override
  final Uri? url;

  @override
  String toString() {
    return 'DeeplinkState(status: $status, deepLinkType: $deepLinkType, forceNavigate: $forceNavigate, errorMessage: $errorMessage, deeplink: $deeplink, deeplinkInQueue: $deeplinkInQueue, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeeplinkState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deepLinkType, deepLinkType) ||
                other.deepLinkType == deepLinkType) &&
            (identical(other.forceNavigate, forceNavigate) ||
                other.forceNavigate == forceNavigate) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.deeplink, deeplink) ||
                other.deeplink == deeplink) &&
            (identical(other.deeplinkInQueue, deeplinkInQueue) ||
                other.deeplinkInQueue == deeplinkInQueue) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, deepLinkType,
      forceNavigate, errorMessage, deeplink, deeplinkInQueue, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeeplinkStateCopyWith<_$_DeeplinkState> get copyWith =>
      __$$_DeeplinkStateCopyWithImpl<_$_DeeplinkState>(this, _$identity);
}

abstract class _DeeplinkState implements DeeplinkState {
  const factory _DeeplinkState(
      {final StatusCubit status,
      final DeepLinkType deepLinkType,
      final bool forceNavigate,
      final String? errorMessage,
      final String? deeplink,
      final Uri? deeplinkInQueue,
      final Uri? url}) = _$_DeeplinkState;

  @override
  StatusCubit get status;
  @override
  DeepLinkType get deepLinkType;
  @override
  bool get forceNavigate;
  @override
  String? get errorMessage;
  @override
  String? get deeplink;
  @override
  Uri? get deeplinkInQueue;
  @override
  Uri? get url;
  @override
  @JsonKey(ignore: true)
  _$$_DeeplinkStateCopyWith<_$_DeeplinkState> get copyWith =>
      throw _privateConstructorUsedError;
}
