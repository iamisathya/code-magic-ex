import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dsc_tools/core/values/colors.dart';
import 'package:dsc_tools/data/model/barcode_item_response.dart';
import 'package:dsc_tools/data/model/barcode_number_response.dart';
import 'package:dsc_tools/data/model/barcode_number_update_request.dart';
import 'package:dsc_tools/data/model/barcode_response_dsc.dart';
import 'package:dsc_tools/data/model/barcode_save_response.dart';
import 'package:dsc_tools/data/model/verify_each_barcode_response.dart';
// import 'package:dsc_tools/core/values/endpoints.dart';
import 'package:dsc_tools/data/services/api_service.dart';
import 'package:dsc_tools/routes/app_pages.dart';
import 'package:dsc_tools/utils/extensions.dart';
import 'package:dsc_tools/utils/images.dart';
import 'package:dsc_tools/utils/keyboard.dart';
import 'package:dsc_tools/utils/logger.dart';
import 'package:dsc_tools/utils/snackbar.dart';
import 'package:dsc_tools/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as getx;

import '../../../../data/provider/globals.dart';
import '../../../core/values/endpoints.dart';
import '../../../helpers/exceptions.dart';
import '../../../widgets/bottom_modal_alert.dart';
import '../../../widgets/plain_button.dart';

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
  getx.RxBool canOrderHasBarcode = false.obs;
  getx.RxBool isScroolButtonVisible = false.obs;

  BarcodeResponseDsc? barcodeDetails;
  BarCodeItemsResponse? barcodeItems;
  BarCodeSaveResponse? barCodeSaveResponse;
  VerifyEachBarcodeResponse? eachBarcodeResponse;
  ScrollController hideButtonController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    final dynamic data = getx.Get.arguments;
    if (data != null) {
      orderNumber.value = data as String;
      getBarcodePath();
    } else {
      getx.Get.back();
    }
    hideButtonController.addListener(() {
      if (hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // isScroolButtonVisible.toggle();
        if (isScroolButtonVisible.value == true) {
          isScroolButtonVisible.value = false;
        }
      } else {
        if (hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          // isScroolButtonVisible.toggle();
          if (isScroolButtonVisible.value == false) {
            isScroolButtonVisible.value = true;
          }
        }
      }
    });
  }

  getx.RxBool get isItemExpanded =>
      barcodeItems!.items.any((element) => element.isExpanded).obs;

  getx.RxBool checkIfAnyPandingBarcodeScanLeft() {
    if (barcodeItems == null) return true.obs;
    for (final e in barcodeItems!.items) {
      if (e.require == false || (e.require == true && e.remain != 0)) {
        // hasd pending
        //* {"items":[{"code":"27018","qty":1,"desc":"Calcium Magnesium Plus TH","require":false,"scan":0,"remain":0}],"user":"236187666"}
        return true.obs;
      }
    }
    // Has no pending orders
    //* {"items":[{"code":"22375","qty":1,"desc":"Natures T Infusion","require":true,"scan":1,"remain":0}],"user":"236187666"}
    return false.obs;
  }

  // getx.RxBool get checkIfAllItemScanned => barcodeItems != null ? checkIfAnyPandingBarcodeScanLeft() : false.obs;

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
      final dynamic details = await DscCallService.init().getBarcodeDetails(
          orderNumber,
          UserSessionManager.shared.customerToken.token,
          orderCode);
      if (details["items"]["terms"] != null) {
        barcodeDetails =
            BarcodeResponseDsc.fromJson(details as Map<String, dynamic>);
        getOpenPlaceOrderDetails();
        isLoading.toggle();
      } else {
        throw FormatException(
            "${details["items"]["error"]["error_message"]}${": $orderCode"}");
      }
    } catch (err, s) {
      showErrorDialoge(err.toString());
      isLoading.toggle();
      debugPrint(err.toString());
      LoggerService.instance.e(s);
    }
  }

  void showErrorDialoge(String errorMsg) {
    showModalBottomSheet<void>(
        context: getx.Get.context!,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return BottomModalAlert(
              negetiveTitle: "cancel".tr,
              positiveTitle: "ok_got_it".tr,
              onPositiveTap: () => {getx.Get.back(), getx.Get.back()},
              onNegetiveTap: () => {getx.Get.back(), getx.Get.back()},
              title: "error".tr,
              showTitle: true,
              subTitle: errorMsg,
              assetPath: kScanErrorImage);
        });
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
                    item.methodDetails!.payer,
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

      final dynamic response = await DscCallService.init().getBarcodeItems(
          UserSessionManager.shared.customerToken.token, FormData.fromMap(map));
      final jsonDecodedData = response as Map<String, dynamic>;
      if (jsonDecodedData["user"] != null) {
        final List<dynamic> list = jsonDecodedData["items"] as List<dynamic>;
        final List<BarcodeItem> modified = [];
        for (final item in list) {
          item["isExpanded"] = false;
          item["barcodes"] = [];
          final currentItem =
              BarcodeItem.fromJson(item as Map<String, dynamic>);
          modified.add(currentItem);
        }
        barcodeItems = BarCodeItemsResponse.fromJson(jsonDecodedData);
        barcodeItems!.items = modified;
      } else {
        throw const UnexpectedException();
      }
      isLoading.toggle();
      update();
    } on AppException catch (exception) {
      debugPrint(exception.message);
      isLoading.toggle();
      getx.Get.back();
    } catch (err, s) {
      debugPrint(err.toString());
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
              SizedBox(
                width: 230,
                child: Text(
                  "current_changes_will_not_saved".tr,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              PlainButton(
                title: 'ok_got_it'.tr,
                onTap: () => navigateToBarcodeHome(),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: getx.Get.width,
                  height: 50,
                  child: TextButton(
                      onPressed: () => getx.Get.back(),
                      child: Text("cancel".tr,
                          style: Theme.of(getx.Get.context!)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColor.cadet))))
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
      allBarcodes.add(BarcodeNumbers(item: ""));
      final BarcodeNumberUpdateRequest request = BarcodeNumberUpdateRequest(
          order: allitems, scan: allBarcodes, orderNumber: orderNumber.value);
      eachBarcodeResponse = await MemberCallsService.init()
          .verifyEachBarcodeNumber(gTokenBarcodeNew, expandedItem.code,
              json.encode(request.toMap()));
      final bool allItemsArevalid =
          eachBarcodeResponse!.scan.any((element) => element.pass == false);
      if (eachBarcodeResponse!.error!.isEmpty && !allItemsArevalid) {
        saveSingleBarcodeDetails();
      } else {
        if (eachBarcodeResponse!.error!.isNotEmpty) {
          final errors = StringBuffer();
          for (final err in eachBarcodeResponse!.error!) {
            errors.write("\n $err");
          }
          SnackbarUtil.showError(message: errors.toString(), duration: 10);
        }
        hasAnyChangesMade.value = false;
        isLoading.toggle();
      }
    } catch (e, s) {
      isLoading.toggle();
      LoggerService.instance.e(s);
    }
  }

  void navigateToBarcodeHome() {
    getx.Get.back();
    getx.Get.offAllNamed(Routes.MAIN_HOME);
    getx.Get.toNamed(Routes.BARCODE);
  }

  Future<void> saveSingleBarcodeDetails() async {
    try {
      // {"order":"423188055","scan":[{"item":"299900006000"},{"item":"299900006001"},{"item":"299900006002"},{"item":""}],"data":[{"item":"25735","quantity":"0"},{"item":"30266","quantity":"0"},{"item":"24288","quantity":"0"},{"item":"22375","quantity":"0"},{"item":"19236","quantity":"0"},{"item":"23256","quantity":"0"},{"item":"34222","quantity":"0"}],"cus_code":"WCCM"}
      final List<Map<String, dynamic>> scanNumbers = [];
      final List<Map<String, dynamic>> allProducts = [];
      final BarcodeItem expandedItem =
          barcodeItems!.items.firstWhere((element) => element.isExpanded);
      for (final i in barcodeItems!.items) {
        allProducts.add({"item": i.code, "quantity": i.qty});
      }
      for (final i in expandedItem.barcodes) {
        scanNumbers.add({"item": i});
      }
      final Map<String, dynamic> saveRequest = {
        "order": orderNumber.value,
        "scan": scanNumbers,
        "data": allProducts,
        "cus_code": Globals.customerPoCode
      };
      final dynamic saveBarcodeRes = await MemberCallsService.init()
          .saveBarcodeNumber(
              "_ga=GA1.2.1316239299.1632121654; PHPSESSID=dbpq6231h0pe0v9hc0oav8brm5; _gid=GA1.2.1688805920.1633324197; __cf_bm=Ss938oGvx.NVsHwWkudfJe6vqoHmaP5Pik.s7_u5uXk-1633603833-0-Af+WI9XAvMJQDtbavfyymnV3oAFL8/BObDZYzqVhG6rQSOG5g5dBOKOAr4cOqAqtzJe9teA0d3UQY+kwgpJfyEg8mqnNIU7JsjZKGfjgbgyFhf7tvGUugvLv26KRsBKmeA==",
              expandedItem.code,
              "en",
              json.encode(saveRequest));
      barCodeSaveResponse = BarCodeSaveResponse.fromJson(
          json.decode(saveBarcodeRes as String) as Map<String, dynamic>);
      // on success barcode scan
      if (barCodeSaveResponse!.success) {
        hasAnyChangesMade.value = false;
        closeAllItems();
        SnackbarUtil.showSuccess(
            message: "${"barcode_scan_success_for".tr} ${expandedItem.code}");
        getBarcodePath();
      } else if (barCodeSaveResponse!.errorMessages!.isNotEmpty) {
        final errors = StringBuffer();
        for (final err in barCodeSaveResponse!.errorMessages!) {
          errors.write("\n $err");
        }
        SnackbarUtil.showError(message: errors.toString(), duration: 10);
      }
      isLoading.toggle();
      // Get.back();
    } catch (e, s) {
      debugPrint(e.toString());
      isLoading.toggle();
      LoggerService.instance.e(s);
      SnackbarUtil.showError(message: e.toString());
    }
  }

  void getBarcodeDetails() {}

  void navigateToScanBarcode() {
    getx.Get.toNamed(Routes.BARCODE_SEARCH, arguments: orderNumber.value);
  
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

  void addBarcodeNumber(int mainIndex, String number) {
    barcodeItems!.items[mainIndex].barcodes.add(number);
    hasAnyChangesMade.value = true;
    update();
  }

  int getExpandedIndex() {
    return barcodeItems!.items.indexWhere((element) => element.isExpanded);
  }

  bool hasAnyItemExpanded() {
    return barcodeItems!.items.any((element) => element.isExpanded == true);
  }

  Future<void> scanBarcode(BuildContext context) async {
    if (!hasAnyItemExpanded()) {
      navigateToScanBarcode();
      return;
    }
    final int expndedIdx = getExpandedIndex();
    KeyboardUtil.hideKeyboard(context);
    final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "cancel".tr, false, ScanMode.BARCODE);
    debugPrint(barcodeScanRes);
    if (barcodeScanRes.isEmpty && !barcodeScanRes.isNumberOnly()) {
      SnackbarUtil.showError(message: "order_number_should_numarics_msg".tr);
      return;
    }
    if (barcodeItems!.items[expndedIdx].barcodes.contains(barcodeScanRes)) {
      SnackbarUtil.showWarning(
          message: "${"barcode_already_exist_msg".tr}: $barcodeScanRes");
      return;
    }
    addBarcodeNumber(expndedIdx, barcodeScanRes);
  }

  void onTapScrollToTop() {
    isScroolButtonVisible.value = true;
    hideButtonController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }
}
