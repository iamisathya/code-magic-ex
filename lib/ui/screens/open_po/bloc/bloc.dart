import 'package:code_magic_ex/utilities/constants.dart';
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
  RxInt increment() => count++;

  RxString errorMessage = "".obs;
  RxString detailsErrorMessage = "".obs;

  RxBool loading = false.obs;
  
  RxBool loadingDetails = false.obs;
  RxBool showDetails = false.obs;
   // swap true/false & save it to observable
  void toggle(){
    showDetails.value = !showDetails.value;
    update();
  } 

  RxList<OpenPO> allOpenPlaceOrders = List<OpenPO>.filled(0, OpenPO()).obs;
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails =
      List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;  
  OpenPlaceOrderId openPlaceOrderId = OpenPlaceOrderId();  

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
