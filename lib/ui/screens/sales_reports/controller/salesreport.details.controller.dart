import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/sales_report_details.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:get/get.dart';

class SalesReportDetailsController extends GetxController {
  RxString orderCode = "".obs;
  RxBool isLoading = false.obs;
  SalesReportDetails? salesReportDetails;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      orderCode.value = data as String;
      getOpenPlaceOrderDetails(orderCode.value);
    }
    super.onInit();
  }

  Future<void> getOpenPlaceOrderDetails(String orderCode) async {
    isLoading.toggle();
    try {
      // * Getting order id from getOpenOrderId API - 203
      salesReportDetails =
          await ApiService.shared().salesReportDetails(orderCode);
      isLoading.toggle();
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }
}
