import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/values/colors.dart';
import '../core/values/endpoints.dart';
import '../data/enums.dart';
import '../data/model/country_details.dart';
import '../data/model/error_error_message.dart';
import '../data/model/inventory_item_v2.dart';
import '../data/model/inventory_records.dart';
import '../data/model/locale.dart';
import '../data/provider/globals.dart';
import '../helpers/exceptions/default.exception.dart';
import '../helpers/exceptions/internet_failed.exception.dart';
import '../helpers/exceptions/time_out.exception.dart';
import '../helpers/exceptions/unauthorised.exception.dart';
import '../modules/login/login_home/login_home.dart';
import '../widgets/overlay_progress.dart';
import 'logger.dart';
import 'parsing.dart';
import 'snackbar.dart';
import 'user_session.dart';

void renderErrorSnackBar(
    {String title = "", String subTitle = "", bool isError = true}) {
  final Color c = Theme.of(Get.context!).colorScheme.onPrimary;
  // isError == true ? Theme.of(Get.context!).colorScheme.onError : Theme.of(Get.context!).colorScheme.primary;
  return Get.snackbar(
    title,
    subTitle,
    titleText: Text(title,
        style: TextStyle(color: c, fontSize: 16, fontWeight: FontWeight.bold)),
    messageText: Text(subTitle, style: TextStyle(color: c, fontSize: 14)),
    backgroundColor: Theme.of(Get.context!).colorScheme.background,
    borderColor: c,
    animationDuration: const Duration(milliseconds: 300),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10.0,
    borderWidth: 1,
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

String calculateTotalPriceFromInventoryItemV2(
    InventoryItemV2 inventoryRecords, String type) {
  double total = 0.0;
  // looping over data array
  for (final item in inventoryRecords.items!) {
    total += Parsing.intFrom(item.quantityOnHand)! *
        (type == "pv" ? item.terms!.pvEach! : item.terms!.priceEach!);
  }
  return total.toInt().toString();
}

String calculateInventoryTotal(
    List<InventoryItem> inventoryItems, String type) {
  double total = 0.0;
  // looping over data array
  for (final item in inventoryItems) {
    total += Parsing.intFrom(item.quantityOnHand)! *
        (type == "pv" ? item.terms!.pvEach! : item.terms!.priceEach!);
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
      String errorMsg = getErrorMessage(response.data);
      if (errorMsg == "Invalid Bearer Token.") {
        UserSessionManager.shared.removeUserInfoFromDB();
        SnackbarUtil.showError(title: 'Session expired!', message: errorMsg);
        return Get.offAll(() => LoginScreen(),
            arguments: true, transition: Transition.cupertino);
      } else if (errorMsg == "Unauthorized") {
        SnackbarUtil.showWarning(
            title: errorMsg, message: "invalid_credentials".tr);
        errorMsg = "invalid_credentials".tr;
      }
      throw UnauthorisedException(message: errorMsg);
    case 403:
      throw UnauthorisedException(message: response.data.toString());
    case 404:
      String errorMsg = getErrorMessageWithKey(response.data, "message");
      if (errorMsg == "Unauthorized") {
        errorMsg = "invalid_credentials".tr;
        SnackbarUtil.showWarning(title: 'Unauthorized', message: errorMsg);
      }
      if (errorMsg == "Not Found") {
        errorMsg = getErrorMessage(response.data);
        SnackbarUtil.showWarning(title: 'Not Found', message: errorMsg);
      }
      throw UnauthorisedException(message: errorMsg);
    case 408:
      throw TimeOutException(message: response.data.toString());
    case 500:
      throw InternetFailedException(
          message: '${"internal_server_error".tr}: ${response.statusCode}');
    case 503:
      throw InternetFailedException(
          message: '${"service_unavailable".tr}: ${response.statusCode}');
    case 524:
      throw TimeOutException(
          message: '${"server_timeout".tr}: ${response.statusCode}');
    default:
      throw InternetFailedException(
          message: '${"internal_server_error".tr}: ${response.statusCode}');
  }
}

void showAlertDialog(BuildContext context,
    {String cancel = "",
    String ok = "",
    String title = "",
    String subtitle = "",
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

Future<CountryDetails> getCountryCode(String countryCode) async {
  try {
    final String countries =
        await rootBundle.loadString('assets/json/country_state.json');
    final List<dynamic> parsedListJson = jsonDecode(countries) as List<dynamic>;
    final List<CountryDetails> itemsList = List<CountryDetails>.from(
        parsedListJson
            .map((i) => CountryDetails.fromJson(i as Map<String, dynamic>)));
    final CountryDetails item =
        itemsList.firstWhere((element) => element.code == countryCode);
    return item;
  } catch (e) {
    debugPrint(e.toString());
    return CountryDetails(alpha3Code: "THA", code: "TH");
  }
}

String? returnNullOrValue(String? o) => o != null ? (o == "" ? null : o) : null;

String getErrorMessage(dynamic error) {
  try {
    final mappedObj = error as Map<String, dynamic>;
    final object = ErrorMessage.fromJson(mappedObj);
    return returnNullOrValue(object.error.error) ??
        returnNullOrValue(object.error.errorMessage) ??
        returnNullOrValue(object.error.message) ??
        "";
  } catch (e) {
    return "";
  }

  // return mappedObj["error"]["error_message"].toString();
}

String getItemsErrorMessage(dynamic error) {
  final mappedObj = error as Map<String, dynamic>;
  return mappedObj["items"]["error"]["error_message"].toString();
}

String getErrorMessageWithKey(dynamic error, String key) {
  final mappedObj = error as Map<String, dynamic>;
  return mappedObj["error"][key].toString();
}

void onDioError(DioError e, ProgressBar progressBar, RxString error) {
  progressBar.hide();
  error(e.error.toString());
  final String message = getErrorMessage(e.response!.data);
  renderErrorSnackBar(
      title: "${e.response!.statusCode} ${"error!".tr}", subTitle: message);
  returnResponse(e.response!);
}

void onCatchError(Object err, ProgressBar progressBar, RxString error) {
  error(err.toString());
  renderErrorSnackBar(
      title: "error!".tr, subTitle: "error_getting_user_details".tr);
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
    {String title = "",
    String message = "",
    SnackBarType type = SnackBarType.success}) {
  final Color color = type == SnackBarType.success
      ? Theme.of(Get.context!).colorScheme.secondary
      : type == SnackBarType.error
          ? Colors.red
          : Colors.yellow;
  Get.snackbar("", "no_data_found_in_table".tr,
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
        .log("${"error_reading_base64_msg".tr}$e"); //!Error
    debugPrint('${"error_reading_base64_msg".tr}$e'); //!Error
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
    throw "${"could_not_launch".tr} $url";
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


LocaleType getLocaleFromString(String language) {
  switch (language) {
    case 'en':
      return LocaleType.en;
    case 'th':
      return LocaleType.th;
    case 'lo':
      return LocaleType.en;
    case 'kh':
      return LocaleType.kh;
    case 'km':
      return LocaleType.en;
    case 'ms':
      return LocaleType.en;
    default:
      return LocaleType.en;
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[AppColor.blueYonder, AppColor.tuftsBlue, AppColor.buttonBlue],
).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 54.0));

Future<void> proceedPrinting() async {
  const String logoPath = '../../img/header-logo.png';
  const String logoUrl =
      'https://firebasestorage.googleapis.com/v0/b/dsc-tools.appspot.com/o/header-logo.jpg?alt=media&token=aecd5af7-603c-4dc9-bf4a-2f6b837de0fe';
  const String backgroundColor = 'background: rgb(204,204,204);';
  const String alternativeName = 'alt="Unicity Shopping"';
  const String dimensionForImage =
      'alt="Unicity Shopping" width="81" height="80"';
  try {
    final Dio dio = Dio();
    final response =
        await dio.get("${Endpoints.inventoryPrint}=${Globals.userId}");
    final removedBackground = response
        .toString()
        .replaceAll(backgroundColor, '')
        .replaceAll(logoPath, logoUrl)
        .replaceAll(alternativeName, dimensionForImage);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => Printing.convertHtml(
              format: format,
              html: removedBackground,
            ));
  } catch (err) {
    SnackbarUtil.showError(message: "error".tr);
  }
}
