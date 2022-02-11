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

  static const kPendingColor = Color(0xfff0ad4e);
  static const kApprovedColor = Color(0xff5cb85c);

  static const kTextColor = Color(0xFF757575);

  static const kBlackColor = Color(0xFF000000);
  static const kWhiteColor = Color(0xFFFFFFFF);
  static const kWhiteSmokeColor = Color(0xFFF5F5F5);
  static const charcoal = Color(0xFF384250);
  static const lightGrey = Color(0xFFD3D3D3);
  static const crayola = Color(0xFF76E5DE);
  static const yellowCrayola = Color(0xFFFCE38A);
  static const brightGrayThird = Color(0xFFE5EBF1);
  static const manatee = Color(0xFF9999A4);
  static const blueYonder = Color(0xFF5468AD);
  static const tuftsBlue = Color(0xFF448ED7);
  static const buttonBlue = Color(0xFF30ACEA);
  static const sunglow = Color(0xFFFFBF3A);
  static const cadet = Color(0xFF606975);
  static const brinkPink = Color(0xFFFE5D7C);
  static const darkLiver = Color(0xFF505050);
  static const dodgerBlue = Color(0xFF1C9CFC);
  static const mistyRose = Color(0xFFFFE7EB);
  static const bubbles = Color(0xFFE4FAF6);
  static const palatinateBlue = Color(0xFF204CDC);
  static const cadetBlue = Color(0xFF5297A6);
  static const brownYellow = Color(0xFFC9A769);
  static const brightGray = Color(0xFFE3E8ED);
  static const ateneoBlue = Color(0xFF003B6F);
  static const ultraRed = Color(0xFFFA758E);
  static const red = Color(0xFFFF0000);
  static const paleViolet = Color(0xFFC7A4FF);
  static const americanSilver = Color(0xFFD0D0CF);
  static const cultured = Color(0xFFF1FAF7);
  static const isabelline = Color(0xFFF7F1E9);
  static const gainsboro = Color(0xFFD8DDE3);
  static const metallicSilver = Color(0xFF9EA9B9);
  static const brightGraySecond = Color(0xFFEAEAEA);
  static const pastelOrange = Color(0xFFFFB74F);
  static const pastelBlue = Color(0xFFAFBED5);
  static const mediumAquamarine = Color(0xFF6FCF97);
  static const culturedSecond = Color(0xFFF5F6F9);
  static const aliceBlue = Color(0xFFF1F8FC);
  static const ghostWhite = Color(0xFFF6F9FD);
  static const auroMetalSaurus = Color(0xFF707783);
  static const gainsboroSecond = Color(0xFFDADADA);
  static const blueCrayola = Color(0xFF1A78F4);
  static const skyBlue = Color(0xFF4CDFFF);
  static const chineseSilver = Color(0xFFCBCBCD);
  static const maximumYellowRed = Color(0xFFE7BB4A);
  static const lightCrimson = Color(0xFFF9748E);
  static const vividMalachite = Color(0xFF03C302);

  static const juneBud = Color(0xFFB7E250);
  static const darkTangerine = Color(0xFFFEAA0D);
  static const maximumBluePurple = Color(0xFFA797FF);
  static const pictonBlue = Color(0xFF4AA8FF);
  static const rosePink = Color(0xFFFF73CF);
  static const paleCyan = Color(0xFF84D8FF);
  static const middleBlueGreen = Color(0xFF76E5D2);

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
