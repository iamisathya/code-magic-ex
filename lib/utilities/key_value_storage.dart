import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageManager {
  KeyValueStorageManager._();

  static SharedPreferences? _sharedPreferences;

  static const String _prefix = "dsctools.nonpersist.";

  static String _keyWithPrefix(String key) => _prefix + key;

  static const String _persistPrefix = "dsctools.persist.";

  static String _keyWithPersistPrefix(String key) => _persistPrefix + key;

  static String _actualKey(String key, bool persist) =>
      persist ? _keyWithPersistPrefix(key) : _keyWithPrefix(key);

  static SharedPreferences? _getStorage() {
    return _sharedPreferences;
  }

  SharedPreferences? get sharedPreferencesInstance => _sharedPreferences;

  static Future<void> setStorage() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> clear({bool persist = false}) async {
    final Set<String> keys = getKeys(persist: persist);
    for (final String key in keys) {
      await remove(key, persist: persist);
    }
    return true;
  }

  static Future<bool>? remove(String key, {bool persist = false}) =>
      _getStorage()!
          .remove(_actualKey(key, persist))
          .then((result) => result)
          .catchError((_) => false);

  static bool containsKey(String key, {bool persist = false}) =>
      _getStorage()!.containsKey(_actualKey(key, persist));

  static Set<String> getKeys({bool persist = false}) => (_getStorage()!
          .getKeys())
      .where((key) => key.startsWith(persist ? _persistPrefix : _prefix))
      .map((key) => key.replaceFirst(persist ? _persistPrefix : _prefix, ""))
      .toSet();

  /// Get Value for the Key
  static dynamic get(String key, {bool persist = false}) =>
      _getStorage()!.get(_actualKey(key, persist));

  static bool? getBool(String key, {bool persist = false}) =>
      _getStorage()!.getBool(_actualKey(key, persist));

  static double? getDouble(String key, {bool persist = false}) =>
      _getStorage()!.getDouble(_actualKey(key, persist));

  static int? getInt(String key, {bool persist = false}) =>
      _getStorage()!.getInt(_actualKey(key, persist));

  static String? getString(String key, {bool persist = false}) =>
      _getStorage()!.getString(_actualKey(key, persist));

  /// Set Value for the Key
  static Future<bool> setBool(String key, String value,
          {bool persist = false}) =>
      _getStorage()!.setBool(_actualKey(key, persist), value == 'true');

  static Future<bool> setDouble(String key, double value,
          {bool persist = false}) =>
      _getStorage()!.setDouble(_actualKey(key, persist), value);

  static Future<bool> setInt(String key, int value, {bool persist = false}) =>
      _getStorage()!.setInt(_actualKey(key, persist), value);

  static Future<bool> setString(String key, String value,
          {bool persist = false}) =>
      _getStorage()!.setString(_actualKey(key, persist), value);
}

class KeyValueStorageKeys {
  static const String loginTokens = "login_tokens";
  static const String loginStatus = "login_status";
  static const String userInfo = "user_info";
  static const String rememberMeThings = "user_remember_me_things";
  static const String currentTheme = "light";
  static const String currentLanguage = "en";
}
