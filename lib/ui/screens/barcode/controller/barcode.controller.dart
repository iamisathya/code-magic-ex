import 'package:dsc_tools/api/config/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/order_lines.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/overlay_progress.dart';

class BarcodeController extends GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  RxBool loading = false.obs;
  RxBool onSubmit = false.obs;
  RxString errorMessage = "".obs;
  RxBool isInvalidOrderId = false.obs;
  final ProgressBar _sendingMsgProgressBar = ProgressBar();
  final formKey = GlobalKey<FormState>();

  OrderLines allEasyShipOrders = OrderLines(items: []);

  Future<void> getBarcodePath(BuildContext context,
      {String userId = "2970466"}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
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
    } catch (err) {
      errorMessage.value = err.toString();
      LoggerService.instance.e(err.toString());
      _sendingMsgProgressBar.hide();
    }
  }

  String? validateBarocde() {
    if (!(bardcodeTextField.text.length > 3) &&
        bardcodeTextField.text.isNotEmpty) {
      return "Barcode should not be empty!";
    }
    return null;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw "Could not launch $url";
    }
  }
}
