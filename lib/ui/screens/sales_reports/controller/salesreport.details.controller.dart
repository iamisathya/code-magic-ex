import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/sales_report_details.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:get/get.dart';

class SalesReportDetailsController extends GetxController {
  RxString orderCode = "".obs;
  RxString orderNumber = "".obs;
  RxBool isLoading = false.obs;
  SalesReportDetails? salesReportDetails;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      final args = data as Map<String, dynamic>;
      orderCode.value = args["orderCode"] as String;
      orderNumber.value = args["orderId"] as String;
      getOpenPlaceOrderDetails(orderCode.value);
    }
    super.onInit();
  }

  int get listSize => salesReportDetails?.lines.items.length ?? 0;
  
  List<Items> get products => salesReportDetails?.lines.items ?? [];

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
