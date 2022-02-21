import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/values/colors.dart';
import '../../../../data/enums.dart';
import '../../../../utils/images.dart';
import '../../../../widgets/text_view.dart';
import '../../print_sales_report/controller/print.salesreport.controller.dart';

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
                  text: "${"order_id"}: ${controller.orderId}",
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
            initialUrl: controller.orderHref.value, //controller.orderHref.value
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) => controller.isLoading.value = false,
          ),
        )
      ],
    );
  }
}
