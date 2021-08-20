import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en.dart';
import 'km.dart';
import 'lo.dart';
import 'ms.dart';
import 'th.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('th', 'TH');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'en',
    'th',
    'km',
    'lo',
    'ms',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('th', 'TH'),
    const Locale('km', 'KH'),
    const Locale('lo', 'LA'),
    const Locale('ms', 'MY'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_US.dart
        'th_TH': thTH, // lang/th_TH.dart
        'km_KH': kmKH, // lang/km_KH.dart
        'lo_LA': loLA, // lang/lo_LA.dart
        'ms_MY': msMY, // lang/ms_MY.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
