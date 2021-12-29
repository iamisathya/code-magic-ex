import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/models/managed_warehouse.dart';
import 'package:dsc_tools/models/product_v2.dart';
import 'package:dsc_tools/services/rest_api/exceptions.dart';
import 'package:dsc_tools/utilities/extensions.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barcode/barcode.screen.dart';
import '../../dashboard/screen/dashboard_screen.dart';
import '../../open_po/order_create/home_screen.dart';
import '../../order_entry/orderentry.screen.dart';
import '../../sales_reports/salesreports.screen.dart';

class HomeController extends GetxController {
  final RxInt currentTabIndex = 0.obs;
  final PageController pageController = PageController();
  List<Widget> tabPages = [
    Body(),
    SalesReportsHomeScreen(),
    OpenPoCreateOrder(),
    OrderEntryHomeScreen(),
    BarcodeHomeScreen()
  ];

  void onTabTapped(
      {required bool isExternal,
      required String currentPage,
      required int index}) {
    currentTabIndex.value = index;
    if (isExternal && index == 2) {
      Get.toNamed(currentPage);
    } else {
      if (index == 0) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut);
      } else {
        Get.to(() => tabPages[index]);
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }

  Future<InventoryRecords> loadInventory() async {
    InventoryRecords inventoryRecords = InventoryRecords(items: []);
    late HydraProducts hydraProducts;
    try {
      await Future.wait<void>([
        getManagedWarehouses().then((value) =>
            value != null ? inventoryRecords.items = value.items : {}),
        getHydraProducts().then((value) => value != null
            ? hydraProducts = value
            : {}), // Get hydra products to get image urls
      ])
          .then((value) => mapInventoryItems(inventoryRecords, hydraProducts))
          .then((value) => value!= null ? inventoryRecords = value : inventoryRecords);
      return inventoryRecords;
    } on AppException catch (exception, stack) {
      exception.logError(exception, stack);
      return inventoryRecords;
    }
  }

  Future<InventoryRecords?> getManagedWarehouses() async {
    try {
      final ManagedWarehouses warehouses =
          await ApiService.shared().getManagedWarehouses();
      if (warehouses.items.isNotEmpty) {
        return await loadInventoryProducts(
            warehouses.items[0].href.getAfterLastSlash());
      } else {
        SnackbarUtil.showError(message: "no_warehouses_found".tr);
      }
    } on DioError catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } on AppException catch (err, stack) {
      err.logError(err, stack);
    }
  }

  Future<InventoryRecords?> loadInventoryProducts(String warehouseId) async {
    const String type = "item";
    try {
      return await ApiService.shared().getInventoryRecords(warehouseId, type);
    } on DioError catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } on AppException catch (err, stack) {
      err.logError(err, stack);
    }
  }

  Future<HydraProducts?> getHydraProducts() async {
    try {
      final HydraProducts hydraProducts =
          await MemberCalls2Service.init().getHydraProducts("THA", "A", "shop");
      return hydraProducts;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } on AppException catch (err, stack) {
      err.logError(err, stack);
    }
  }

  InventoryRecords? mapInventoryItems(
      InventoryRecords inventoryRecords, HydraProducts hydraProducts) {
    try {
      for (var i = 0; i < hydraProducts.items.length; i++) {
        final ProductItem currentItem = hydraProducts.items[i];
        final int index = inventoryRecords.items.indexWhere(
            (hydraItem) => currentItem.itemCode == hydraItem.item.id.unicity);
        if (index != -1) {
          inventoryRecords.items[index].imageUrl = currentItem.imageUrl;
        }
      }
      return inventoryRecords;
    } on AppException catch (exception, stack) {
      exception.logError(exception, stack);
    }
  }
}
