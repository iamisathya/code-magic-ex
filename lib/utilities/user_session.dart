import 'dart:async';
import 'dart:convert';
import 'package:code_magic_ex/models/user_token.dart';
import 'package:flutter/foundation.dart';

import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/utilities/key_value_storage.dart';

enum ThemeTypes {
  light,
  dark
}
class UserSessionManager {
  UserSessionManager._internal();

  static UserSessionManager shared = UserSessionManager._internal();

  static UserInfo _emptyUserInfo() => UserInfo();
  static CustomerToken _emptyCustomerTokenData() => CustomerToken(href: "", whoami: WhoMeHref(href: ""), token: "", customer: CustomerHref(href: ""));
  static ThemeTypes resetThemeData() => ThemeTypes.light;
  ThemeTypes currentTheme = resetThemeData();
  String currentLanguage = 'en';

  int? selectedId;
  CustomerToken customerToken = _emptyCustomerTokenData();
  UserInfo userInfo = _emptyUserInfo();

  Future<bool> setLoginTokenIntoDB(CustomerToken token) async {
    try {
      await KeyValueStorageManager.setString(KeyValueStorageKeys.loginTokens, json.encode(token.toMap()));

      debugPrint(" USER KVSM : ${KeyValueStorageManager.getString(KeyValueStorageKeys.loginTokens)}");
      customerToken = token;
      return true;
    } catch (error) {
      debugPrint('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }
  
  Future<bool> setUserInfoIntoDB(UserInfo info) async {
    try {
      await KeyValueStorageManager.setString(KeyValueStorageKeys.userInfo, json.encode(info.toMap()));

      debugPrint(" USER KVSM : ${KeyValueStorageManager.getString(KeyValueStorageKeys.userInfo)}");
      userInfo = info;
      return true;
    } catch (error) {
      debugPrint('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }

   Future<bool> setCurrentTheme(ThemeTypes theme) async {
    try {
      await KeyValueStorageManager.setString(KeyValueStorageKeys.currentTheme, theme.toString());

      debugPrint(" USER KVSM : ${KeyValueStorageManager.getString(KeyValueStorageKeys.currentTheme)}");
      currentTheme = ThemeTypes.light;
      return true;
    } catch (error) {
      debugPrint('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool> setCurrentLanguage(String language) async {
    try {
      await KeyValueStorageManager.setString(KeyValueStorageKeys.currentLanguage, language);
      debugPrint(" USER KVSM : ${KeyValueStorageManager.getString(KeyValueStorageKeys.currentLanguage)}");      
      return true;
    } catch (error) {
      debugPrint('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }

  void setUserInfoFromDB() {
    try {
      final data = KeyValueStorageManager.getString(KeyValueStorageKeys.userInfo);
      if (null == data || data.isEmpty) throw Exception('No data available in DB');
      final Map<String, dynamic> jsonData = json.decode(data) as Map<String, dynamic>;
      if (jsonData.isEmpty) throw Exception('No data available after JSON convert');
      userInfo = UserInfo.fromJson(jsonData);
    } catch (error) {
      debugPrint('Session - Set User Info from DB - Error : ${error.toString()}');
      userInfo = _emptyUserInfo();
    }
  }


  Future<void> removeUserInfoFromDB() async {
    await KeyValueStorageManager.remove(KeyValueStorageKeys.userInfo);
    userInfo = _emptyUserInfo();
  }


  Future<bool> setRememberMeInDB(
      {required String mail, required String phone, required String password, required int roleId}) async {
    try {
      await KeyValueStorageManager.setString(KeyValueStorageKeys.rememberMeThings,
          json.encode({'mail': mail, 'phone': phone, 'password': password, 'roleId': roleId}));
      return true;
    } catch (error) {
      debugPrint('Session - Set Remember Me into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool>? removeRememberMeFromDB() => KeyValueStorageManager.remove(KeyValueStorageKeys.rememberMeThings);
}