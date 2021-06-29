import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class SalesReportController extends GetxController {
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  EasyShipSortTypes currentType = EasyShipSortTypes.record;

  RxString filterMethod = "order".obs;

  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  OrdersAndRmas allOrdersAndRmas = const OrdersAndRmas();

  int get currentOrdersLength => allOrdersAndRmas.orders[0].items.length;
  int get currentRmasLength => allOrdersAndRmas.rmas[0].items.length;
  int get currentTabLength =>
      filterMethod.value == "order" ? currentOrdersLength : currentRmasLength;

  List<Object> get currentTabItems => filterMethod.value == "order"
      ? allOrdersAndRmas.orders[0].items
      : allOrdersAndRmas.rmas[0].items;

    List<OrderItem> get currentOrders => allOrdersAndRmas.orders[0].items;
    List<RmaItem> get currentRmas => allOrdersAndRmas.rmas[0].items;

  void onSortCulumn(EasyShipSortTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case EasyShipSortTypes.baNumber:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort(
              (a, b) => a.customer.id.unicity.compareTo(b.customer.id.unicity));
        } else {
          allOrdersAndRmas.orders[0].items.sort(
              (b, a) => a.customer.id.unicity.compareTo(b.customer.id.unicity));
        }
        break;
      case EasyShipSortTypes.name:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort((a, b) => a
              .customer.humanName.fullName
              .compareTo(b.customer.humanName.fullName));
        } else {
          allOrdersAndRmas.orders[0].items.sort((b, a) => a
              .customer.humanName.fullName
              .compareTo(b.customer.humanName.fullName));
        }
        break;
      case EasyShipSortTypes.orderId:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort((a, b) => a.id.unicity
              .retrieveOrderId()
              .compareTo(b.id.unicity.retrieveOrderId()));
        } else {
          allOrdersAndRmas.orders[0].items.sort((b, a) => a.id.unicity
              .retrieveOrderId()
              .compareTo(b.id.unicity.retrieveOrderId()));
        }
        break;
      case EasyShipSortTypes.date:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort((a, b) =>
              a.dateCreated.asDDMMYYYY.compareTo(b.dateCreated.asDDMMYYYY));
        } else {
          allOrdersAndRmas.orders[0].items.sort((b, a) =>
              a.dateCreated.asDDMMYYYY.compareTo(b.dateCreated.asDDMMYYYY));
        }
        break;
      case EasyShipSortTypes.time:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items.sort(
              (a, b) => a.dateCreated.asHHMMA.compareTo(b.dateCreated.asHHMMA));
        } else {
          allOrdersAndRmas.orders[0].items.sort(
              (b, a) => a.dateCreated.asHHMMA.compareTo(b.dateCreated.asHHMMA));
        }
        break;
      case EasyShipSortTypes.total:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items
              .sort((a, b) => a.terms.total.compareTo(b.terms.total));
        } else {
          allOrdersAndRmas.orders[0].items
              .sort((b, a) => a.terms.total.compareTo(b.terms.total));
        }
        break;
      case EasyShipSortTypes.totalPV:
        if (isAscending) {
          allOrdersAndRmas.orders[0].items
              .sort((a, b) => a.terms.pv.compareTo(b.terms.pv));
        } else {
          allOrdersAndRmas.orders[0].items
              .sort((b, a) => a.terms.pv.compareTo(b.terms.pv));
        }
        break;

      default:
    }
    update();
  }

  Future<void> loadSalesReports() async {
    if (startDate.text.isEmpty || endDate.text.isEmpty) {
      renderErrorSnackBar(
          title: "Select ${startDate.text.isEmpty ? 'start' : 'end'} date",
          subTitle:
              "Please select ${startDate.text.isEmpty ? 'start' : 'end'} date from Calender");
      return;
    } else {
      final DateTime _start = DateTime.parse(startDate.text);
      final DateTime _end = DateTime.parse(endDate.text);
      if (_start.isAfter(_end)) {
        renderErrorSnackBar(
            title: "Invalid date range!",
            subTitle: "Start date should be lower than end date!");
        return;
      }
    }
    const String type = "order,rma";
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    final String duration = "[${startDate.text};${endDate.text}]";
    loading(true);
    update();
    try {
      allOrdersAndRmas = await ApiService.clientNoLogger()
          .getOrdersAndRmas(userId, duration, type);
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "order",
          child: ListTile(
            onTap: () {
              filterMethod = "order".obs;
              update();
              Navigator.pop(context);
            },
            selected: filterMethod.value == "order",
            selectedTileColor: kPrimaryColor,
            title: const Text("By Order"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "item",
          child: ListTile(
            selected: filterMethod.value == "item",
            onTap: () {
              filterMethod = "item".obs;
              update();
              Navigator.pop(context);
            },
            selectedTileColor: kPrimaryColor,
            title: const Text("By Item"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "rma",
          child: ListTile(
            selected: filterMethod.value == "rma",
            onTap: () {
              filterMethod = "rma".obs;
              Navigator.pop(context);
              update();
            },
            selectedTileColor: kPrimaryColor,
            title: const Text("RMAs"),
          ),
        )
      ],
      elevation: 8.0,
    );
  }
}
