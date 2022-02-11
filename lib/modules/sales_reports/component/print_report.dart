import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../open_po/order_create/component/loader.dart';
import '../controller/print.salesreport.controller.dart';
import 'sales_report_body.dart';

class PrintSalesReport extends StatelessWidget {
  final PrintSalesReportController controller =
      Get.put(PrintSalesReportController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("sales_report".tr,
                style: Theme.of(context).textTheme.headline4),
            actions: [
              if (controller.showPrintIcon.value)
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
          body: SaleReportBody(),
        ),
      ),
    );
  }
}
