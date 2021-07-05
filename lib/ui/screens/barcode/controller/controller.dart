import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/ui/screens/webview/webview.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/Logger/logger.dart';

class BarcodeController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isInvalidOrderId = false.obs;

  OrderLines allEasyShipOrders = OrderLines(items: []);

  Future<void> getBarcodePath({String userId = "3011266"}) async {
    const String token = "2096fb4a-783d-4b60-baec-f5880bab1e7a";
    String barcodePath = "";
    loading(true);
    update();
    try {
      final dynamic res = await MemberCallsService.init().getBarcodePath("en", bardcodeTextField.text, token, userId);
      final String barcodeUrl = res.toString();
      print(barcodeUrl);
      WebivewHomeScreen(url:barcodePath);
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }
}
