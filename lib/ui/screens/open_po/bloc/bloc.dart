import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/open_order_id.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class SampleController extends GetxController {
  RxString filterMethod = "6".obs;
  RxInt count = 0.obs;

  RxList<OpenPO> allOpenPlaceOrders = List<OpenPO>.filled(0, OpenPO()).obs;
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails =
      List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;  
  OpenPlaceOrderId openPlaceOrderId = OpenPlaceOrderId();  
  RxList<OpenPO> _tempOpenPlaceOrders = <OpenPO>[].obs;
  RxInt increment() => count++;

    // Use this to retrieve all records
  List<OpenPO> get openPlaceOrders {
    return _tempOpenPlaceOrders;
  }

  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  OpenPoTypes currentType = OpenPoTypes.poNumber;

  RxString errorMessage = "".obs;
  RxString detailsErrorMessage = "".obs;

  RxBool loading = false.obs;
  
  RxBool loadingDetails = false.obs;
  RxBool showDetails = false.obs;

  Rx<bool> get isEmptyList => _tempOpenPlaceOrders.isEmpty.obs;
  int get currentItemsLength => _tempOpenPlaceOrders.length;

   // swap true/false & save it to observable
  void toggle(){
    showDetails.value = !showDetails.value;
    update();
  } 

  Future<void> getOpenPlaceOrderDetails(String ponumber, BuildContext context) async {
    showDetails(true);
    loadingDetails(true);
    detailsErrorMessage("");
    update();
    try {
      // * Getting order id from getOpenOrderId API - 203
      openPlaceOrderId =
          await MemberCallsService.init().getOpenOrderId("203", ponumber);

      // * Getting order details from from getOpenOrderDetails API - 204
      final List<OpenPlaceOrderDetails> detailsResponse =
          await MemberCallsService.init()
              .getOpenOrderDetails("204", openPlaceOrderId.orderId);
      openPlaceOrderDetails = detailsResponse.obs;
      // Navigator.pushNamed(context, '/poOrderDetailsPage');

      loadingDetails(false);
      detailsErrorMessage("");
      update();
    } catch (err) {
      loadingDetails(false);
      detailsErrorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  Future<void> getAllOpenPo() async {
    loading(true);
    try {
      final List<OpenPO> allOpenPO =
          await MemberCallsService.init().getAllOpenPo("106", filterMethod.value, "2970466");
          _tempOpenPlaceOrders = allOpenPO.obs;
      allOpenPO.insert(
          0,
          OpenPO(
              orderDscid: "DSC ID",
              iconAttachment: "Attachment",
              orderDate: "Date",
              orderOpid: "P/O Number",
              orderStatus: "Status",
              orderTime: "Time",
              orderTotalPrice: "Totol Price",
              orderTotalPv: "Total PV"));
      allOpenPlaceOrders(allOpenPO);
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }


  void onSortCulumn(OpenPoTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case OpenPoTypes.poNumber:
        if (isAscending) {
          _tempOpenPlaceOrders.sort((a, b) => a.orderDscid.compareTo(b.orderDscid));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderDscid.compareTo(b.orderDscid));
        }
        break;
      case OpenPoTypes.date:
        if (isAscending) {
          _tempOpenPlaceOrders.sort((a, b) => a
              .orderDate
              .compareTo(b.orderDate));
        } else {
          _tempOpenPlaceOrders.sort((b, a) => a
              .orderDate
              .compareTo(b.orderDate));
        }
        break;
      case OpenPoTypes.time:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderTime.compareTo(b.orderTime));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderTime.compareTo(b.orderTime));
        }
        break;
      case OpenPoTypes.totalPv:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderTotalPv.compareTo(b.orderTotalPv));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderTotalPv.compareTo(b.orderTotalPv));
        }
        break;
      case OpenPoTypes.totalPrice:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderTotalPrice.compareTo(b.orderTotalPrice));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderTotalPrice.compareTo(b.orderTotalPrice));
        }
        break;
      default:
    }
    update();
  }

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "6",
          child: ListTile(
            onTap: () {
              filterMethod = "6".obs;
              update();
              Navigator.pop(context);
              getAllOpenPo();
            },
            selected: filterMethod.value == "6",
            selectedTileColor: kPrimaryColor,
            title: const Text("6 Months"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "12",
          child: ListTile(
            selected: filterMethod.value == "12",
            onTap: () {
              filterMethod = "12".obs;
              update();
              Navigator.pop(context);
              getAllOpenPo();
            },
            selectedTileColor: kPrimaryColor,
            title: const Text("All"),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}
