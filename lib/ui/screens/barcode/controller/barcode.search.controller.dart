import 'dart:convert';

import 'package:dsc_tools/api/api_address.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/barcode_save_response.dart';
import 'package:dsc_tools/models/verify_each_barcode_response.dart';
import 'package:dsc_tools/utilities/keyboard.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import '../../../../utilities/extensions.dart';
import 'barcode.scan.result.controller.dart';

class BarcodeSearchController extends GetxController {
  BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());
  TextEditingController bardcodeTextField = TextEditingController();
  RxString orderNumber = "".obs;
  RxBool isLoading = false.obs;
  RxList<String> barcodeList = <String>[].obs;
  BarCodeSaveResponse? barCodeSaveResponse;
  VerifyEachBarcodeResponse? barCodeVerifyResponse;

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      orderNumber.value = data as String;
    }
  }

  Future<void> scanBarcodeNumber(BuildContext context) async {
    KeyboardUtil.hideKeyboard(context);
    final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancel", false, ScanMode.BARCODE);
    debugPrint(barcodeScanRes);
    if (barcodeScanRes.isEmpty && !barcodeScanRes.isNumberOnly()) {
      SnackbarUtil.showError(
          message: "Order number should only contains numarics.");
      return;
    }
    if (barcodeList.contains(barcodeScanRes)) {
      SnackbarUtil.showWarning(
          message:
              "Barcode number $barcodeScanRes already exists in current product.");
      return;
    }
    addBarcodeNumber(barcodeScanRes);
  }

  void addBarcodeNumber(String barcode) {
    if (barcode.isEmpty && !barcode.isNumberOnly()) {
      SnackbarUtil.showError(
          message: "Order number should only contains numarics.");
      return;
    }
    if (barcodeList.contains(barcode)) {
      SnackbarUtil.showWarning(
          message:
              "Barcode number $barcode already exists in current product.");
      return;
    }
    barcodeList.add(barcode);
    bardcodeTextField.text = "";
  }

  void removeBarcodeNumber(int index) {
    FocusManager.instance.primaryFocus?.unfocus();
    barcodeList.removeAt(index);
  }

  Future<void> saveBarcodeDetails() async {
    try {
      // {"order":"423188055","scan":[{"item":"299900006000"},{"item":"299900006001"},{"item":"299900006002"},{"item":""}],"data":[{"item":"25735","quantity":"0"},{"item":"30266","quantity":"0"},{"item":"24288","quantity":"0"},{"item":"22375","quantity":"0"},{"item":"19236","quantity":"0"},{"item":"23256","quantity":"0"},{"item":"34222","quantity":"0"}],"cus_code":"WCCM"}
      final List<Map<String, dynamic>> scanNumbers = [];
      final List<Map<String, dynamic>> allProducts = [];
      for (final i in controller.barcodeItems!.items) {
        allProducts.add({"item": i.code, "quantity": i.qty});
      }
      for (final i in barcodeList) {
        scanNumbers.add({"item": i});
      }
      isLoading.toggle();
      final Map<String, dynamic> saveRequest = {
        "order": controller.orderNumber.value,
        "scan": scanNumbers,
        "data": allProducts,
        "cus_code": Globals.customerPoCode
      };
      final Map<String, dynamic> verifyRequest = {
        "order": allProducts,
        "scan": scanNumbers,
        "orderNumber": controller.orderNumber.value
      };
      barCodeVerifyResponse = await MemberCallsService.init()
          .verifyEachBarcodeNumber(
              gTokenBarcodeNew, "", json.encode(verifyRequest));
      final dynamic saveBarcodeRes = await MemberCallsService.init()
          .saveBarcodeNumber(
              "_ga=GA1.2.1316239299.1632121654; PHPSESSID=dbpq6231h0pe0v9hc0oav8brm5; _gid=GA1.2.1688805920.1633324197; __cf_bm=Ss938oGvx.NVsHwWkudfJe6vqoHmaP5Pik.s7_u5uXk-1633603833-0-Af+WI9XAvMJQDtbavfyymnV3oAFL8/BObDZYzqVhG6rQSOG5g5dBOKOAr4cOqAqtzJe9teA0d3UQY+kwgpJfyEg8mqnNIU7JsjZKGfjgbgyFhf7tvGUugvLv26KRsBKmeA==",
              "",
              "en",
              json.encode(saveRequest));
      barCodeSaveResponse = BarCodeSaveResponse.fromJson(
          json.decode(saveBarcodeRes as String) as Map<String, dynamic>);
      // on success barcode scan
      if (barCodeSaveResponse!.success &&
          barCodeSaveResponse!.validateResult.success == "true" &&
          barCodeSaveResponse!.validateResult.errorMessages!.isEmpty) {
        SnackbarUtil.showError(message: "Barcode scan success!", duration: 10);
        controller.getBarcodePath();
        Get.back();
      } else if (barCodeSaveResponse!.errorMessages.isNotEmpty) {
        final errors = StringBuffer();
        for (final err in barCodeSaveResponse!.errorMessages) {
          errors.write("\n $err");
        }
        SnackbarUtil.showError(message: errors.toString(), duration: 10);
      }
      isLoading.toggle();
      // Get.back();
    } catch (e, s) {
      debugPrint(e.toString());
      isLoading.toggle();
      LoggerService.instance.e(s);
    }
  }
}
