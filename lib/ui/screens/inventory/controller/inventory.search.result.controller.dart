
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../models/inventory_records.dart';
import 'inventory.home.controller.dart';

class InventorySearchResultController extends GetxController {
  InventoryHomeController controller = Get.put(InventoryHomeController());

  late InventoryRecordItems itemFound;
  RxList<String> searchHistory = <String>[].obs;
  final store = GetStorage();

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      itemFound = data as InventoryRecordItems;
    }
    super.onInit();
  }
}