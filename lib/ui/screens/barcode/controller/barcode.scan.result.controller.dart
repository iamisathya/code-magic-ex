import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dsc_tools/models/barcode_number_update_request.dart';
import 'package:dsc_tools/models/verify_each_barcode_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as getx;

import '../../../../api/api_address.dart';
import '../../../../api/config/api_service.dart';
import '../../../../models/barcode_item_response.dart';
import '../../../../models/barcode_number_response.dart';
import '../../../../models/barcode_response.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/plain_button.dart';
import '../../home/home.dart';
import '../barcode.screen.dart';
import '../screens/barcode_search_screen.dart';

class BarcodeScannResultController extends getx.GetxController {
  TextEditingController bardcodeTextField = TextEditingController();
  getx.RxBool loading = false.obs;
  getx.RxBool isExpanded = false.obs;
  getx.RxString orderNumber = "".obs;
  getx.RxBool isLoading = false.obs;
  getx.RxBool hasAnyChangesMade = false.obs;
  getx.RxString orderUrl = "".obs;
  getx.RxBool barcodeNumberLoading = false.obs;
  getx.RxList<String> currentBarcodeNumbers = <String>[].obs;

  BarcodeResponse? barcodeDetails;
  BarCodeItemsResponse? barcodeItems;
  VerifyEachBarcodeResponse? eachBarcodeResponse;

  @override
  void onInit() {
    super.onInit();
    final dynamic data = getx.Get.arguments;
    if (data != null) {
      orderNumber.value = data as String;
      getBarcodePath();
    }
  }

  getx.RxBool get isItemExpanded =>
      barcodeItems!.items.any((element) => element.isExpanded).obs;

  Future<void> getBarcodePath() async {
    isLoading.toggle();
    final String token = UserSessionManager.shared.customerToken.token;
    try {
      final dynamic res = await MemberCallsService.init()
          .getBarcodePath("en", orderNumber.value, token, orderNumber.value);
      final Map<String, dynamic> barcodeObjected = res as Map<String, dynamic>;
      orderUrl.value = barcodeObjected["links"].toString();
      getOrderDetails();
      isLoading.toggle();
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
      getx.Get.back();
    }
  }

  Future<void> getOrderDetails() async {
    isLoading.toggle();
    try {
      final String orderCode = orderUrl.value.retrieveOrderCodeFromLightUrl();
      final String orderNumber = orderUrl.value.retrieveLastString();
      barcodeDetails = await MemberCallsService.init().getBarcodeDetails(
          gTokenBarcodeNew,
          orderNumber,
          UserSessionManager.shared.customerToken.token,
          orderCode);
      getOpenPlaceOrderDetails();
      isLoading.toggle();
    } catch (err, s) {
      isLoading.toggle();
      LoggerService.instance.e(s);
      getx.Get.back();
    }
  }

  Future<void> getOpenPlaceOrderDetails() async {
    isLoading.toggle();
    try {
      // final Map<String, dynamic> barcodeItemString = {"items":[{"code":"19852","qty":2,"desc":"Coffee Mix (Bio Reishi Brand)","require":false,"scan":0,"remain":0},{"code":"19236","qty":2,"desc":"Super Chlorophyll Powder TH","require":true,"scan":2,"remain":0},{"code":"24726","qty":2,"desc":"Bio-C 300 TH","require":false,"scan":0,"remain":0},{"code":"31334","qty":2,"desc":"Core H TH","require":false,"scan":0,"remain":0}],"user":"236187666"};
      // barcodeItems = BarCodeItemsResponse.fromJson(barcodeItemString);
      // // * Getting order id from getOpenOrderId API - 203
      final map = <String, dynamic>{};
      map["data[terms][discount][amount]"] =
          barcodeDetails!.userProfile.terms.discount.amount;
      map["data[terms][period]"] = barcodeDetails!.userProfile.terms.period;
      map["data[terms][pretotal]"] = barcodeDetails!.userProfile.terms.pretotal;
      map["data[terms][tax][amount]"] =
          barcodeDetails!.userProfile.terms.tax.amount;
      map["data[terms][tax][percentage]"] =
          barcodeDetails!.userProfile.terms.tax.percentage;
      map["data[terms][freight][amount]"] =
          barcodeDetails!.userProfile.terms.freight.amount;
      map["data[terms][subtotal]"] = barcodeDetails!.userProfile.terms.subtotal;
      map["data[terms][taxableTotal]"] =
          barcodeDetails!.userProfile.terms.taxableTotal;
      map["data[terms][total]"] = barcodeDetails!.userProfile.terms.total;
      map["data[terms][pv]"] = barcodeDetails!.userProfile.terms.pv;
      barcodeDetails!.userProfile.transactions.items
          .mapIndexed((item, index) => {
                map["data[transactions][items][$index][billToAddress][address1]"] =
                    item.billToAddress.address1,
                map["data[transactions][items][$index][billToAddress][address2]"] =
                    item.billToAddress.address2,
                map["data[transactions][items][$index][billToAddress][city]"] =
                    item.billToAddress.city,
                map["data[transactions][items][$index][billToAddress][zip]"] =
                    item.billToAddress.zip,
                map["data[transactions][items][$index][billToAddress][country]"] =
                    item.billToAddress.country,
                map["data[transactions][items][$index][billToName][fullName]"] =
                    item.billToName.fullName,
                map["data[transactions][items][$index][billToPhone]"] =
                    item.billToPhone,
                map["data[transactions][items][$index][methodDetails][payer]"] =
                    item.methodDetails.payer,
                map["data[transactions][items][$index][amount]"] = item.amount,
                map["data[transactions][items][$index][authorization]"] =
                    item.authorization,
                map["data[transactions][items][$index][type]"] = item.type,
              });
      map["data[transactions][aggregate][amount]"] =
          barcodeDetails!.userProfile.transactions.aggregate.amount;
      map["data[creator][humanName][fullName]"] =
          barcodeDetails!.userProfile.creator.humanName.fullName;
      map["data[currency]"] = barcodeDetails!.userProfile.currency;
      map["data[customer][id][unicity]"] =
          barcodeDetails!.userProfile.customer.id.unicity;
      map["data[customer][taxTerms][taxId]"] =
          barcodeDetails!.userProfile.customer.taxTerms.taxId;
      map["data[customer][href]"] = barcodeDetails!.userProfile.customer.href;
      map["data[fulfillmentStatus]"] =
          barcodeDetails!.userProfile.fulfillmentStatus;
      map["data[invoice][id][unicity]"] =
          barcodeDetails!.userProfile.invoice.id.unicity;
      map["data[invoice][href]"] = barcodeDetails!.userProfile.invoice.href;
      barcodeDetails!.userProfile.lines.items.mapIndexed((current, index) => {
            map["data[lines][items][$index][item][id][unicity]"] =
                current.item.id.unicity,
            map["data[lines][items][$index][item][href]"] = current.item.href,
            map["data[lines][items][$index][catalogSlide][content][description]"] =
                current.catalogSlide.content.description,
            map["data[lines][items][$index][terms][priceEach]"] =
                current.terms.priceEach,
            map["data[lines][items][$index][terms][pvEach]"] =
                current.terms.pvEach,
            map["data[lines][items][$index][terms][taxablePriceEach]"] =
                current.terms.taxablePriceEach,
            map["data[lines][items][$index][terms][tax][aggregate][amount]"] =
                current.terms.tax.aggregate.amount,
            map["data[lines][items][$index][terms][tax][amount]"] =
                current.terms.tax.amount,
            map["data[lines][items][$index][terms][tax][percentage]"] =
                current.terms.tax.percentage,
            map["data[lines][items][$index][quantity]"] = current.quantity,
            map["data[lines][items][$index][quantityDetails][quantityBackordered]"] =
                current.quantityDetails.quantityBackordered
          });
      map["data[market]"] = barcodeDetails!.userProfile.market;
      map["data[dateCreated]"] = barcodeDetails!.userProfile.dateCreated;
      map["data[id][unicity]"] = barcodeDetails!.userProfile.id.unicity;
      map["data[id][label]"] = barcodeDetails!.userProfile.id.label;
      map["data[notes]"] = barcodeDetails!.userProfile.notes;
      map["data[paymentStatus]"] = barcodeDetails!.userProfile.paymentStatus;
      map["data[shipToAddress][address1]"] =
          barcodeDetails!.userProfile.shipToAddress.address1;
      map["data[shipToAddress][address2]"] =
          barcodeDetails!.userProfile.shipToAddress.address2;
      map["data[shipToAddress][city]"] =
          barcodeDetails!.userProfile.shipToAddress.city;
      map["data[shipToAddress][state]"] =
          barcodeDetails!.userProfile.shipToAddress.state;
      map["data[shipToAddress][zip]"] =
          barcodeDetails!.userProfile.shipToAddress.zip;
      map["data[shipToAddress][country]"] =
          barcodeDetails!.userProfile.shipToAddress.country;
      map["data[shipToEmail]"] = barcodeDetails!.userProfile.shipToEmail;
      map["data[shippingMethod][type]"] =
          barcodeDetails!.userProfile.shippingMethod.type;
      map["data[shippingMethod][location]"] =
          barcodeDetails!.userProfile.shippingMethod.location;
      map["data[shipToName][firstName]"] =
          barcodeDetails!.userProfile.shipToName.firstName;
      map["data[shipToName][lastName]"] =
          barcodeDetails!.userProfile.shipToName.lastName;
      map["data[shipToName][fullName]"] =
          barcodeDetails!.userProfile.shipToName.fullName;
      map["data[shipToName][fullName@th]"] =
          barcodeDetails!.userProfile.shipToName.fullNameTh;
      map["data[shipToPhone]"] = barcodeDetails!.userProfile.shipToPhone;
      map["data[href]"] = barcodeDetails!.userProfile.href;

      final dynamic response = await MemberCallsService.init()
          .getBarcodeItems(gTokenBarcodeNew, FormData.fromMap(map));
      final jsonDecodedData =
          jsonDecode(response as String) as Map<String, dynamic>;
      final List<dynamic> list = jsonDecodedData["items"] as List<dynamic>;
      final List<BarcodeItem> modified = [];
      for (final item in list) {
        item["isExpanded"] = false;
        item["barcodes"] = [];
        final currentItem = BarcodeItem.fromJson(item as Map<String, dynamic>);
        modified.add(currentItem);
      }
      barcodeItems = BarCodeItemsResponse.fromJson(jsonDecodedData);
      barcodeItems!.items = modified;
      isLoading.toggle();
      update();
    } catch (err, s) {
      isLoading.toggle();
      LoggerService.instance.e(s);
      getx.Get.back();
    }
  }

  void deleteBarcodeItem() {}

  void showWarningMessage() {
    getx.Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        content: SizedBox(
          height: 415,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(kNotificationBellImage, height: 193, width: 200),
              const SizedBox(height: 30),
              const SizedBox(
                width: 230,
                child: Text(
                  "“Your current changes will not be saved”",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              PlainButton(
                title: 'OK, Got it',
                onTap: () => getx.Get.back(),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: getx.Get.width,
                  height: 50,
                  child: TextButton(
                      onPressed: () => getx.Get.back(),
                      child: Text("Cancel",
                          style: Theme.of(getx.Get.context!)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: const Color(0xFF606975)))))
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<void> saveBarcodeDetails() async {
    try {
      final BarcodeItem expandedItem =
          barcodeItems!.items.firstWhere((element) => element.isExpanded);
      final int expandedItemIdx =
          barcodeItems!.items.indexWhere((element) => element.isExpanded);
      final List<Order> allitems = [];
      final List<BarcodeNumbers> allBarcodes = [];
      for (final i in barcodeItems!.items) {
        allitems.add(Order(item: i.code, quantity: i.qty));
        // allitems.add({"item": i.code, "quantity": i.qty});
      }
      for (final i in barcodeItems!.items[expandedItemIdx].barcodes) {
        // allBarcodes.add({"item": i});
        allBarcodes.add(BarcodeNumbers(item: i));
      }
      isLoading.toggle();
      closeAllItems();
      allBarcodes.add(BarcodeNumbers(item: ""));
      final BarcodeNumberUpdateRequest request = BarcodeNumberUpdateRequest(
          order: allitems, scan: allBarcodes, orderNumber: orderNumber.value);
      eachBarcodeResponse = await MemberCallsService.init()
          .verifyEachBarcodeNumber(gTokenBarcodeNew, expandedItem.code,
              json.encode(request.toMap()));
      //* getx.Get.offAll(MainHomeScreen());
      //* getx.Get.to(BarcodeHomeScreen());
      isLoading.toggle();
    } catch (e, s) {
      isLoading.toggle();
      LoggerService.instance.e(s);
    }
  }

  void getBarcodeDetails() {}

  void navigateToScanBarcode() {
    getx.Get.to(() => BarCodeSearchScreen(), arguments: orderNumber.value);
  }

  Future<void> toggleItem(int index) async {
    try {
      final bool status = barcodeItems!.items[index].isExpanded;
      if (status) {
        barcodeItems!.items[index].isExpanded = !status;
        update();
        return;
      }
      barcodeNumberLoading.toggle();
      final BarcodeItem item = barcodeItems!.items[index];
      final BarcodeNumberResponse res = await MemberCallsService.init()
          .getBarcodeNumbers(orderNumber.value, item.code);
      barcodeItems!.items[index].barcodes = res.items;
      barcodeNumberLoading.toggle();
      closeAllItems();
      hasAnyChangesMade.value = false;
      barcodeItems!.items[index].isExpanded = !status;
      update();
    } catch (e, s) {
      barcodeNumberLoading.toggle();
      LoggerService.instance.e(s);
    }
  }

  void closeAllItems() {
    for (final barItem in barcodeItems!.items) {
      barItem.isExpanded = false;
    }
  }

  void removeBarcodeNumber(int mainIndex, int index) {
    barcodeItems!.items[mainIndex].barcodes.removeAt(index);
    hasAnyChangesMade.value = true;
    update();
  }
}
