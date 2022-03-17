import 'dart:io';

import 'package:dsc_tools/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/user_session.dart';
import '../model/country_info.dart';
import '../model/menu_option_model.dart';
import '../model/profile_picture.dart';
import '../model/user_info.dart';

//import 'package:dsc_tools/data/model/country_info.dart';
//import 'package:dsc_tools/data/model/menu_option_model.dart';
//import 'package:dsc_tools/data/model/profile_picture.dart';
//import 'package:dsc_tools/data/model/user_info.dart';

class Globals {
  Globals._();
  static String defaultLanguage = 'en_US';
//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(title: "English", value: "en_US"), //English
    MenuOptionsModel(title: "Thai", value: "th_TH"), //Thai
  ];

  static final RxList<MenuOptionsModel> openPoMonths = [
    MenuOptionsModel(title: "month6", value: "6"), //English
    MenuOptionsModel(title: "monthall", value: "12"), //Thai
  ].obs;

  static Markets? currentMarket;
  static String currency = "";
  static String countryCode =
      UserSessionManager.shared.userInfo!.mainAddress.country;
  static MainAddress mainAddress =
      UserSessionManager.shared.userInfo!.mainAddress;
  static String userId =
      UserSessionManager.shared.userInfo!.id.unicity.toString();
  static UserInfo userInfo = UserSessionManager.shared.userInfo!;
  static Rx<ProfilePicture> profilePicture =
      UserSessionManager.shared.profilePicture != null
          ? UserSessionManager.shared.profilePicture!.obs
          : ProfilePicture(sizes: [], href: '').obs;
  static Rx<String> emailAddress =
      UserSessionManager.shared.userInfo!.email.obs;
  static String customerCode = "";
  static String customerPoCode = "";
  static String currentMarketWarehouseId = "";

  static String osVersion = Platform.operatingSystemVersion;
  static String deviceType = Platform.isIOS
      ? "iOS"
      : Platform.isAndroid
          ? "Android"
          : "Others";

  static String firebaseToken = "";
}
