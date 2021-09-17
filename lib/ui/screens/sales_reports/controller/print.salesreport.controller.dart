import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../../api/api_address.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/user_session.dart';

class PrintSalesReportController extends GetxController {
  RxBool isLoading = false.obs;

  RxString orderHref = "".obs;
  RxString orderId = "".obs;
  final String printUrl = ""
      "${Address.dscHome}invoice.php?token=${UserSessionManager.shared.customerToken.token}";

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      final Map<String, dynamic> args = data as Map<String, dynamic>;
      isLoading.toggle();
      orderHref.value = "$printUrl&link=${args["href"]}";
      if (args["readyUrl"] == true) {
        orderHref.value = args["href"] as String;
      }
      orderId.value = "${args["orderId"]}";
    }
    super.onInit();
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderHref}) async {
    //  https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f75270eabace2d169ad5bfab2c45959ff3de&token=08b438b3-5326-45d7-9cc9-f4f3299bae5c
    final String imgUrl =
        "${Address.dscHome}invoice.php?link=$orderHref&token=${UserSessionManager.shared.customerToken.token}";
    try {
      isLoading.toggle();
      final Dio dio = Dio();
      final response = await dio.get(imgUrl);
      isLoading.toggle();
      await Printing.layoutPdf(
          dynamicLayout: false,
          onLayout: (PdfPageFormat format) async => Printing.convertHtml(
                format: format,
                html: response.data.toString(),
              ));
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }
}
