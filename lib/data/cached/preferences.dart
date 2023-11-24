import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Preferences {
  Future<bool> setBoolValue({
    required String keyName,
    required bool value,
  });

  Future<bool> getBoolValue({
    required String keyName,
  });

  Future<bool> setIntValue({
    required String keyName,
    required int value,
  });

  Future<int> getIntValue({
    required String keyName,
  });

  Future<bool> setDoubleValue({
    required String keyName,
    required double value,
  });

  Future<double> getDoubleValue({
    required String keyName,
  });

  Future<bool> setStringValue({
    required String keyName,
    required String value,
  });

  Future<String> getStringValue({
    required String keyName,
  });

  Future<List<int>> getIntList({
    required String keyName,
  });

  Future<bool> clearAll();

  Future<bool> clearOne({required String keyName});

  Future<void> setSecureStringValue({
    required String keyName,
    required String value,
  });

  Future<String> getSecureStringValue({
    required String keyName,
  });
}

class PreferencesImpl implements Preferences {
  PreferencesImpl({
    required this.prefs,
    required this.secureStorage,
  });

  final SharedPreferences prefs;
  final FlutterSecureStorage secureStorage;

  @override
  Future<bool> setBoolValue({
    required String keyName,
    required bool value,
  }) async =>
      await prefs.setBool(keyName, value);

  @override
  Future<bool> getBoolValue({
    required String keyName,
  }) async =>
      prefs.getBool(keyName) ?? false;

  @override
  Future<bool> setIntValue({
    required String keyName,
    required int value,
  }) async =>
      await prefs.setInt(keyName, value);

  @override
  Future<int> getIntValue({
    required String keyName,
  }) async =>
      prefs.getInt(keyName) ?? 0;

  @override
  Future<bool> setDoubleValue({
    required String keyName,
    required double value,
  }) async =>
      await prefs.setDouble(keyName, value);

  @override
  Future<double> getDoubleValue({
    required String keyName,
  }) async =>
      prefs.getDouble(keyName) ?? 0.0;

  @override
  Future<bool> setStringValue({
    required String keyName,
    required String value,
  }) async =>
      await prefs.setString(keyName, value);

  @override
  Future<String> getStringValue({
    required String keyName,
  }) async =>
      prefs.getString(keyName) ?? '';

  @override
  Future<List<int>> getIntList({
    required String keyName,
  }) async =>
      prefs.getString(keyName) == null
          ? []
          : json.decode(prefs.getString(keyName)!).cast<int>();

  @override
  Future<bool> clearAll() async => prefs.clear();

  @override
  Future<bool> clearOne({required String keyName}) async =>
      prefs.remove(keyName);

  @override
  Future<void> setSecureStringValue({
    required String keyName,
    required String value,
  }) async =>
      await secureStorage.write(
        key: keyName,
        value: value,
        aOptions: const AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );

  @override
  Future<String> getSecureStringValue({
    required String keyName,
  }) async =>
      await secureStorage.read(
        key: keyName,
        aOptions: const AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      ) ??
      '';
}
