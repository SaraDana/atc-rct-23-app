// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @JsonKey(name: 'creation_date')
  double get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_date')
  double get updateDate => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get read => throw _privateConstructorUsedError;
  @JsonKey(name: "notification_responsible_user_name")
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_multiple_users_notification')
  bool get multipleUsersNotification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'creation_date')
          double creationDate,
      @JsonKey(name: 'update_date')
          double updateDate,
      String message,
      String url,
      String id,
      NotificationType type,
      @JsonKey(name: 'is_read')
          bool read,
      @JsonKey(name: "notification_responsible_user_name")
          String userName,
      @JsonKey(name: 'is_multiple_users_notification')
          bool multipleUsersNotification});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationDate = null,
    Object? updateDate = null,
    Object? message = null,
    Object? url = null,
    Object? id = null,
    Object? type = null,
    Object? read = null,
    Object? userName = null,
    Object? multipleUsersNotification = null,
  }) {
    return _then(_value.copyWith(
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as double,
      updateDate: null == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      multipleUsersNotification: null == multipleUsersNotification
          ? _value.multipleUsersNotification
          : multipleUsersNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'creation_date')
          double creationDate,
      @JsonKey(name: 'update_date')
          double updateDate,
      String message,
      String url,
      String id,
      NotificationType type,
      @JsonKey(name: 'is_read')
          bool read,
      @JsonKey(name: "notification_responsible_user_name")
          String userName,
      @JsonKey(name: 'is_multiple_users_notification')
          bool multipleUsersNotification});
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$_Notification>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationDate = null,
    Object? updateDate = null,
    Object? message = null,
    Object? url = null,
    Object? id = null,
    Object? type = null,
    Object? read = null,
    Object? userName = null,
    Object? multipleUsersNotification = null,
  }) {
    return _then(_$_Notification(
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as double,
      updateDate: null == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      multipleUsersNotification: null == multipleUsersNotification
          ? _value.multipleUsersNotification
          : multipleUsersNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification implements _Notification {
  const _$_Notification(
      {@JsonKey(name: 'creation_date')
          required this.creationDate,
      @JsonKey(name: 'update_date')
          required this.updateDate,
      required this.message,
      required this.url,
      required this.id,
      required this.type,
      @JsonKey(name: 'is_read')
          required this.read,
      @JsonKey(name: "notification_responsible_user_name")
          required this.userName,
      @JsonKey(name: 'is_multiple_users_notification')
          required this.multipleUsersNotification});

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @override
  @JsonKey(name: 'creation_date')
  final double creationDate;
  @override
  @JsonKey(name: 'update_date')
  final double updateDate;
  @override
  final String message;
  @override
  final String url;
  @override
  final String id;
  @override
  final NotificationType type;
  @override
  @JsonKey(name: 'is_read')
  final bool read;
  @override
  @JsonKey(name: "notification_responsible_user_name")
  final String userName;
  @override
  @JsonKey(name: 'is_multiple_users_notification')
  final bool multipleUsersNotification;

  @override
  String toString() {
    return 'NotificationModel(creationDate: $creationDate, updateDate: $updateDate, message: $message, url: $url, id: $id, type: $type, read: $read, userName: $userName, multipleUsersNotification: $multipleUsersNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.multipleUsersNotification,
                    multipleUsersNotification) ||
                other.multipleUsersNotification == multipleUsersNotification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, creationDate, updateDate,
      message, url, id, type, read, userName, multipleUsersNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification implements NotificationModel {
  const factory _Notification(
      {@JsonKey(name: 'creation_date')
          required final double creationDate,
      @JsonKey(name: 'update_date')
          required final double updateDate,
      required final String message,
      required final String url,
      required final String id,
      required final NotificationType type,
      @JsonKey(name: 'is_read')
          required final bool read,
      @JsonKey(name: "notification_responsible_user_name")
          required final String userName,
      @JsonKey(name: 'is_multiple_users_notification')
          required final bool multipleUsersNotification}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  @JsonKey(name: 'creation_date')
  double get creationDate;
  @override
  @JsonKey(name: 'update_date')
  double get updateDate;
  @override
  String get message;
  @override
  String get url;
  @override
  String get id;
  @override
  NotificationType get type;
  @override
  @JsonKey(name: 'is_read')
  bool get read;
  @override
  @JsonKey(name: "notification_responsible_user_name")
  String get userName;
  @override
  @JsonKey(name: 'is_multiple_users_notification')
  bool get multipleUsersNotification;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
