import 'package:get/get.dart';

import '../controller/print.salesreport.controller.dart';

class PrintSalesReportBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrintSalesReportController());
  }
}