import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/common_methods.dart';
import 'package:code_magic_ex/models/order_lines.dart';
import "package:collection/collection.dart";

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class EasyShipController extends GetxController {
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  OrderLines allEasyShipOrders = OrderLines(items: []);

  Future<void> getAllOrderlines({String userId = "3011266"}) async {
    loading(true);
    update();
    final String localUserId = userId;
    const String dateCreated = "[2020-11;2021-06]";
    const String criteria = "easyship";
    const String expand = "catalogSlide,order,order.customer";
    const String market = "TH";
    try {
      allEasyShipOrders = await ApiService.shared()
          .getOrderLines(localUserId, dateCreated, criteria, expand, market);
      final OrderLines headeritem = OrderLines(items: [
        OrderLineItem(
            item: const CommonUserIdString(
                id: CommonIdTypeString(unicity: "Item Code")),
            order: const Orderitem(
                terms: TermsPeriod(period: "Period"),
                id: CommonIdWithCountryCode(unicity: "Order Number")),
            catalogSlide: const CommonCatalogSlideContent(
                content: CommonContentDescription(description: "Product name")))
      ]);
      allEasyShipOrders.items = [
        ...headeritem.items,
        ...allEasyShipOrders.items
      ];
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }
}
