import 'package:get_storage/get_storage.dart';

class StorageUtility {
  static final GetStorage _storage = GetStorage();

  /// Save a string value to local storage
  static Future<void> saveString(String key, String value) async {
    await _storage.write(key, value);
  }

  /// Retrieve a string value from local storage
  static String? getString(String key) {
    return _storage.read(key);
  }

  /// Save a boolean value to local storage
  static Future<void> saveBoolean(String key, bool value) async {
    await _storage.write(key, value);
  }

  /// Retrieve a boolean value from local storage
  static bool getBoolean(String key, {bool defaultValue = false}) {
    return _storage.read(key) ?? defaultValue;
  }

  /// Save an integer value to local storage
  static Future<void> saveInt(String key, int value) async {
    await _storage.write(key, value);
  }

  /// Retrieve an integer value from local storage
  static int getInt(String key, {int defaultValue = 0}) {
    return _storage.read(key) ?? defaultValue;
  }

  /// Delete a value from local storage
  static Future<void> deleteValue(String key) async {
    await _storage.remove(key);
  }

  /// Clear all data from local storage
  static Future<void> clearStorage() async {
    await _storage.erase();
  }

  /// Check if a key exists in local storage
  static bool hasKey(String key) {
    return _storage.hasData(key);
  }
}
