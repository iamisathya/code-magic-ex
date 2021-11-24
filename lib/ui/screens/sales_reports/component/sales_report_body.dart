import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/images.dart';
import '../../../global/theme/text_view.dart';
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
          color: AppColor.sunglow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  text: "Order ID: ${controller.orderId}", //! hardcoded
                  style: TextTypes.bodyText1,
                  color: AppColor.charcoal),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () => controller.proceedToPrint(context,
                      orderHref: controller.orderHref.value),
                  child: SvgPicture.asset(kPrintIcon,
                      color: AppColor.charcoal,
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
