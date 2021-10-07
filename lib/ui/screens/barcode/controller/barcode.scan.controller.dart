import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../../../../models/barcode_item_response.dart';
import '../../../../models/barcode_response.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/keyboard.dart';
import '../../../../utilities/snackbar.dart';
import '../screens/barcode_details.dart';

class BarcodeScannerController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool isLoading = false.obs;
  BarcodeResponse? barcodeDetails;
  BarCodeItemsResponse? barcodeItems;
  RxString orderUrl = "".obs;

  @override
  void onInit() {
    bardcodeTextField.text = "423188055";
    super.onInit();
  }

  Future<void> scanBarcode(BuildContext context) async {
    KeyboardUtil.hideKeyboard(context);
    final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancel", false, ScanMode.BARCODE);
    debugPrint(barcodeScanRes);
    getBarcodePath(context, barcodeScanRes);
  }

  Future<void> getBarcodePath(BuildContext context, String orderNumber) async {
    if (orderNumber.isEmpty && !orderNumber.isNumberOnly()) {
      SnackbarUtil.showError(message: "Order number should only contains numarics.");
      return;
    }
    Get.to(() => BarCodeDetails(), arguments: bardcodeTextField.text);
  }
}
