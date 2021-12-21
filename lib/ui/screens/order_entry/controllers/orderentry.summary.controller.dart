import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dsc_tools/models/place_order.dart'
    hide
        Customer,
        ShipToAddress,
        ShippingMethod,
        ShipToName,
        ProductLines,
        ProductTerms,
        Transactions;
import 'package:dsc_tools/models/purchase_log_request_data.dart';
import 'package:dsc_tools/models/user_info.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/order_complete_screen/home.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/order_entry_summary/components/discard_alert.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/general_models.dart';
import 'orderentry.product.list.controller.dart';

class OrderEntryCheckoutSummaryController extends GetxController {
  OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());
  TextEditingController searchUserTextController = TextEditingController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> searchOptions = [
    NameValueType(name: "my_cart".tr, value: "myCart"),
    NameValueType(name: "payment_type".tr, value: "paymentType"),
  ].obs;
  RxString filterMethod = "myCart".obs;
  RxBool isLoading = false.obs;
  RxList<String> searchedUsers = <String>["Hi", "Sathya"].obs;
  final selecteduserIndex = Rxn<int>();

  RxList<NameValueType> paymentTypes = [
    NameValueType(name: " pay_with_dsc".tr, value: "payWithDsc"),
  ].obs;
  RxString selectedPayment = "payWithDsc".obs;

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "order_entry");
    super.onInit();
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    filterMethod.value = searchOptions[index].value;
    // getAllOpenPo();
  }

  void onSelectUser(int idx) {
    searchUserTextController.text = searchedUsers[idx];
    selecteduserIndex.value = idx;
    searchedUsers.refresh();
  }

  void onCancel(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return DiscardAlert();
        });
  }

  void onTabChange(OrderEntrySummaryFilters type) {
    filterMethod.value =
        type == OrderEntrySummaryFilters.myCart ? "myCart" : "paymentType";
  }

  Future<void> proceedToCheckOut() async {
    try {
      isLoading.toggle();
      // * Check for server status if on or off
      final bool serverStatus = await checkOrderEntryServerStatus();
      if (serverStatus) {
        final List<dynamic> response =
            await Future.wait([getPeriodResponse(), proceedPlaceOrder()]);
        final periodResponse = response[0] as String;
        final orderPlaceResponse = response[1] as PlaceOrder?;
        if (orderPlaceResponse != null && periodResponse != "") {
          final GetPeriodLogResponse? periodLogResponse =
              await getPeriodLog(periodResponse);
          if (periodLogResponse != null) {
            if (periodLogResponse.status == "success") {
              await getPurchaseLog(periodLogResponse.idLog);
            }
          }
        }
        if (orderPlaceResponse != null) {
          Get.offAll(() => OrderEntryComplete(), arguments: orderPlaceResponse);
        }
      }
      isLoading.toggle();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err, s) {
      _onCatchError(err, s);
    }
  }

  Future<bool> checkOrderEntryServerStatus() async {
    try {
      final String status = await MemberCallsService.init()
          .checkOrderEntryStatus(kCheckOrderEntryServerStatus);
      if (status == "on") {
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(
          message: "${"server_error!".tr} ${e.error.toString()}");
      return false;
    } catch (err) {
      SnackbarUtil.showError(
          message: "${"server_error!".tr} ${err.toString()}");
      return false;
    }
  }

  Future<String> getPeriodResponse() async {
    String response = "";
    try {
      response = await MemberCallsService.init()
          .getPeriodResponse(kCountry, getCurrentPeriod(), kSystem);
      final jsonResponse = jsonDecode(response.toString());
      if (jsonResponse != null) {
        final mapped = jsonResponse as Map<String, dynamic>;
        if (mapped["success"] == "Yes") {
          return response;
        }
      }
      return response;
    } catch (err) {
      return response;
    }
  }

  Future<GetPeriodLogResponse?> getPeriodLog(String periodResponse) async {
    try {
      final GetPeriodLogResponse status = await MemberCallsService.init()
          .getPeriodLog(
              kPeriodLog, periodResponse, kCheckOrderEntryServerStatus);
      if (status.status == "success") {
        return status;
      }
      return null;
    } catch (err) {
      LoggerService.instance.e(err.toString());
      return null;
    }
  }

  PurchaseLogRequestData? prepareRequestPaylod() {
    try {
      final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
      final List<ProductLineItem> checkoutItems = listController.cartProducts
          .map((element) => ProductLineItem(
              quantity: element.quantity.toString(),
              item: Customer(
                  href:
                      "https://hydra.unicity.net/v5a/items?id.unicity=${element.itemCode}")))
          .toList();

      final PurchaseLogRequestData requestData = PurchaseLogRequestData(
          customer: Customer(
              href:
                  "https://hydra.unicity.net/v5a/customers?unicity=${usedInfo.id.unicity.toString()}"),
          lines: ProductLines(items: checkoutItems),
          shipToAddress: UserShipToAddress(
              city: usedInfo.mainAddress.city,
              state: usedInfo.mainAddress.state,
              address1: usedInfo.mainAddress.address1,
              zip: usedInfo.mainAddress.zip,
              country: "TH"),
          shipToEmail:
              usedInfo.email.isNotEmpty ? usedInfo.email : "none@unicity.com",
          shipToName: ShipToName(
              firstName: usedInfo.humanName.firstName,
              lastName: usedInfo.humanName.lastName),
          shipToPhone: usedInfo.homePhone,
          shippingMethod: Customer(
              href:
                  "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"),
          notes: prepareNotes(usedInfo.id.unicity.toString(), "TH"),
          terms: ProductTerms(period: getCurrentPeriod()),
          transactions: Transactions(items: [
            TransactionItem(
                amount: 6000.toString(), method: "Cash", type: "record")
          ]));
      return requestData;
    } catch (err) {
      LoggerService.instance.e(err.toString());
      return null;
    }
  }

  Future<void> getPurchaseLog(int periodLog) async {
    try {
      final payload = prepareRequestPaylod();
      if (payload == null) {
        throw Exception('something_wrong_in_purchase_log'.tr);
      }
      final String jsonUser = jsonEncode(prepareRequestPaylod());
      final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
      await MemberCallsService.init().logPurchaseOrder(
          kPurchaseLog,
          jsonUser,
          usedInfo.id.unicity.toString(),
          getCurrentPeriod(),
          periodLog.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<PlaceOrder?> proceedPlaceOrder() async {
    PlaceOrder? response;
    try {
      final String enrollResponse = jsonEncode(prepareRequestPaylod());
      response = await ApiService.shared().getPlaceOrders(enrollResponse);
      if (response.taxedAs != "") {
        // * firing all api's at once
        await Future.wait([
          clearOrderCache(),
          verifyOrder(response),
          sendOrderOnline(response)
        ]);
      }
      return response;
    } on DioError catch (e) {
      LoggerService.instance.e(e.toString());
      SnackbarUtil.showError(message: "${"error!".tr} ${e.error.toString()}");
      return response;
    } catch (err, e) {
      LoggerService.instance.e(err.toString());
      debugPrint(e.toString());
      SnackbarUtil.showError(message: "${"error!".tr} ${err.toString()}");
      return response;
    }
  }

  Future<void> clearOrderCache() async {
    try {
      await MemberCalls2Service.init().clearOrderCache(
          UserSessionManager.shared.userInfo!.id.unicity.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> verifyOrder(PlaceOrder requestData) async {
    try {
      await MemberCallsService.init().verifyOrder(requestData);
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "${"error!".tr} ${e.error.toString()}");
    } catch (err) {
      LoggerService.instance.e(err.toString());
      SnackbarUtil.showError(message: "${"error!".tr} ${err.toString()}");
    }
  }

  Future<void> sendOrderOnline(PlaceOrder data) async {
    try {
      final UserInfo info = UserSessionManager.shared.userInfo!;
      await MemberCallsService.init().sendOrderOnline(
          "${info.humanName.fullNameTh} (${info.humanName.fullName})",
          "${info.mainAddress.address1}, ${info.mainAddress.city},  ${info.mainAddress.state}, ${info.mainAddress.country} ${info.mainAddress.zip}",
          info.email,
          data.id.unicity.toString(),
          "shopping",
          info.id.unicity.toString(),
          "https://hydra.unicity.net/v5a/items?id.unicity=${data.lines.items[0].item.id.unicity}",
          data.lines.items[0].quantity.toString(),
          getCurrentPeriod(),
          "15",
          data.terms.subtotal);
    } on DioError catch (e) {
      LoggerService.instance.e(e.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  void _onDioError(DioError e) {
    isLoading.toggle();
    debugPrint(e.toString());
    SnackbarUtil.showError(message: e.toString());
    returnResponse(e.response!);
  }

  void _onCatchError(Object err, StackTrace s) {
    debugPrint(err.toString());
    SnackbarUtil.showError(message: "error!".tr);
    LoggerService.instance.e(s);
    isLoading.toggle();
  }

  void onClickNuetralButton() {
    SnackbarUtil.showWarning(message: "please_add_item_to_cart_msg".tr);
  }

  void onNegetiveButtonClick() {
    Get.back();
  }
}
