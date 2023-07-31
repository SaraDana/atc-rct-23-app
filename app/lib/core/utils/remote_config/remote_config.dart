import 'dart:convert';
import 'dart:io';

import 'package:app/core/utils/remote_config/remote_config_keys.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

abstract class DanaRemoteConfig {
  Future<void> init();
  Future<Map<String, dynamic>> getVersions();
  String get getPlatformKey;
  String get saviaChat24hUrl;
  String get saviaVideoConsultaUrl;
  bool get isPremiumGroupB;
  bool get showRateUs;
  int get dateForTestAB;
  double get premiumGroupCoefficient;
}

class RemoteConfigImpl implements DanaRemoteConfig {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  @override
  Future<void> init() async {
    try {
      await remoteConfig.activate();
      await remoteConfig.ensureInitialized();
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getVersions() async {
    try {
      final version = remoteConfig.getString(getPlatformKey);
      return jsonDecode(version);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  String get getPlatformKey {
    if (Platform.isIOS) {
      return RemoteConfigKeys.iosKey;
    }

    return RemoteConfigKeys.androidKey;
  }

  @override
  bool get isPremiumGroupB {
    try {
      return remoteConfig.getBool(RemoteConfigKeys.premiumKey);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  bool get showRateUs {
    try {
      return remoteConfig.getBool(RemoteConfigKeys.showRateUs);
    } catch (e) {
      return false;
    }
  }

  @override
  int get dateForTestAB {
    try {
      return remoteConfig.getInt(RemoteConfigKeys.dateForTestAB);
    } catch (e) {
      return 0;
    }
  }

  @override
  String get saviaChat24hUrl {
    try {
      return remoteConfig.getString(RemoteConfigKeys.saviaChat24hUrl);
    } catch (e) {
      return "";
    }
  }

  @override
  String get saviaVideoConsultaUrl {
    try {
      return remoteConfig.getString(RemoteConfigKeys.saviaVideoConsultaUrl);
    } catch (e) {
      return "";
    }
  }

  @override
  double get premiumGroupCoefficient {
    try {
      return remoteConfig.getDouble(RemoteConfigKeys.premiumGroupCoefficient);
    } catch (e) {
      return 0;
    }
  }
}
