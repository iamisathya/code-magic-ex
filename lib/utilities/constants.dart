import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'size_config.dart';

const kPageBackground = Color(0xFFF2F3F7);
const kBackground = Color(0xFFF8F8F8);
const kMainColor = Color(0xFF204CDC);
const kMainColorSub = Color(0xFF4660B4);
const kPrimaryLightColor = Color(0xFF457B9D);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF1D3557), Color(0xFF457B9D)],
);

const RadialGradient radialGradient = RadialGradient(
  radius: 0.7,
  colors: <Color>[AppColor.dodgerBlue, AppColor.brightGraySecond],
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
      border: Border.all(color: kMainColor, width: 2),
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
  return OutlineInputBorder(
    borderSide: BorderSide(
        color: Theme.of(Get.context!).colorScheme.primary, width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
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
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
String kSalesReportType = "4";

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

const List<Map<String, dynamic>> termsAndConditions = [
  {
    "countryCode": "TH",
    "content": {
      "native": [
        "โครงการสั่งซื้อปลีก",
        "ลูกค้าปลีกสามารถสั่งซื้อผลิตภัณฑ์โดยตรงจากยูนิซิตี้โดยปฏิบัติตามแนวทางการสั่งซื้อผลิตภัณฑ์นี้",
        "1)   เมื่อติดต่อสั่งซื้อสินค้ากับแผนกลูกค้าสัมพันธ์ของยูนิซิตี้เป็นครั้งแรก ลูกค้าปลีกควรให้หมายเลขสมาชิกของนักธุรกิจอิสระที่แนะนำมา จากนั้นลูกค้าปลีกจะได้รับหมายเลขประจำตัวลูกค้าปลีกของตนเอง",
        "2)   ความรับผิดชอบในการบันทึกยอดการสั่งซื้อของลูกค้าปลีกอย่างถูกต้องเป็นของนักธุรกิจอิสระที่แนะนำลูกค้าท่านนั้น มิใช่เป็นความรับผิดชอบของยูนิซิตี้หรือพนักงานของบริษัทฯ",
        "3)   นักธุรกิจอิสระเป็นผู้รับผิดชอบในค่าใช้จ่ายอันเกิดจากการคืนผลิตภัณฑ์หรือการปฏิเสธการจ่ายของบัตรเครดิต (Chargeback) หากการคืนผลิตภัณฑ์หรือการปฏิเสธการจ่ายดังกล่าวเกิดขึ้นจากลูกค้าปลีก นักธุรกิจอิสระตกลงยินยอมให้ยูนิซิตี้หักค่าใช้จ่ายทั้งหมดที่เกิดขึ้นตามจากเช็ค/บัญชีคอมมิชชั่นของนักธุรกิจอิสระ และยูนิซิตี้ยังอาจระงับสิทธิการสั่งซื้อของนักธุรกิจอิสระและคิดค่าธรรมเนียมการปฏิเสธการจ่ายเป็นจำนวน 1,000 บาท (หนึ่งพันบาทถ้วน)",
        "4)   ส่วนต่างของราคาขายส่งและราคาขายปลีกจะจ่ายให้กับนักธุรกิจอิสระตามหมายเลขนักธุรกิจอิสระที่ได้รับการแจ้งจากลูกค้าปลีกที่ทำการสั่งซื้อ โดยนักธุรกิจอิสระท่านนั้นต้องมีคะแนนส่วนบุคคลอย่างน้อยในระดับขั้นต่ำสุดของการมีคุณสมบัติในเดือนการคำนวณผลตอบแทนนั้น นักธุรกิจอิสระจะได้รับคะแนนส่วนบุคคลจากการสั่งซื้อโดยลูกค้าปลีกในเดือนที่ยูนิซิตี้ได้รับคำสั่งซื้อและได้รับการชำระเงินเป็นที่เรียบร้อยสำหรับคำสั่งซื้อนั้น",
        "",
        "",
        "นโยบายการรับประกันความพึงพอในผลิตภัณฑ์ของลูกค้าปลีก",
        "เมื่อทำการจำหน่ายผลิตภัณฑ์ นักธุรกิจอิสระต้องแจ้งให้ลูกค้าปลีกของท่านทราบเกี่ยวกับนโยบายการรับประกันความพอใจในผลิตภัณฑ์ของลูกค้าปลีก (“นโยบายการรับประกัน”) ทั้งนี้ ลูกค้าปลีกสามารถคืนผลิตภัณฑ์ได้ภายในเจ็ด (7) วัน นับแต่วันที่ได้รับผลิตภัณฑ์โดยลูกค้าปลีกจะต้องส่งหนังสือแสดงเจตนาภายในระยะเวลาเจ็ด (7) วัน ดังกล่าวมายังนักธุรกิจอิสระ นักธุรกิจอิสระยูนิซิตี้จะต้องทำการคืนเงินเต็มจำนวนที่ลูกค้าจ่ายไปเพื่อซื้อผลิตภัณฑ์ดังกล่าวให้แก่ลูกค้าภายในเวลาสิบห้า (15) วันนับจากวันที่ได้รับหนังสือแสดงเจตนาคืนสินค้า การรับประกันนี้ไม่รวมถึงผลิตภัณฑ์ที่เกิดความเสียหายขึ้นโดยเจตนาหรือการใช้ไม่ถูกต้อง",
        "เมื่อทำการจำหน่ายผลิตภัณฑ์ นักธุรกิจอิสระต้องมอบเอกสารใบเสร็จรับเงินอย่างเป็นทางการของยูนิซิตี้ให้แก่ลูกค้าปลีกพร้อมทั้งระบุชื่อที่อยู่ของลูกค้ารวมทั้งชื่อและหมายเลขประจำตัวนักธุรกิจอิสระยูนิซิตี้ในใบเสร็จให้ครบถ้วน โดยใบเสร็จนี้ต้องมีคำประกาศระบุไว้เป็นลายลักษณ์อักษรด้านหลังที่มีตัวหนังสือที่เห็นเด่นชัดดังต่อไปนี้",
        "",
        "",
        "นักธุรกิจอิสระยูนิซิตี้ซึ่งจำหน่ายผลิตภัณฑ์ดังรายการที่ระบุไว้อีกด้านหนึ่งของใบเสร็จรับเงินนี้ มอบการรับประกันการคืนเงิน 100% ให้แก่ท่านในฐานะลูกค้าปลีกตามนโยบายการรับประกันความพึงพอใจในผลิตภัณฑ์ของลูกค้าปลีกของยูนิซิตี้ ภายในเวลาเจ็ด (7) วันนับจากวันที่ซื้อสินค้า หากท่านไม่พอใจในผลิตภัณฑ์ยูนิซิตี้ที่ซื้อไปไม่ว่าจะด้วยเหตุผลใดก็ตามท่านสามารถทำเรื่องเปลี่ยนผลิตภัณฑ์หรือขอคืนเงินจากนักธุรกิจอิสระยูนิซิตี้ซึ่งทำการจำหน่ายผลิตภัณฑ์ให้กับท่าน นักธุรกิจอิสระยูนิซิตี้จะเปลี่ยนผลิตภัณฑ์หรือมอบเงินคืนเต็มจำนวนให้แก่ท่านตามต้องการภายในเวลาสิบห้า (15) วันนับจากวันที่ทำเรื่องเปลี่ยนผลิตภัณฑ์หรือขอคืนเงิน หลักฐานที่ใช้ในการทำเรื่องขอเปลี่ยนผลิตภัณฑ์หรือขอคืนเงิน ประกอบด้วยใบเสร็จรับเงินที่แจ้งขอยกเลิกหรือขอเปลี่ยนผลิตภัณฑ์ที่ท่านลงนามและระบุเหตุผลที่ท่านต้องการขอยกเลิกหรือเปลี่ยนผลิตภัณฑ์ พร้อมทั้งมอบผลิตภัณฑ์ส่วนที่ยังไม่ได้ใช้และภาชนะบรรจุคืนให้แก่นักธุรกิจอิสระยูนิซิตี้ ภายหลังได้รับผลิตภัณฑ์ที่ขอเปลี่ยนหรือได้รับเงินคืนจากนักธุรกิจอิสระยูนิซิตี้แล้ว ท่านต้องทำหนังสือรับรองว่าท่านได้รับผลิตภัณฑ์ที่ขอเปลี่ยนหรือได้รับเงินคืนเต็มจำนวนดังกล่าวเป็นที่เรียบร้อยมอบให้แก่นักธุรกิจอิสระยูนิซิตี้ นโยบายการรับประกันนี้ให้สิทธิแก่ลูกค้าปลีกเท่านั้นโดยไม่รวมนักธุรกิจอิสระยูนิซิตี้ นอกจากนโยบายการรับประกันที่ระบุไว้ข้างต้นจะไม่มีการรับประกันอื่นใดจากยูนิซิตี้อีก ยูนิซิตี้ไม่มีพันธะรับผิดชอบใดๆ ต่อความเสียหายทั้งในทางตรงและทางอ้อมอันเป็นผลจาก หรือผลเสียหายอันเนื่องมาจากการผิดสัญญาจากการใช้หรือการที่ไม่สามารถใช้ผลิตภัณฑ์ยูนิซิตี้ตามข้อบ่งชี้ หรือคำแนะนำในการใช้ผลิตภัณฑ์ รวมทั้งในกรณีที่ยูนิซิตี้ได้รับแจ้งล่วงหน้าจากลูกค้าปลีกของนักธุรกิจอิสระ ให้ทราบถึงผลเสียหายอันเกิดจากการใช้ผลิตภัณฑ์ที่ผิดจากข้อบ่งชี้หรือคำแนะนำในการใช้ผลิตภัณฑ์หรือการไม่สามารถใช้ผลิตภัณฑ์ตามบ่งชี้หรือคำแนะนำในการใช้ผลิตภัณฑ์ ได้อย่างครบถ้วนก็ตามหากท่านไม่ได้รับความสะดวกโปรดติดต่อแผนก บีเอ เซอร์วิส (BA Service) ของยูนิซิตี้ ทางโทรศัพท์ที่หมายเลข 0-2092-6777 หมายเลขโทรสาร 0-2092-6701 หรือทางเว็บไซท์ www.unicity.com",
        "การแจ้งยกเลิกการสั่งซื้อผลิตภัณฑ์",
        "ท่านอาจมีคำสั่งยกเลิกการสั่งซื้อผลิตภัณฑ์ข้างต้นโดยไม่มีผลอันเป็นภาระผูกพันใดๆ ทั้งสิ้น หากการยกเลิกดังกล่าวมีขึ้นภายในเวลาเจ็ด (7) วันนับแต่วันที่ระบุในใบเสร็จรับเงิน หากท่านยกเลิกคำสั่งซื้อผลิตภัณฑ์ใดๆ และได้ชำระเงินซึ่งมีมูลค่าตามสัญญาขายแล้วท่านจะได้รับเงินคืนภายในเวลาสิบห้า (15) วันทำการนับแต่วันที่นักธุรกิจอิสระยูนิซิตี้ได้รับแจ้งการยกเลิกการสั่งซื้อดังกล่าว และให้ถือว่าผลประโยชน์ใดๆ อันพึงเกิดขึ้นจากธุรกรรมการจำหน่ายผลิตภัณฑ์ดังกล่าวเป็นโมฆะ อนึ่ง ในกรณีที่มีคำสั่งยกเลิก ท่านต้องเตรียมผลิตภัณฑ์ที่ทางนักธุรกิจอิสระยูนิซิตี้จัดส่งให้แก่ท่านภายใต้สัญญาการจำหน่ายผลิตภัณฑ์ฉบับนี้ไว้ให้พร้อม ณ ที่พักอาศัยของท่าน หากท่านได้เตรียมผลิตภัณฑ์ไว้แล้วแต่นักธุรกิจอิสระยูนิซิตี้มิได้รับผลิตภัณฑ์ภายในเวลายี่สิบเอ็ด (21) วันนับแต่วันที่นักธุรกิจอิสระยูนิซิตี้ได้รับแจ้งการยกเลิกการสั่งซื้อ ท่านอาจเก็บรักษาหรือทิ้งผลิตภัณฑ์ดังกล่าวได้ โดยปราศจากข้อผูกพันใดๆ ต่อไป อนึ่งหากท่านมิได้เตรียมผลิตภัณฑ์ให้แก่นักธุรกิจอิสระยูนิซิตี้ หรือหากท่านได้ตกลงที่จะคืนผลิตภัณฑ์ให้แก่นักธุรกิจอิสระยูนิซิตี้ แต่มิได้ปฏิบัติตามเจตนารมณ์เช่นว่านั้น ท่านจักต้องเป็นผู้รับภาระต่างๆ ภายใต้สัญญานี้เอง",
        "",
        "",
        "นโยบายการคืนเงินให้ลูกค้าปลีก",
        "ยูนิซิตี้มีนโยบายให้นักธุรกิจอิสระทำการคืนเงินค่าผลิตภัณฑ์โดยเต็มจำนวน 100% ให้แก่ลูกค้าปลีกในกรณีที่ลูกค้าปลีกได้แจ้งยกเลิกการสั่งซื้อผลิตภัณฑ์ภายในเจ็ด (7) วัน ทั้งนี้นักธุรกิจอิสระยูนิซิตี้จะต้องทำการคืนเงินเต็มจำนวนที่ลูกค้าจ่ายไปเพื่อซื้อผลิตภัณฑ์ดังกล่าวให้แก่ลูกค้าภายในเวลาสิบห้า (15) วันทำการนับจากวันที่ได้รับหนังสือแจ้งยกเลิกการสั่งซื้อผลิตภัณฑ์ ภายหลังยูนิซิตี้จะทำการเปลี่ยนผลิตภัณฑ์หรือคืนเงินตามมูลค่าของสินค้าให้แก่นักธุรกิจอิสระที่ทำการคืนเงินให้กับลูกค้าปลีกตามนโยบายนี้โดยนักธุรกิจอิสระจะต้องยื่นเรื่องขอรับเงินคืนให้แก่ยูนิซิตี้ภายในสามสิบ (30) วันนับจากวันที่ได้รับสินค้าตามที่ได้ระบุไว้ในใบเสร็จรับเงิน โดยยูนิซิตี้จะหักค่าธรรมเนียมในการดำเนินการตามจริงรวมทั้งสิทธิประโยชน์ต่างๆ ที่ได้รับไปก่อนหน้านั้นตามแผนการจ่ายผลตอบแทน หากนักธุรกิจอิสระไม่สามารถปฏิบัติตามนโยบายการรับประกันและการคืนเงินของยูนิซิตี้ และส่งผลให้ยูนิซิตี้เป็นฝ่ายทำการคืนเงินให้ลูกค้าโดยตรง นักธุรกิจอิสระต้องรับผิดชอบต่อการชดใช้คืนให้ยูนิซิตี้โดยเต็มจำนวนพร้อมกับค่าธรรมเนียมในการดำเนินการโดยคิดเป็นสิบเปอร์เซ็นต์ (10%) ของยอดคืนผลิตภัณฑ์ตามราคาที่นักธุรกิจอิสระได้ซื้อไป ทั้งนี้นักธุรกิจอิสระที่ทำเรื่องขอคืนเงินค่าผลิตภัณฑ์ตามนโยบายนี้จะต้องปฏิบัติดังนี้",
        "1) กรอกแบบฟอร์มยื่นคำร้องให้แก่แผนกบีเอ เซอร์วิส (BA Service)",
        "2) นักธุรกิจอิสระส่งคืนผลิตภัณฑ์ พร้อมแนบใบเสร็จรับเงินที่นักธุรกิจอิสระออกให้แก่ลูกค้าปลีก หนังสือแสดงเจตนาพร้อมระบุเหตุผลในการคืนผลิตภัณฑ์จากลูกค้าปลีก ต้นฉบับใบเสร็จรับเงินที่ซื้อผลิตภัณฑ์จากยูนิซิตี้และมีรายการตรงกับผลิตภัณฑ์ที่ต้องการคืน (ใบเสร็จต้องไม่เกินสามสิบวัน (30) วันนับจากวันที่ที่ระบุไว้ในใบเสร็จรับเงิน) และเอกสารอื่นๆ ที่เกี่ยวข้อง",
        "3) ยูนิซิตี้จะพิจารณาและดำเนินการคืนเงินให้แก่นักธุรกิจอิสระภายในสามสิบ (30) วันนับจากวันที่ได้รับเอกสารข้างต้นครบถ้วน"
      ],
      "english": [
        "Retail Purchasing Program",
        "A Retail Customer may order products directly from Unicity pursuant to the ordering guidelines as follows:",
        "1)    The Retail Customer may contact to make an order with Sale Support of Unicity by providing an ID Number of the recommending Distributor. At that time, a unique Customer ID number will be provided exclusively for that Retail Customer.",
        "2)    The responsibility for the proper crediting of Volume generated on any Retail Customer order lies with the referring Distributor and not with Unicity or its employees.",
        "3)    The Distributor is responsible for paying Unicity the expenses of a product return or credit-card chargeback. Should the Retail Customer initiate a product return or credit-card chargeback, the Distributor agrees that Unicity may debit from the Distributor’s cheque/commission all reasonable expenses incurred. Unicity may also suspend the Distributor’s ordering privileges and assess a chargeback handling fee of 1,000 Baht (One thousand Baht).",
        "4)    The difference between the wholesale price and the retail price will be paid to the Distributor in accordance with the Distributor Number notified by the Retail Customer who made the purchase. The Distributor must have PV points at least the minimum requirement under the Compensation Plan in the Volume Month. The Distributor will receive PV points for the purchase made by the retail Customer which the orders are received and paid in the same Volume Month.",
        "",
        "",
        "Retail Customer Product Satisfaction Guarantee",
        "Unicity requires that Distributors provide Retail Customers information regarding the policy on product satisfaction guarantee of Retail Customer (“Guarantee Policy”). In this connection, retail customer can return products within seven (7) days starting from the date of product receiving by Retail Customer by submitting letter of intention within such period of seven (7) days to the Distributor, and Distributor of Unicity shall refund for the full amount of money paid by Retail Customer for such product to the Retail Customer within fifteen (15) days starting from the date of receiving such letter of intention for refund. This guarantee shall not include products damaged by intention or due to incorrect use.",
        "When selling product, the Distributor shall deliver a document of official receipt of Unicity to the Retail Customer, as well as specify the name and the address of Retail Customer, as well as name and ID Number of the Distributor of Unicity in the receipt completely. The receipt shall have notification determined in writing behind clearly with text as follows:",
        "",
        "",
        "Retail Customer Product Satisfaction Guarantee",
        "Distributor of Unicity shall sell products under the list determined on another side of the receipt, providing refund guarantee 100% for you as a retail customer based on the Policy on Product Satisfaction Guarantee of Retail Customer of Unicity within seven (7) days, starting from the date of product receiving. If you are not satisfied with products bought from Unicity in any case, you can request for product change or refund from the Distributor of Unicity selling such product to you. The Distributor of Unicity can change products or refund fully amount money to you as requested within fifteen (15) days starting from the date of such product change or refund request. Proof of evidence used for product change or refund request includes receipt in detail of the product to be cancelled or product to be changed signed by you with reason supporting such cancellation or product change, as well as some unused part of product and containing package must be delivered to the Distributor of Unicity after receiving the product requested to change or refund from a Distributor of Unicity. You must prepare a letter certificating that you have received the product requested to change or refunded with fully amount of money duly provide to the Distributor of Unicity. This guarantee policy provides the entitlement to Retail Customer only, but not for the Distributor of Unicity. Apart from the aforementioned guarantee policy, there shall not be any other guarantee from Unicity anymore. Unicity has no liability to damage either directly or indirectly resulted from or damaged from contract default from the use or incorrect to use Unicity products in accordance with qualifications or instructions for product use, including the case that Unicity has been informed in advance by the Retail Customer of the Distributor of damages caused by the incorrect use of product or inability to use such products consistently with qualifications or instructions for product use completely. Should you have any inconvenience, please contact BA Service of Unicity at Telephone Number 0-2092-6777, Facsimile 0-2092-6701, or website www.unicity.com",
        "",
        "",
        "Notifying Cancellation of Product Order",
        "You may instruct to cancel the aforementioned product order without any liability if such cancellation is made within seven (7) days starting from the date of product receiving. If you have cancelled any product order and made a payment in according to the purchasing contract, you will receive the refund within fifteen (15) days starting from the date that the Distributor of Unicity has been informed of such cancelling order and it shall be deemed that any benefit which may be caused by the transaction of product selling is void. In this connection, in case of any cancellation notification, you have to prepare products delivered to you by the Distributor of Unicity under this product selling contract duly at your resident. If you have prepared such product but the Distributor of Unicity has not retrieved the product within twenty-one (21) days starting from the date that the Distributor of Unicity has received notification of cancellation, you may keep or discard such products without any liability. In this connection, if you do not prepare such product for the Distributor of Unicity, or if you agree to return such product to the Distributor of Unicity but do not comply with such intention, you shall be responsible for any liabilities under this contract.",
        "",
        "",
        "Retail Customer Refund Policy",
        "Unicity requires that Distributors provide Retail Customers a 100% money-back Guarantee in case that the retail customer cancelled product order within seven (7) days starting from the date of product receiving. In this connection, the Distributor of Unicity shall refund full amount of money paid by the Retail Customer for such product purchased to the Retail Customer within fifteen (15) days, starting from the date of receiving a notification of product order cancellation. Later on, Unicity shall change products or make a refund based on product value to the Distributor who refunded such money to Retail Customer in accordance with this policy. The Distributor shall request for refund made to Unicity within thirty (30) days starting from the date of product receiving mentioned in a receipt. Unicity shall deduct processing fee based on actual amount, as well as benefits received previously based on the Award Plan. If the Distributor fails to comply with the guarantee and refund policy of Unicity and such failure causes Unicity to refund money to the Retail Customer directly, the Distributor shall be responsible for the compensation made to Unicity at the full amount of money, together with processing fee accounting for ten percent (10%) of product return balance in accordance with the cost purchased by the Distributor. In this connection, the Distributor requesting for refund of product cost under this policy shall comply with the following provisions.",
        "1)  Filling in the request form and submit to BA Service",
        "2)  The Distributor returns products, attaching with receipt that the Distributor issued for Retail Customer, a notification with reason for product return from Retail Customer, original receipt for product purchased from Unicity showing items consistent with products to be returned (receipt shall not be over thirty (30) days starting from the date of product receiving mentioned in a receipt), and other relevant documents.",
        "3)  Unicity shall consider and process the refund to the Distributor within thirty (30) days starting from the date of receiving the complete set of aforementioned documents.,"
      ]
    }
  }
];
