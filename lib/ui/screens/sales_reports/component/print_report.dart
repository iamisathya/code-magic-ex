import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../open_po/order_create/component/loader.dart';
import '../controller/print.salesreport.controller.dart';
import 'sales_report_body.dart';

class PrintSalesReport extends StatelessWidget {
  static const String routeName = '/printSalesReportPage';

  final PrintSalesReportController controller =
      Get.put(PrintSalesReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sales_report".tr,
              style: Theme.of(context).textTheme.headline4),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.print_outlined,
              ),
              tooltip: 'print'.tr,
              onPressed: () => controller.proceedToPrint(context,
                  orderHref: controller.orderHref.value),
            ),
          ],
        ),
        body: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            progressIndicator: const Loader(),
            child: SaleReportBody())));
  }
}
