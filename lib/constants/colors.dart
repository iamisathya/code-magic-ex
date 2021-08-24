import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color kMainColor = Color(0xFF204CDC);
  static const Color kMainColorSub = Color(0xFF4660B4);

  static const kPageBackground = Color(0xFFF2F3F7);
  static const kBackground = Color(0xFFF8F8F8);
  static const kPrimaryLightColor = Color(0xFF457B9D);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [kMainColor, kMainColorSub],
  );
  static const kSecondaryColor = Color(0xFFA8DADC);

  static const kWhiteSmokeColor = Color(0xfff5f5f5);
  static const kPendingColor = Color(0xfff0ad4e);
  static const kApprovedColor = Color(0xff5cb85c);

  static const kTextColor = Color(0xFF757575);

  /// Swatch
  static const MaterialColor primarySwatch = MaterialColor(0xff5D4377, {
    50: AppColor.kMainColor,
    100: AppColor.kMainColor,
    200: AppColor.kMainColor,
    300: AppColor.kMainColor,
    400: AppColor.kMainColor,
    500: AppColor.kMainColor,
    600: AppColor.kMainColor,
    700: AppColor.kMainColor,
    800: AppColor.kMainColor,
    900: AppColor.kMainColor,
  });

  static const MaterialColor accentSwatch = MaterialColor(0xff94B52E, {
    50: AppColor.kMainColorSub,
    100: AppColor.kMainColorSub,
    200: AppColor.kMainColorSub,
    300: AppColor.kMainColorSub,
    400: AppColor.kMainColorSub,
    500: AppColor.kMainColorSub,
    600: AppColor.kMainColorSub,
    700: AppColor.kMainColorSub,
    800: AppColor.kMainColorSub,
    900: AppColor.kMainColorSub,
  });
}
