import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_config.freezed.dart';

@freezed
class AppVersionConfig with _$AppVersionConfig {
  const factory AppVersionConfig({
    required bool isLatestVersion,
    required bool needShowUpdate,
    required bool isVersionNotAllowed,
  }) = _AppVersionConfig;
}
