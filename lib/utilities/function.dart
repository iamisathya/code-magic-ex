import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:code_magic_ex/models/locale.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../exceptions/default.exception.dart';
import '../exceptions/internet_failed.exception.dart';
import '../exceptions/not_found.exception.dart';
import '../exceptions/time_out.exception.dart';
import '../exceptions/unauthorised.exception.dart';
import '../models/inventory_records.dart';
import '../ui/global/widgets/overlay_progress.dart';
import '../ui/screens/login/login.dart';
import 'Logger/logger.dart';
import 'constants.dart';
import 'core/parsing.dart';
import 'enums.dart';
import 'user_session.dart';

void renderErrorSnackBar(
    {String title = "", String subTitle = "", bool isError = true}) {
  final Color c = isError == true ? Colors.red : kMainColor;
  return Get.snackbar(
    title,
    subTitle,
    titleText: Text(title,
        style: TextStyle(color: c, fontSize: 16, fontWeight: FontWeight.bold)),
    messageText: Text(subTitle, style: TextStyle(color: c, fontSize: 14)),
    backgroundColor: Colors.white,
    borderColor: c,
    animationDuration: const Duration(milliseconds: 300),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10.0,
    borderWidth: 2,
    icon: Icon(
      Icons.error_outline,
      color: c,
    ),
  );
}

String calculateTotalAmount({required String quantity, required double price}) {
  try {
    return NumberFormat().format((double.parse(quantity) * price).toInt());
  } catch (e) {
    return price.toString();
  }
}

String calculateTotalPrice(InventoryRecords inventoryRecords, String type) {
  double total = 0.0;
  // looping over data array
  for (final item in inventoryRecords.items) {
    total += Parsing.intFrom(item.quantityOnHand)! *
        (type == "pv" ? item.terms.pvEach : item.terms.priceEach);
  }
  return total.toInt().toString();
}

String generateRandomString(int length) {
  const _chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  final Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

dynamic returnResponse(dio.Response response) {
  switch (response.statusCode) {
    case 200:
      final responseJson = json.decode(response.data.toString());
      debugPrint(responseJson.toString());
      return responseJson;
    case 400:
      throw DefaultException(message: response.data.toString());
    case 401:
      final String errorMsg = getErrorMessage(response.data);
      if (errorMsg == "Invalid Bearer Token.") {
        UserSessionManager.shared.removeUserInfoFromDB();
        return Get.offAll(() => LoginScreen(),
            arguments: true, transition: Transition.cupertino);
      }
      throw UnauthorisedException(message: response.data.toString());
    case 403:
      throw UnauthorisedException(message: response.data.toString());
    case 404:
      throw NotFoundException(message: response.data.toString());
    case 408:
      throw TimeOutException(message: response.data.toString());
    case 500:
      throw InternetFailedException(
          message: 'Internal Server Error: ${response.statusCode}');
    case 503:
      throw InternetFailedException(
          message: 'Service Unavailable: ${response.statusCode}');
    default:
      throw InternetFailedException(
          message: 'Internal Server Error: ${response.statusCode}');
  }
}

void showAlertDialog(BuildContext context,
    {String cancel = "Cancel",
    String ok = "Continue",
    String title = "AlertDialog",
    String subtitle = "Would you like to continue?",
    required Function onOk,
    required Function onCancel}) {
  // set up the buttons
  final Widget cancelButton = TextButton(
    onPressed: () => onCancel,
    child: Text(cancel),
  );
  final Widget continueButton = TextButton(
    onPressed: () => onOk,
    child: Text(ok),
  );

  // set up the AlertDialog
  final AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(subtitle),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getErrorMessage(dynamic error) {
  final mappedObj = error as Map<String, dynamic>;
  return mappedObj["error"]["error_message"].toString();
}

void onDioError(DioError e, ProgressBar progressBar, RxString error) {
  progressBar.hide();
  error(e.error.toString());
  final String message = getErrorMessage(e.response!.data);
  renderErrorSnackBar(
      title: "${e.response!.statusCode} Error!", subTitle: message);
  returnResponse(e.response!);
}

void onCatchError(Object err, ProgressBar progressBar, RxString error) {
  error(err.toString());
  renderErrorSnackBar(
      title: "Error!", subTitle: "Error while getting user details!");
  LoggerService.instance.e(err.toString());
  progressBar.hide();
}

String getUniqueId(String href) {
  //* getting loginToken by fetching string after last slash /
  final String loginToken =
      href.substring(href.lastIndexOf("/") + 1, href.length);
  return loginToken;
}

void renderGetSnackbar(
    {String title = "Error!",
    String message = "Unexpcted error occured. Please try later!",
    SnackBarType type = SnackBarType.success}) {
  final Color color = type == SnackBarType.success
      ? kMainColor
      : type == SnackBarType.error
          ? Colors.red
          : Colors.yellow;
  Get.snackbar("Empty table!", "No data found in table.",
      snackPosition: SnackPosition.BOTTOM,
      overlayColor: color,
      backgroundColor: Colors.white,
      borderColor: color,
      borderWidth: 2,
      colorText: color,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(Icons.error, color: color));
}

Future<String?> readFileByte(String filePath) async {
  String? base64Image;
  try {
    final Uri myUri = Uri.parse(filePath);
    final File audioFile = File.fromUri(myUri);
    final List<int> imageBytes = audioFile.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
  } catch (e) {
    FirebaseCrashlytics.instance
        .log("Error while reading base64 from file path:$e");
    debugPrint('Error while reading base64 from file path:$e');
  }
  return base64Image;
}

String getCurrentPeriod() {
  try {
    return DateFormat("yyyy-MM").format(DateTime.now()); // => 21-04-2019
  } catch (e) {
    return "";
  }
}

String prepareNotes(String userId, String countryId) {
  final String device = Platform.isAndroid ? "android" : "ios";
  try {
    return "shopping|dsc|mobile app|tha||$userId|$device";
  } catch (e) {
    return "shopping|dsc|mobile app|unknown|$device";
  }
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}

String currency(BuildContext context) {
  final Locale locale = Localizations.localeOf(context);
  final format = NumberFormat.simpleCurrency(locale: locale.toString());
  return format.currencySymbol;
}



LocaleModel getLocale(LocaleTypes type) {
  switch (type) {
    case LocaleTypes.en:
      return LocaleModel(language: "en", location: "US");
    case LocaleTypes.th:
      return LocaleModel(language: "th", location: "TH");
    case LocaleTypes.lo:
      return LocaleModel(language: "lo", location: "LA");
    case LocaleTypes.km:
      return LocaleModel(language: "km", location: "KH");
    case LocaleTypes.ms:
      return LocaleModel(language: "ms", location: "MY");    
    default:
      return LocaleModel(language: "en", location: "US");
  }
}