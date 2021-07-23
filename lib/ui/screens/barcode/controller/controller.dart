import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class BarcodeController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isInvalidOrderId = false.obs;
  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  OrderLines allEasyShipOrders = OrderLines(items: []);

  Future<void> getBarcodePath(BuildContext context,
      {String userId = "3011266"}) async {
    const String token = kLoginToken;
    String barcodePath = "";
    errorMessage.value = "";
    _sendingMsgProgressBar.show(context);
    try {
      final dynamic res = await MemberCallsService.init()
          .getBarcodePath("en", bardcodeTextField.text, token, userId);
      final Map<String, dynamic> barcodeObjected = res as Map<String, dynamic>;
      barcodePath = barcodeObjected["links"].toString();
      _launchURL(barcodePath);
      _sendingMsgProgressBar.hide();
      return;
      // Get.to(WebivewHomeScreen(
      //   url: barcodePath,
      //   title: bardcodeTextField.text,
      // ));
    } catch (err) {
      errorMessage.value = err.toString();
      LoggerService.instance.e(err.toString());
      _sendingMsgProgressBar.hide();
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
