import 'package:package_info_plus/package_info_plus.dart';

abstract class AppDeviceInfo {
  Future<void> init();
  String get getCurrentVersion;
  String get getPackageName;
}

class DeviceInfoImpl implements AppDeviceInfo {
  late PackageInfo packageInfo;

  Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  String get getCurrentVersion => packageInfo.version;

  @override
  String get getPackageName => packageInfo.packageName;
}
