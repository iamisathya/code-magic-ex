import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../api/config/member_class.dart';
import '../../../../models/order_lines.dart';
import '../../../../utilities/Logger/logger.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/overlay_progress.dart';

class BarcodeController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isInvalidOrderId = false.obs;
  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  OrderLines allEasyShipOrders = OrderLines(items: []);

  Future<void> getBarcodePath(BuildContext context,
      {String userId = "2970466"}) async {
    final String token = UserSessionManager.shared.customerToken.token;
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

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
