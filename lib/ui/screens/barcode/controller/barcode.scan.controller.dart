import 'package:dsc_tools/ui/screens/barcode/screens/barcode_check_result.dart';
import 'package:dsc_tools/ui/screens/barcode/screens/barcode_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BarcodeScannerController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool loading = false.obs;

  Future<void> scanBarcode() async {
    Get.to(() => BarcodeCheckResult());
    return;
    final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancel", false, ScanMode.BARCODE);
    debugPrint(barcodeScanRes);
  }
}
