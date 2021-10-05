import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void addBarcodeNumber() {
    if (bardcodeTextField.text.isNotEmpty && bardcodeTextField.text.isNumericOnly) {
      barcodeList.addIf(!barcodeList.contains(bardcodeTextField.text),
          bardcodeTextField.text);
      bardcodeTextField.text = "";
    }
  }

  void removeBarcodeNumber(int index) {
    FocusManager.instance.primaryFocus?.unfocus();
    barcodeList.removeAt(index);
  }
}
