import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../../../data/model/barcode_item_response.dart';
import '../../../data/model/barcode_response.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/extensions.dart';
import '../../../utils/keyboard.dart';
import '../../../utils/logger.dart';
import '../../../utils/snackbar.dart';

class BarcodeScannerController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool isLoading = false.obs;
  BarcodeResponse? barcodeDetails;
  BarCodeItemsResponse? barcodeItems;
  RxString orderUrl = "".obs;

  @override
  void onInit() {
    setupInitState();
    onRecieveArgs();
    super.onInit();
  }

  void onRecieveArgs() {
    try {
      final dynamic data = Get.arguments;
      if (data != null) {
        bardcodeTextField.text = data as String;
      }
    } catch (e, stack) {
      LoggerService.instance.e(e, stack);
    }
  }

  void setupInitState() {
    if (!kReleaseMode) {
      bardcodeTextField.text = "423198958";
    }
  }

  Future<void> scanBarcode(BuildContext context) async {
    KeyboardUtil.hideKeyboard(context);
    final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "cancel".tr, false, ScanMode.BARCODE);
    if (barcodeScanRes == "-1") return;
    debugPrint(barcodeScanRes);
    getBarcodePath(context, barcodeScanRes);
  }

  Future<void> getBarcodePath(BuildContext context, String orderNumber) async {
    if (orderNumber.isEmpty && !orderNumber.isNumberOnly()) {
      SnackbarUtil.showError(message: "order_contains_numaric_only".tr);
      return;
    }
    Get.toNamed(Routes.BARCODE_DETAILS, arguments: bardcodeTextField.text);
  }
}
