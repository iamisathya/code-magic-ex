
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color COLOR_707070 = Color(0xff707070);
  static const Color COLOR_FFBB4B = Color(0xffFFBB4B);
  static const Color COLOR_0B1825 = Color(0xff0B1825);
  static const Color COLOR_515151 = Color(0xff515151);
  static const Color COLOR_94B52E = Color(0xff94B52E);
  static const Color COLOR_4E83F9 = Color(0xff4E83F9);
  static const Color COLOR_A9A5B5 = Color(0xffa9a5b5);
  static const Color COLOR_616467 = Color(0xff616467);
  static const Color COLOR_999999 = Color(0xff999999);
  static const Color COLOR_5D4377 = Color(0xff5D4377);

  static const Color COLOR_C0C0C7 = Color(0xffc0c0c7);
  static const Color COLOR_01011A = Color(0xff01011A);
  static const Color COLOR_48494B = Color(0xff48494B);
  static const Color COLOR_F0F0F7 = Color(0xffF0F0F7);
  static const Color COLOR_E4E4E4 = Color(0xffE4E4E4);
  static const Color COLOR_949494 = Color(0xff949494);
  static const Color COLOR_383640 = Color(0xff383640);
  static const Color COLOR_505050 = Color(0xff505050);
  static const Color COLOR_FF98A1 = Color(0xffFF98A1);
  static const Color COLOR_F86196 = Color(0xFFF86196);
  static const Color COLOR_DBDCE5 = Color(0xffDBDCE5);
  static const Color COLOR_D5D5D5 = Color(0xffD5D5D5);
  static const Color COLOR_F7F7F7 = Color(0xffF7F7F7);
  static const Color COLOR_F8FAFB = Color(0xffF8FAFB);
  static const Color COLOR_7F7F7F = Color(0xff7F7F7F);
  static const Color COLOR_9B9B9B = Color(0xff9B9B9B);
  static const Color COLOR_808080 = Color(0xff808080);
  static const Color COLOR_E5E6E4 = Color(0xffE5E6E4);
  static const Color COLOR_F6F7F9 = Color(0xffF6F7F9);
  static const Color COLOR_C9C9C9 = Color(0xffc9c9c9);
  static const Color COLOR_474747 = Color(0xff474747);
  static const Color COLOR_F58640 = Color(0xffF58640);

  static const Color COLOR_f9f7fd = Color(0xfff9f7fd);
  static const Color COLOR_B8C9D5 = Color(0xffB8C9D5);
  static const Color COLOR_87A4B2 = Color(0xff87A4B2);
  static const Color COLOR_C3D9F5 = Color(0xffC3D9F5);
  static const Color COLOR_EA4335 = Color(0xffEA4335);
  static const Color COLOR_4267B2 = Color(0xff4267B2);
  static const Color COLOR_399000 = Color(0xff399000);
  static const Color COLOR_C3D9F5Trans = Color(0xff98C3D9F5);
  static const Color COLOR_3D5A80 = Color(0xff3D5A80);
  static const Color background = Color(0xFFF2F3F8);
  static var COLOR_FFD039 = Color(0xffFFD039);

  /// Swatch
  static const MaterialColor primarySwatch = MaterialColor(0xff5D4377, {
    50: AppColor.COLOR_5D4377,
    100: AppColor.COLOR_5D4377,
    200: AppColor.COLOR_5D4377,
    300: AppColor.COLOR_5D4377,
    400: AppColor.COLOR_5D4377,
    500: AppColor.COLOR_5D4377,
    600: AppColor.COLOR_5D4377,
    700: AppColor.COLOR_5D4377,
    800: AppColor.COLOR_5D4377,
    900: AppColor.COLOR_5D4377,
  });

  static const MaterialColor accentSwatch = MaterialColor(0xff94B52E, {
    50: AppColor.COLOR_94B52E,
    100: AppColor.COLOR_94B52E,
    200: AppColor.COLOR_94B52E,
    300: AppColor.COLOR_94B52E,
    400: AppColor.COLOR_94B52E,
    500: AppColor.COLOR_94B52E,
    600: AppColor.COLOR_94B52E,
    700: AppColor.COLOR_94B52E,
    800: AppColor.COLOR_94B52E,
    900: AppColor.COLOR_94B52E,
  });
}

const kPageBackground = Color(0xFFF2F3F7);
const kBackground = Color(0xFFF8F8F8);
const kMainColor = Color(0xFF204CDC);
const kMainColorSub = Color(0xFF4660B4);
const kPrimaryColor = Color(0xFF1D3557);
const kPrimaryLightColor = Color(0xFF457B9D);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF1D3557), Color(0xFF457B9D)],
);
const kSecondaryColor = Color(0xFFA8DADC);
const kSecondaryLightColor = Color(0xFFF1FAEE);
const kSecondaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFA8DADC), Color(0xFFF1FAEE)],
);

const kTernaryLightColor = Color(0xFFE63946);
const kWhiteSmokeColor = Color(0xfff5f5f5);
const kPendingColor = Color(0xfff0ad4e);
const kApprovedColor = Color(0xff5cb85c);

const kTextColor = Color(0xFF757575);

// * usage 
// AppColor.primarySwatch
// AppColor.primarySwatch.withOpacity(0.6)