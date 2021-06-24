import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/open_order_id.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class SampleController extends GetxController {
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

  Future<void> getOpenPlaceOrderDetails(String ponumber, BuildContext context) async {
    showDetails(true);
    loadingDetails(true);
    detailsErrorMessage("");
    update();
    try {
      // * Getting order id from getOpenOrderId API - 203
      final OpenPlaceOrderId openPlaceOrderId =
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
          await MemberCallsService.init().getAllOpenPo("106", "12", "2970466");
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
}
