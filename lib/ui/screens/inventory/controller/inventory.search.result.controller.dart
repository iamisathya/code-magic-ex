import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../models/inventory_records.dart';
import '../../../../utilities/extensions.dart';
import 'inventory.home.controller.dart';

class InventorySearchResultController extends GetxController {
  InventoryHomeController controller = Get.put(InventoryHomeController());

  late List<InventoryRecordItems> itemsFound;
  RxList<String> searchHistory = <String>[].obs;
  RxInt totalCartPv = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  final store = GetStorage();

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      itemsFound = data as List<InventoryRecordItems>;
      calculateTotal();
    }
    super.onInit();
  }

    void calculateTotal() {
    totalCartPrice.value =
        itemsFound.fold(0, (i, element) => i + (element.quantityOnHand.toInt() * element.terms.priceEach.toInt()));
    totalCartPv.value =
        itemsFound.fold(0, (i, element) => i + (element.quantityOnHand.toInt() * element.terms.pvEach));
  }
}
