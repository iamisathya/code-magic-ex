import 'dart:convert';
import 'dart:math';

import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/exceptions/default.exception.dart';
import 'package:code_magic_ex/exceptions/internet_failed.exception.dart';
import 'package:code_magic_ex/exceptions/not_found.exception.dart';
import 'package:code_magic_ex/exceptions/time_out.exception.dart';
import 'package:code_magic_ex/exceptions/unauthorised.exception.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';

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
    return (double.parse(quantity) * price).toInt().toString();
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
