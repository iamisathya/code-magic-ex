import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'size_config.dart';

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

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

const String kEncodeType = "base64";
const String kEncodeValue = "Mjk3MDQ2NjoxMjM0";

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kUserIdNullError = "Please enter your user id";
const String kInvalidEmailError = "Please enter Valid Email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

BoxDecoration normalBoxDecoration() {
  return BoxDecoration(
      color: kWhiteSmokeColor,
      border: Border.all(color: kMainColor, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)));
}

EdgeInsets kEdgeV12H16() =>
    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0);
EdgeInsets kEdgeA8() => const EdgeInsets.all(8.0);
EdgeInsets kEdgeA12() => const EdgeInsets.all(12.0);
EdgeInsets kEdgeA16() => const EdgeInsets.all(16.0);
EdgeInsets kEdgeA24() => const EdgeInsets.all(24.0);

EdgeInsets kEdgeInset({double v = 8.0}) => EdgeInsets.all(v);

BoxDecoration kCircular8 =
    BoxDecoration(borderRadius: BorderRadius.circular(8), color: kMainColor);

RoundedRectangleBorder kRoundedBorder({double radius = 10}) =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));

MaterialStateProperty<RoundedRectangleBorder> elevatedShape() {
  return MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: const BorderSide(color: Colors.blueAccent)));
}

RoundedRectangleBorder kRoundedRectangleBorder8() {
  return RoundedRectangleBorder(
    side: const BorderSide(),
    borderRadius: BorderRadius.circular(8),
  );
}

OutlineInputBorder kFocusedOutlineInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: kMainColor, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
}

OutlineInputBorder kOutlineInputBorder() {
  return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)));
}

InputDecoration kTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(20.0),
    focusedBorder: kFocusedOutlineInputBorder(),
    border: kOutlineInputBorder(),
    hintText: hintText,
    helperText: helperText,
  );
}

InputDecoration kActiveTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(20.0),
    focusedBorder: kFocusedOutlineInputBorder(),
    enabledBorder: kFocusedOutlineInputBorder(),
    disabledBorder: kFocusedOutlineInputBorder(),
    hintText: hintText,
    helperText: helperText,
  );
}

InputDecoration kDisabledTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(20.0),
    focusedBorder: kFocusedOutlineInputBorder(),
    enabledBorder: kFocusedOutlineInputBorder(),
    disabledBorder: kFocusedOutlineInputBorder(),
    hintText: hintText,
    helperText: helperText,
  );
}

InputDecoration kAutoCompleteTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    focusedBorder: kFocusedOutlineInputBorder(),
    border: kOutlineInputBorder(),
  );
}

//* Divider
Divider kDivider({double h = 1.0, double t = 1.0, Color c = Colors.black54}) =>
    Divider(
      color: c,
      height: h,
      thickness: t,
    );

//* Box Decoration
BoxDecoration kTableHeaderBoxDecoration(
        {Color c = kMainColor, double w = 0.5, Color bc = Colors.white}) =>
    BoxDecoration(color: c, border: Border.all(width: w, color: bc));

Divider kRowDivider = const Divider(
  color: Colors.black54,
  height: 1.0,
  thickness: 0.0,
);

BoxDecoration kCheckoutDecoration({Color c = Colors.white, double r = 15}) =>
    BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(r),
    );

String kCurrentTimeStamp = DateTime.now().millisecondsSinceEpoch.toString();

// * Order related constants
String kCheckOrderEntryServerStatus = "000";
String kEasyShipReports = "2";
String kOrderEntryProductList = "31";
String kOrderEntryProductInfo = "104";
String kPlaceOrder = "201";
String kUserId = "206";
String kUploadFileId = "207";
String kCurrentLanguage = "English";
String kPeriodLog = "periodLog";
String kPurchaseLog = "purchaseLog";
String kEnrollerLog = "enrollerLog";

String kCountry = "TH";
String kSystem = "DSC";

// * Screen size related

double kScreenHeight = Get.height;

double kScreenWidth = Get.width;

// * Border

InputDecoration kBorderNone = const InputDecoration(border: InputBorder.none);

InputDecoration kInputDecoration(String hintText, String label) {
  return InputDecoration(
    border: const OutlineInputBorder(borderSide: BorderSide(color: kMainColor)),
    hintText: hintText,
    labelText: label,
  );
}

BorderSide kBorderSide({double w = 2.0, Color c = kMainColor}) =>
    BorderSide(color: c, width: w);

BorderRadius kBorderRadius({double w = 8.0}) =>
    BorderRadius.all(Radius.circular(w));

Border kBorderAll({double w = 2.0, Color c = kMainColor}) =>
    Border.all(color: c, width: w);

BoxDecoration kTableHeaderTileBox =
    BoxDecoration(color: kMainColor, border: Border.all(width: 0.5));

// currencies
class Currencies {
  static const String dollar = "¢";
  static const String euro = "€";
  static const String pound = "£";
  static const String yuan = "¢";
  static const String won = "₩";
  static const String ruble = "₽";
  static const String rupee = "₹";
  static const String peso = "₱";
  static const String tugrik = "₮";
  static const String rupees = "₨";
  static const String bath = "฿";
  static const String kip = "₭";
}

// ! delete later
const String kLoginToken = "fb8f3763-c423-4066-82eb-4666181fb607";

String kCurrentOS = Platform.isIOS ? "iOS" : "Android";
