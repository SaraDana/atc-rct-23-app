import 'package:app/core/utils/remote_config/app_version_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_app_state.freezed.dart';

@freezed
class StartAppState with _$StartAppState {
  const factory StartAppState({
    @Default(false) bool isLogged,
    @Default(false) bool error,
    @Default(false) bool showOnboarding,
    AppVersionConfig? appVersionConfig,
    @Default(false) bool waitOneSecond,
    String? questionnareId,
  }) = _StartAppState;
}
