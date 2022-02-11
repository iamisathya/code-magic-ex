import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'km_KH.dart';
import 'lo_LA.dart';
import 'ms_MY.dart';
import 'th_TH.dart';

class AppTranslations extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'km_KH': km_KH,
        'lo_LA': lo_LA,
        'ms_MY': ms_MY,
        'th_TH': th_TH
      };
}
