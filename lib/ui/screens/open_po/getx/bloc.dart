import 'dart:convert';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/models/open_order_id.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/ui/screens/open_po/components/OPenPoOne.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SampleController extends GetxController {

  RxList<OpenPO> allOpenPlaceOrders = List<OpenPO>.filled(0, OpenPO()).obs;
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails = List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;

  Future<void> getOpenPlaceOrderDetails(String ponumber) async {
    try {
      final data = await MemberCallsService.init().getOpenOrderId("203", ponumber);
      print(data); 
    } catch (e) {
      LoggerService.instance.e(e.toString());
    }
  }


  Future<void> getAllOpenPo() async {
    loading(true);
    try {
      List<OpenPO> myModels;
      final response = await Dio().get(
          "https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=106&mode=12&dscid=2970466");
      final list = json.decode(response.data as String) as List;
      myModels =
          list.map((i) => OpenPO.fromJson(i as Map<String, dynamic>)).toList();
      //*  Adding this to show header in the table
      myModels.insert(
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
      allOpenPlaceOrders(myModels);
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  RxString errorMessage = "".obs;

  RxBool loading = false.obs;
}
