import 'package:dio/dio.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/inventory_records.dart';
import '../../../../models/managed_warehouse.dart';
import '../../../../services/rest_api/exceptions.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/snackbar.dart';

class HomeController extends GetxController {
  String currentMarketWarehouseId = "";

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
