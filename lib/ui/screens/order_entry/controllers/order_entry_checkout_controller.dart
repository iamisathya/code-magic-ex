import 'dart:convert';

import 'package:code_magic_ex/models/place_order.dart'
    hide
        Customer,
        ShipToAddress,
        ShippingMethod,
        ShipToName,
        ProductLines,
        ProductTerms,
        Transactions;
import 'package:code_magic_ex/models/purchase_log_request_data.dart';
import 'package:code_magic_ex/models/radio_button_value.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_minimal_data.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../api/config/member_class.dart';
import '../../../../models/cart_products.dart';
import '../../../../models/general_models.dart';

class OrderEntryCheckoutController extends GetxController {
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;
  RxInt availableCreditAmount = 0.obs;
  RxDouble totalCheckoutAmount = 0.0.obs;
  final ProgressBar _sendingMsgProgressBar = ProgressBar();
  RxList<RadioButtonModel> paymentOptions = [
    RadioButtonModel(
      index: 0,
      name: "DSC",
    ),
    RadioButtonModel(
      index: 1,
      name: "Voucher",
    ),
  ].obs;
  Rx<RadioButtonModel> seletedOption = RadioButtonModel(
    index: 0,
    name: "DSC",
  ).obs;

  late RxList<CartProductsItem> checkoutProducts;
  late UserMinimalData passedUser;

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      final intent = data as Map<String, dynamic>;
      checkoutProducts = intent["products"] as RxList<CartProductsItem>;
      passedUser = intent["user"] as UserMinimalData;
      calculateTotal();
    }
  }

  Future<void> proceedToCheckOut(BuildContext context) async {
    try {
      final bool serverStatus = await checkOrderEntryServerStatus();
      if (serverStatus) {
        final String periodResponse = await getPeriodResponse();
        if (periodResponse != "") {
          final GetPeriodLogResponse? periodLogResponse =
              await getPeriodLog(periodResponse);
          if (periodLogResponse != null) {
            if (periodLogResponse.status == "success") {
              await getPurchaseLog(periodLogResponse.idLog);
              await getPlaceOrders(context);
            }
          }
        }
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
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
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      return false;
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return false;
    }
  }

  Future<String> getPeriodResponse() async {
    try {
      final String response = await MemberCallsService.init()
          .getPeriodResponse(kCountry, getCurrentPeriod(), kSystem);
      final jsonResponse = jsonDecode(response.toString());
      if (jsonResponse != null) {
        final mapped = jsonResponse as Map<String, dynamic>;
        if (mapped["success"] == "Yes") {
          return response;
        }
      }
      return "";
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      return "false";
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return "false";
    }
  }

  Future<GetPeriodLogResponse?> getPeriodLog(String periodResponse) async {
    try {
      final GetPeriodLogResponse status = await MemberCallsService.init()
          .getPeriodLog(
              kPeriodLog, periodResponse, kCheckOrderEntryServerStatus);
      if (status.status == "success") {
        // continue with order place
        return status;
      }
      return null;
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      return null;
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return null;
    }
  }

  PurchaseLogRequestData prepareRequestPaylod() {
    final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
    final List<ProductLineItem> checkoutItems = checkoutProducts
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
  }

  Future<void> getPurchaseLog(int periodLog) async {
    try {
      final String jsonUser = jsonEncode(prepareRequestPaylod());
      final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
      await MemberCallsService.init().logPurchaseOrder(
          kPurchaseLog,
          jsonUser,
          usedInfo.id.unicity.toString(),
          getCurrentPeriod(),
          periodLog.toString());
    } on DioError catch (e) {
      LoggerService.instance.e(e.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<bool> getPlaceOrders(BuildContext context) async {
    try {
      final String enrollResponse = jsonEncode(prepareRequestPaylod());
      final PlaceOrder response =
          await ApiService.shared().getPlaceOrders(enrollResponse);
      if (response.taxedAs != "") {
        await clearOrderCache();
        await verifyOrder(response);
        await sendOrderOnline(response);
      }

      return false;
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      return false;
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return false;
    }
  }

  Future<void> clearOrderCache() async {
    try {
      await MemberCalls2Service.init().clearOrderCache(
          UserSessionManager.shared.userInfo!.id.unicity.toString());
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
    }
  }

  Future<void> verifyOrder(PlaceOrder requestData) async {
    try {
      await MemberCallsService.init().verifyOrder(requestData);
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
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

  void onChangedSearchType(RadioButtonModel data) {
    seletedOption.value = paymentOptions[data.index];
    totalCheckoutAmount.value = data.index == 0
        ? totalCartPrice.value
        : totalCartPrice.value - availableCreditAmount.value;
  }

  void calculateTotal() {
    totalCartPrice.value =
        checkoutProducts.fold(0, (i, element) => i + element.totalPrice);
    totalCartPv.value =
        checkoutProducts.fold(0, (i, element) => i + element.totalPv);
    totalCheckoutAmount = totalCartPrice;
  }

  void _onDioError(DioError e) {
    _sendingMsgProgressBar.hide();
    renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    returnResponse(e.response!);
  }

  void _onCatchError(Object err) {
    LoggerService.instance.e(err.toString());
    _sendingMsgProgressBar.hide();
  }
}
