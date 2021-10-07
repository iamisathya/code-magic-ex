import 'package:dsc_tools/utilities/keyboard.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import '../../../../utilities/extensions.dart';

class BarcodeSearchController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxString orderNumber = "".obs;
  RxBool isLoading = false.obs;
  RxList<String> barcodeList = <String>[].obs;

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
}
