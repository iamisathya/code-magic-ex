import 'package:collection/collection.dart';
import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/ui/screens/inventory/component/inventory_search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utilities/snackbar.dart';
import 'inventory.home.controller.dart';

class InventorySearchController extends GetxController {
  InventoryHomeController controller = Get.put(InventoryHomeController());

  TextEditingController searchTextController = TextEditingController();
  RxList<String> searchHistory = <String>[].obs;
  final store = GetStorage();

  @override
  void onInit() {
    getSearchHistory();
    super.onInit();
  }

  void searchOrder(String searchKey) {
    final InventoryRecordItems? inventoryItem =
        controller.inventoryRecords.value.items.firstWhereOrNull((order) =>
            order.item.id.unicity == searchKey ||
            order.catalogSlideContent.content.description == searchKey);
    if (inventoryItem != null && inventoryItem.item.id.unicity.isNotEmpty) {
      Get.to(() => InventorySearchResult(), arguments: inventoryItem);
      return;
    }
    SnackbarUtil.showWarning(
        message:
            "Sorry no items found in inventory with search key: $searchKey");
  }

  // Retrieves and Sets language based on device settings
  Future<void> addSearchItem(String value) async {
    if (value.isEmpty) return;
    final isFound = searchHistory.contains(value);
    searchOrder(value);
    if (isFound) return;
    searchHistory.add(value);
    await store.write('inventory_search_history', searchHistory);
    update();
  }

  // Gets current language stored
  RxList<String> get getSearchHistory {
    final history = store.read('inventory_search_history');
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
    await store.remove('inventory_search_history');
    update();
  }
}
