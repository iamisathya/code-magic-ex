import 'package:dio/dio.dart';
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
