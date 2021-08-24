import 'dart:async';
import 'dart:convert';

import '../models/locale.dart';
import '../models/profile_picture.dart';
import '../models/user_id.dart';
import '../models/user_info.dart';
import '../models/user_token.dart';
import 'function.dart';
import 'key_value_storage.dart';
import 'logger.dart';

enum ThemeTypes { light, dark }

class UserSessionManager {
  UserSessionManager._internal();

  static UserSessionManager shared = UserSessionManager._internal();

  static UserInfo? _emptyUserInfo() => null;
  static UserId? _emptyCustomerIdInfo() => null;
  static LocaleModel _defaultLocale() =>
      LocaleModel(language: 'en', location: "US");
  static ProfilePicture? _emptyProfilePictureData() => null;
  static CustomerToken _emptyCustomerTokenData() => CustomerToken(
      href: "",
      whoami: WhoMeHref(href: ""),
      token: "",
      customer: CustomerHref(href: ""));
  static ThemeTypes resetThemeData() => ThemeTypes.light;
  ThemeTypes currentTheme = resetThemeData();
  String currentLanguage = "en";
  LocaleModel currentLocale = _defaultLocale();

  int? selectedId;
  CustomerToken customerToken = _emptyCustomerTokenData();
  late ProfilePicture? profilePicture = _emptyProfilePictureData();
  late UserInfo? userInfo = _emptyUserInfo();
  late UserId? customerIdInfo = _emptyCustomerIdInfo();
  String customerId = "";
  String customerCode = "";
  String customerPoCode = "";
  String customerUniqueId = ""; //3d9104cc2fa45dbd0bdd1a4261f6969e
  bool isUserLoggedIn = false;

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setLoginStatusIntoDB(bool status) async {
    try {
      await KeyValueStorageManager.setBool(
          KeyValueStorageKeys.loginStatus, status.toString());
      isUserLoggedIn = status;
      return true;
    } catch (error) {
      LoggerService.instance.e(
          'Session - Set Login Status into DB - Error : ${error.toString()}');
    }
    return false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setCustomerIdInfo(UserId _customerIdInfo) async {
    try {
      await KeyValueStorageManager.setString(KeyValueStorageKeys.customerIdInfo,
          json.encode(_customerIdInfo.toOriginalMap()));
      customerIdInfo = _customerIdInfo;
      return true;
    } catch (error) {
      LoggerService.instance
          .e('Session - Set Customer ID Info DB - Error : ${error.toString()}');
    }
    return false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setProfilePictureToDB(ProfilePicture pictures) async {
    try {
      await KeyValueStorageManager.setString(
          KeyValueStorageKeys.profilePictures, json.encode(pictures.toMap()));
      profilePicture = pictures;
      return true;
    } catch (error) {
      LoggerService.instance.e(
          'Session - Set Login Status into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool> setLoginTokenIntoDB(CustomerToken token) async {
    try {
      await KeyValueStorageManager.setString(
          KeyValueStorageKeys.loginTokens, json.encode(token.toMap()));
      customerToken = token;
      customerUniqueId = getUniqueId(customerToken.customer.href);
      return true;
    } catch (error) {
      LoggerService.instance
          .e('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool> setUserInfoIntoDB(UserInfo info) async {
    try {
      await KeyValueStorageManager.setString(
          KeyValueStorageKeys.userInfo, json.encode(info.toMap()));
      userInfo = info;
      return true;
    } catch (error) {
      LoggerService.instance
          .e('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool> setCurrentTheme(ThemeTypes theme) async {
    try {
      await KeyValueStorageManager.setString(
          KeyValueStorageKeys.currentTheme, theme.toString());
      currentTheme = ThemeTypes.light;
      return true;
    } catch (error) {
      LoggerService.instance
          .e('Session - Set User Info into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool> setCurrentLanguage(LocaleModel locale) async {
    try {
      await KeyValueStorageManager.setString(
          KeyValueStorageKeys.appLanguage, json.encode(locale.toMap()));
      currentLocale = locale;
      currentLanguage = locale.language;
      return true;
    } catch (error) {
      LoggerService.instance.e(
          'Session - Set Current Locale into DB - Error : ${error.toString()}');
    }
    return false;
  }

  void getCurrentLanguage() {
    try {
      final data =
          KeyValueStorageManager.getString(KeyValueStorageKeys.appLanguage);
      if (null == data || data.isEmpty) {
        currentLocale = _defaultLocale();
      } else {
        final Map<String, dynamic> jsonData =
            json.decode(data) as Map<String, dynamic>;
        if (jsonData.isEmpty) {
          currentLocale = _defaultLocale();
        }
        currentLocale = LocaleModel.fromJson(jsonData);
        currentLanguage = currentLocale.language;
      }
    } catch (error) {
      LoggerService.instance
          .e('Session - Get current locale - Error : ${error.toString()}');
      currentLocale = _defaultLocale();
      currentLanguage = "en";
    }
  }

  void setUserInfoFromDB() {
    try {
      final data =
          KeyValueStorageManager.getString(KeyValueStorageKeys.userInfo);
      if (null == data || data.isEmpty) {
        throw Exception('No data available in DB');
      }
      final Map<String, dynamic> jsonData =
          json.decode(data) as Map<String, dynamic>;
      if (jsonData.isEmpty) {
        throw Exception('No data available after JSON convert');
      }
      userInfo = UserInfo.fromJson(jsonData);
    } catch (error) {
      LoggerService.instance
          .e('Session - Set User Info from DB - Error : ${error.toString()}');
      userInfo = _emptyUserInfo();
    }
  }

  void getLoginStatusFromDB() {
    try {
      final data =
          KeyValueStorageManager.getBool(KeyValueStorageKeys.loginStatus);
      if (data == null) {
        isUserLoggedIn = false;
        return;
      }
      isUserLoggedIn = data;
    } catch (error) {
      isUserLoggedIn = false;
      LoggerService.instance.e(
          'Session - Get login status from DB - Error : ${error.toString()}');
    }
  }

  CustomerToken getLoginTokensFromDB() {
    try {
      final data =
          KeyValueStorageManager.getString(KeyValueStorageKeys.loginTokens);
      if (null == data || data.isEmpty) {
        customerToken = _emptyCustomerTokenData();
      } else {
        final Map<String, dynamic> jsonData =
            json.decode(data) as Map<String, dynamic>;
        if (jsonData.isEmpty) {
          throw Exception('No data available after JSON convert');
        }
        customerToken = CustomerToken.fromJson(jsonData);
        customerUniqueId = getUniqueId(customerToken.customer.href);
      }
    } catch (error) {
      LoggerService.instance
          .e('Session - Get login token from DB - Error : ${error.toString()}');
      customerToken = _emptyCustomerTokenData();
      throw Exception('No data available in DB');
    }
    return customerToken;
  }

  void getProfilePictureFromDB() {
    try {
      final data =
          KeyValueStorageManager.getString(KeyValueStorageKeys.profilePictures);
      if (null == data || data.isEmpty) {
        throw Exception('No data available in DB');
      }
      final Map<String, dynamic> jsonData =
          json.decode(data) as Map<String, dynamic>;
      if (jsonData.isEmpty) {
        throw Exception('No data available after JSON convert');
      }
      profilePicture = ProfilePicture.fromJson(jsonData);
    } catch (error) {
      LoggerService.instance
          .e('Session - Set User Info from DB - Error : ${error.toString()}');
      userInfo = _emptyUserInfo();
    }
  }

  void getCustomerIdInfoFromDB() {
    try {
      final data =
          KeyValueStorageManager.getString(KeyValueStorageKeys.customerIdInfo);
      if (null == data || data.isEmpty) {
        throw Exception('No customer id data available in DB');
      }
      final Map<String, dynamic> jsonData =
          json.decode(data) as Map<String, dynamic>;
      if (jsonData.isEmpty) {
        throw Exception('No data available after JSON convert');
      }
      customerIdInfo = UserId.fromJson(jsonData);
    } catch (error) {
      LoggerService.instance.e(
          'Session - Get Customer Info from DB - Error : ${error.toString()}');
      customerIdInfo = _emptyCustomerIdInfo();
    }
  }

  Future<void> removeUserInfoFromDB() async {
    await KeyValueStorageManager.remove(KeyValueStorageKeys.loginTokens);
    await KeyValueStorageManager.remove(KeyValueStorageKeys.userInfo);
    await KeyValueStorageManager.remove(KeyValueStorageKeys.loginStatus);
    await KeyValueStorageManager.remove(KeyValueStorageKeys.profilePictures);
    await KeyValueStorageManager.remove(KeyValueStorageKeys.customerIdInfo);
    userInfo = _emptyUserInfo();
    customerIdInfo = _emptyCustomerIdInfo();
    customerToken = _emptyCustomerTokenData();
    isUserLoggedIn = false;
  }

  Future<bool> setRememberMeInDB(
      {required String mail,
      required String phone,
      required String password,
      required int roleId}) async {
    try {
      await KeyValueStorageManager.setString(
          KeyValueStorageKeys.rememberMeThings,
          json.encode({
            'mail': mail,
            'phone': phone,
            'password': password,
            'roleId': roleId
          }));
      return true;
    } catch (error) {
      LoggerService.instance
          .e('Session - Set Remember Me into DB - Error : ${error.toString()}');
    }
    return false;
  }

  Future<bool>? removeRememberMeFromDB() =>
      KeyValueStorageManager.remove(KeyValueStorageKeys.rememberMeThings);
}
