import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/print.salesreport.controller.dart';

class SaleReportBody extends StatelessWidget {
  final PrintSalesReportController controller =
      Get.put(PrintSalesReportController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          alignment: Alignment.center,
          color: const Color(0xFFE3E8ED),
          child: Text("Order ID: ${controller.orderId}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: const Color(0xFF606975))),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: WebView(
            initialUrl: controller.orderHref.value,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) => controller.isLoading.value = false,
          ),
        )
      ],
    );
  }
}
