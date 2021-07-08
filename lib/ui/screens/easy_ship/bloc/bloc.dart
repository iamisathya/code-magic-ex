import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/common_methods.dart';
import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/utilities/enums.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/Logger/logger.dart';

class EasyShipController extends GetxController {
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  OrderLines allEasyShipOrders = OrderLines(items: []);
  OrderLines _tempEasyShipOrders = OrderLines(items: []);

  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  EasyShipTypes currentType = EasyShipTypes.orderNumber;

  List<OrderLineItem> get getAllEasyShipOrders => _tempEasyShipOrders.items;
  int get allEasyShipOrdersCount => _tempEasyShipOrders.items.length;
  bool get isAllEasyShipOrdersEmpty => _tempEasyShipOrders.items.isEmpty;

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
      _tempEasyShipOrders = allEasyShipOrders;
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  void onSortCulumn(EasyShipTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case EasyShipTypes.orderNumber:
        if (isAscending) {
          _tempEasyShipOrders.items
              .sort((a, b) => a.order.id.unicity.compareTo(b.order.id.unicity));
        } else {
          _tempEasyShipOrders.items
              .sort((b, a) => a.order.id.unicity.compareTo(b.order.id.unicity));
        }
        break;
      case EasyShipTypes.period:
        if (isAscending) {
          _tempEasyShipOrders.items.sort(
              (a, b) => a.order.terms.period.compareTo(b.order.terms.period));
        } else {
          _tempEasyShipOrders.items.sort(
              (b, a) => a.order.terms.period.compareTo(b.order.terms.period));
        }
        break;
      case EasyShipTypes.productName:
        if (isAscending) {
          _tempEasyShipOrders.items.sort((a, b) => a
              .catalogSlide.content.description
              .compareTo(b.catalogSlide.content.description));
        } else {
          _tempEasyShipOrders.items.sort((b, a) => a
              .catalogSlide.content.description
              .compareTo(b.catalogSlide.content.description));
        }
        break;
      case EasyShipTypes.itemCode:
        if (isAscending) {
          _tempEasyShipOrders.items
              .sort((a, b) => a.item.id.unicity.compareTo(b.item.id.unicity));
        } else {
          _tempEasyShipOrders.items
              .sort((b, a) => a.item.id.unicity.compareTo(b.item.id.unicity));
        }
        break;
      case EasyShipTypes.pv:
        if (isAscending) {
          _tempEasyShipOrders.items
              .sort((a, b) => a.terms.pvEach.compareTo(b.terms.pvEach));
        } else {
          _tempEasyShipOrders.items
              .sort((b, a) => a.terms.pvEach.compareTo(b.terms.pvEach));
        }
        break;
      case EasyShipTypes.price:
        if (isAscending) {
          _tempEasyShipOrders.items
              .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
        } else {
          _tempEasyShipOrders.items
              .sort((b, a) => a.terms.priceEach.compareTo(b.terms.priceEach));
        }
        break;
      default:
    }
    update();
  }
}
