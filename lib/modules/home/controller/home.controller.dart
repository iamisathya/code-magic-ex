import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/provider/globals.dart';
import '../../../data/model/inventory_records.dart';
import '../../../data/model/managed_warehouse.dart';
import '../../../data/services/api_service.dart';
import '../../../helpers/exceptions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/snackbar.dart';

class HomeController extends GetxController {
  String currentMarketWarehouseId = "";
  // The equivalent of the "smallestWidth" qualifier on Android.

  // Determine if we should use mobile layout or not, 600 here is
  // a common breakpoint for a typical 7-inch tablet.
  final bool isMobileLayout = MediaQuery.of(Get.context!).size.shortestSide < 600;

  @override
  void onInit() {
    super.onInit();
    getManagedWarehouses();
  }

  Future<InventoryRecords?> getManagedWarehouses() async {
    try {
      final ManagedWarehouses warehouses =
          await ApiService.shared().getManagedWarehouses();
      if (warehouses.items.isNotEmpty) {
        Globals.currentMarketWarehouseId =
            warehouses.items[0].href.getAfterLastSlash();
        currentMarketWarehouseId = warehouses.items[0].href.getAfterLastSlash();
      }
    } on DioError catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } on AppException catch (err, stack) {
      err.logError(err, stack);
    }
  }
}
