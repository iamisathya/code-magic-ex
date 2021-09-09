import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/print.salesreport.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'sales_report_body.dart';

class PrintSalesReport extends StatelessWidget {
  static const String routeName = '/printSalesReportPage';

  final PrintSalesReportController controller =
      Get.put(PrintSalesReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sales Report",
              style: Theme.of(context).textTheme.headline4),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.print_outlined,
              ),
              tooltip: 'Print',
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
