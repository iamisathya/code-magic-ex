import 'package:dsc_tools/models/open_po.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/open_po_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'openpo.list.controller.dart';

class OpenPoSearchController extends GetxController {
  OpenPoListController controller = Get.put(OpenPoListController());

  TextEditingController searchTextController = TextEditingController();
  RxList<String> searchHistory = <String>[].obs;
  final store = GetStorage();

  @override
  void onInit() {
    getSearchHistory();
    super.onInit();
  }

  void searchOrder(String orderId) {
    final OpenPO order = controller.openPlaceOrders.firstWhere(
        (order) => order.orderOpid == orderId,
        orElse: () => OpenPO());
    if (order.orderOpid.isNotEmpty) {
      Get.to(() => OpenPODetailsPage(), arguments: order.orderOpid);
    }
  }

  // Retrieves and Sets language based on device settings
  Future<void> addSearchItem(String value) async {
    final isFound = searchHistory.contains(value);
    if (value.isEmpty || isFound) return;
    searchHistory.add(value);
    await store.write('openpo_search_history', searchHistory);
    update();
  }

  // Gets current language stored
  RxList<String> get getSearchHistory {
    final history = store.read('openpo_search_history');
    debugPrint(history);
    if (history != null) {
      final  local = history as List<dynamic>;
      local.map((e) => searchHistory.add(e as String));
    }
    searchHistory.refresh();
    update();
    return searchHistory;
  }

  // clear all search history
  Future<void> clearHistory() async {
    searchHistory.clear();
    await store.write('openpo_search_history', <String>[].obs);
    update();
  }
}
