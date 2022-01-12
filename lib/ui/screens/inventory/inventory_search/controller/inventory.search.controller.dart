import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../models/inventory_item_v2.dart';
import '../../../../../utilities/images.dart';
import '../../../../../utilities/snackbar.dart';
import '../../../open_po/order_search/components/search_bar_field.dart';
import '../../inventory_home/controller/inventory.home.controller.dart';
import '../../inventory_search_result/screens/inventory_search_result.dart';

class InventorySearchController extends GetxController {
  InventoryHomeController controller = Get.put(InventoryHomeController());

  TextEditingController searchTextController = TextEditingController();
  RxList<String> searchHistory = <String>[].obs;
  final selectedSearchIndex = Rxn<int>();
  RxBool searchingProduct = false.obs;
  Rx<Key> currentSearchBariconKey = const ObjectKey("seachIcon").obs;
  final store = GetStorage();

  // App bars
  Widget appBarTitle = const Text("");
  final SvgPicture actionIcon = SvgPicture.asset(kSearchIcon,
      height: 20, key: const ObjectKey("seachIcon"));
  final Image loadingIcon =
      Image.asset(kAnimatedSpin, width: 30, key: const ObjectKey("seachIcon"));

  @override
  void onInit() {
    getSearchHistory();
    onPressAppBar();
    super.onInit();
  }

  void onPressAppBar() {
    if (actionIcon.key == currentSearchBariconKey.value) {
      appBarTitle = SearchBarField(searchTextController: searchTextController);
      addSearchItem(searchTextController.text);
    } else {
      appBarTitle = const Text("");
    }
    update();
  }

  void searchOrder(String searchKey) {
    selectedSearchIndex.value = searchHistory.indexWhere(
        (element) => element.toLowerCase() == searchKey.toLowerCase());
    if (selectedSearchIndex.value != -1) {
      searchTextController.text = searchHistory[selectedSearchIndex.value!];
      searchTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: searchTextController.text.length));
    }
    searchingProduct.toggle();
    Future.delayed(const Duration(milliseconds: 1200), () {
      searchingProduct.toggle();
      final List<InventoryItem> inventoryItem = controller.allInventoryItems
          .where((order) =>
              order.item!.id!.unicity!
                  .toLowerCase()
                  .contains(searchKey.toLowerCase()) ||
              order.catalogSlide!.content!.description!
                  .toLowerCase()
                  .contains(searchKey.toLowerCase()))
          .toList();
      if (inventoryItem.isNotEmpty) {
        selectedSearchIndex.value = null;
        searchTextController.text = "";
        Get.to(() => InventorySearchResult(), arguments: inventoryItem);
        return;
      }

      SnackbarUtil.showWarning(
          message: "${"no_inventory_item_with_search".tr}: $searchKey");
    });
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
