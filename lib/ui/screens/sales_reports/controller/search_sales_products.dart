import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../models/sales_report_item_item.dart';
import '../../../../models/sales_report_order_item.dart';
import '../../../../models/sales_report_rma_item.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/snackbar.dart';
import '../component/sales_report_search_result.dart';
import 'salesreports.home.controller.dart';

class SalesReportSearchController extends GetxController {
  SalesReportHomeController controller = Get.put(SalesReportHomeController());

  TextEditingController searchTextController = TextEditingController();
  RxList<String> searchHistory = <String>[].obs;
  final store = GetStorage();

  @override
  void onInit() {
    getSearchHistory();
    super.onInit();
  }

  void searchOrder(String orderId) {
    switch (controller.activeStockType.value.value) {
      case "order":
        final SalesReportOrderItem? orderItem = controller.allSalesReports
            .firstWhereOrNull((order) =>
                order.orderNumber == orderId || order.customer == orderId);
        if (orderItem != null && orderItem.orderNumber.isNotEmpty) {
          final Map<String, dynamic> args = {
            "type": "order",
            "data": orderItem
          };
          Get.to(() => SalesReportSearchResult(), arguments: args);
        } else {
          SnackbarUtil.showWarning(
              message: "${"sorry_no_report_found_with_report_id".tr}: $orderId");
        }
        break;
      case "rma":
        final SalesReportRmaItem? rmaItem = controller.allSalesRmaReports
            .firstWhereOrNull((order) =>
                order.orderNumber.retrieveBarcode() == orderId ||
                order.rmaOrderNumber.retrieveBarcode() == orderId);
        if (rmaItem != null && rmaItem.orderNumber.isNotEmpty) {
          final Map<String, dynamic> args = {"type": "rma", "data": rmaItem};
          Get.to(() => SalesReportSearchResult(), arguments: args);
        } else {
          SnackbarUtil.showWarning(
              message: "${"sorry_no_report_found_with_report_id".tr}: $orderId");
        }
        break;
      case "item":
        final SalesReportItemItem? item = controller.allSalesItemReports
            .firstWhereOrNull((order) => order.itemCode == orderId);
        if (item != null && item.itemCode.isNotEmpty) {
          final Map<String, dynamic> args = {"type": "item", "data": item};
          Get.to(() => SalesReportSearchResult(), arguments: args);
        } else {
          SnackbarUtil.showWarning(
              message: "${"sorry_no_report_found_with_report_id".tr}: $orderId");
        }
        break;
    }
  }

  // Retrieves and Sets language based on device settings
  Future<void> addSearchItem(String value) async {
    if (value.isEmpty) return;
    final isFound = searchHistory.contains(value);
    searchOrder(value);
    if (isFound) return;
    searchHistory.add(value);
    await store.write('salesreport_search_history', searchHistory);
    update();
  }

  // Gets current language stored
  RxList<String> get getSearchHistory {
    final history = store.read('salesreport_search_history');
    if (history != null) {
      final local = RxList<String>.from(history as List<dynamic>);
      // final  local = history as RxList<String>;
      searchHistory.addAll(local);
    }
    return searchHistory;
  }

  // clear all search history
  Future<void> clearHistory() async {
    searchHistory.clear();
    await store.remove('salesreport_search_history');
    update();
  }
}
