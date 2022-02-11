import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/model/open_po.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/images.dart';
import '../../../../utils/snackbar.dart';
import '../../order_list/controller/openpo.list.controller.dart';
import '../components/search_bar_field.dart';

class OpenPoSearchController extends GetxController {
  OpenPoListController controller = Get.put(OpenPoListController());

  TextEditingController searchTextController = TextEditingController();
  Rx<Key> currentSearchBariconKey = const ObjectKey("seachIcon").obs;
  final selectedSearchIndex = Rxn<int>();
  RxList<String> searchHistory = <String>[].obs;
  final store = GetStorage();
  RxBool searchingProduct = false.obs;

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
      final OpenPO order = controller.openPlaceOrders.firstWhere(
          (order) => order.orderOpid == searchKey,
          orElse: () => OpenPO());
      if (order.orderOpid.isNotEmpty) {
        Get.toNamed(Routes.OPEN_PO_ORDER_DETAILS, arguments: order.orderOpid);
      } else {
        SnackbarUtil.showWarning(
            message: "${"sorry_no_orders_found".tr}: $searchKey");
      }
    });
  }

  // Retrieves and Sets language based on device settings
  Future<void> addSearchItem(String value) async {
    if (value.isEmpty) return;
    final isFound = searchHistory.contains(value);
    searchOrder(value);
    if (isFound) return;
    searchHistory.add(value);
    await store.write('openpo_search_history', searchHistory);
    update();
  }

  // Gets current language stored
  RxList<String> get getSearchHistory {
    final history = store.read('openpo_search_history');
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
    await store.remove('openpo_search_history');
    update();
  }
}
