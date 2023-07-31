import 'package:freezed_annotation/freezed_annotation.dart';
part 'permissions_handler_state.freezed.dart';

@freezed
class PermissionsHandlerState with _$PermissionsHandlerState {
  const factory PermissionsHandlerState({
    @Default(false) bool isNotificationsAllowed,
  }) = _PermissionsHandlerState;
}
