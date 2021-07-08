import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      border: Border.all(),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)));
}

EdgeInsets kEdgeV12H16() =>
    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0);
EdgeInsets kEdgeA8() => const EdgeInsets.all(8.0);
EdgeInsets kEdgeA12() => const EdgeInsets.all(12.0);
EdgeInsets kEdgeA16() => const EdgeInsets.all(16.0);

BoxDecoration kCircular8 =
    BoxDecoration(borderRadius: BorderRadius.circular(8), color: kPrimaryColor);

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

Divider kRowDivider = const Divider(
  color: Colors.black54,
  height: 1.0,
  thickness: 0.0,
);

String kCurrentTimeStamp = DateTime.now().millisecondsSinceEpoch.toString();

// * Order related constants
String kPlaceOrder = "201";
String kUserId = "206";


// * Screen size related

double kScreenHeight = Get.height;

double kScreenWidth = Get.width;