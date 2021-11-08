import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          color: const Color(0xFFFFBF3A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  text: "Order ID: ${controller.orderId}", //! hardcoded
                  style: TextTypes.bodyText1,
                  color: const Color(0xFF384250)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () => controller.proceedToPrint(context,
                      orderHref: controller.orderHref.value),
                  child: SvgPicture.asset(kPrintIcon,
                      color: const Color(0xFF384250),
                      width: 20,
                      semanticsLabel: 'print icon'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: WebView(
            initialUrl: "https://google.com", //controller.orderHref.value
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) => controller.isLoading.value = false,
          ),
        )
      ],
    );
  }
}
