import 'dart:convert';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/api/request/request_order_calculation.dart';
import 'package:code_magic_ex/models/general_models.dart';
import 'package:code_magic_ex/models/order_calc_response.dart';
import 'package:code_magic_ex/models/cart_products.dart';
import 'package:code_magic_ex/models/cash_coupon_response.dart';
import 'package:code_magic_ex/models/enroll_response.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
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
import 'package:code_magic_ex/ui/screens/order_entry/screens/checkout/checkout_screen.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryTableController extends GetxController {
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  RxList<CartProductsItem> checkoutProducts = <CartProductsItem>[].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;
  RxInt availableCreditAmount = 0.obs;
  RxDouble totalCheckoutAmount = 0.0.obs;
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

  final ProgressBar _sendingMsgProgressBar = ProgressBar();
  late UserMinimalData passedUser;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _generateEmptyCart();
    final dynamic data = Get.arguments;
    if (data != null) {
      passedUser = data as UserMinimalData;
    }
  }

  void _generateEmptyCart() {
    for (var i = 0; i < 40; i++) {
      final CartProductsItem item = CartProductsItem();
      cartProducts.add(item);
    }
  }

  Future<void> loadInventoryRecords(BuildContext context) async {
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      _sendingMsgProgressBar.show(context);
      inventoryRecords =
          Rx(await ApiService.shared().getInventoryRecords(userId, "item"));
      dropDownItems();
      _sendingMsgProgressBar.hide();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<bool> validateEmail(BuildContext context) async {
    try {
      // ! Check this api parsing
      final dynamic result = await MemberCallsService.init()
          .validateEmail(kCurrentLanguage, "rasachankan@gmail.com");
      final jsonResponse = jsonDecode(result.toString());
      final EnrollResponse enrollResponse =
          EnrollResponse.fromJson(jsonResponse as Map<String, dynamic>);
      if (enrollResponse.success != "No") {
        return true;
      }
      return false;
    } on DioError catch (e) {
      _onDioError(e);
      return false;
    } catch (err) {
      _onCatchError(err);
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<bool> orderCalculation(BuildContext context) async {
    try {
      final nonEmptyProducts = cartProducts.where((e) => e.itemCode != "");
      final List<LineItem> checkoutItems = nonEmptyProducts
          .map((element) => LineItem(
              itemId: element.itemCode,
              quantity: element.quantity.toString(),
              items: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/items?id.unicity=${element.itemCode}")))
          .toList();
      final RequestOrderCalculation requestObject = RequestOrderCalculation(
          uShopData: UShopData(loginId: "2970466"),
          order: Order(
              lines: Lines(items: checkoutItems),
              shipToAddress: ShipToAddress(country: "TH"),
              shippingMethod: ShippingMethod(
                  href:
                      "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"),
              customer: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/customers?type=Associate")));
      final OrderCalculationResponse validationResponse =
          await MemberCalls2Service.init().orderCalculation(requestObject);
      if (validationResponse.items.isNotEmpty) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      _onDioError(e);
      return false;
    } catch (err) {
      _onCatchError(err);
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getCashCoupon(BuildContext context) async {
    try {
      final CashCouponResponse cashCoupon = await MemberCalls2Service.init()
          .getCashCoupon(totalCartPv.value.toString());
      if (cashCoupon.success != false) {
        // continue with order place
        availableCreditAmount.value = cashCoupon.availableCreditAmount;
      }
      onChangedSearchType(seletedOption.value);
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> validateOrder(BuildContext context) async {
    checkoutProducts.value =
        cartProducts.where((el) => el.itemCode != "").toList();
    if (checkoutProducts.isEmpty) {
      renderErrorSnackBar(
          title: "Empty cart!",
          subTitle: "Please select products to proceed with checkout!");
      return;
    }
    _sendingMsgProgressBar.show(context);
    final bool isValidEMail = await validateEmail(context);
    if (!isValidEMail) return;

    final bool validated = await orderCalculation(context);
    if (!validated) return;

    await getCashCoupon(context);
    _sendingMsgProgressBar.hide();
    // ! Check this warnig message comming
    Get.to(() => CheckoutPage(), transition: Transition.downToUp);
  }

  String findItemCode(int idx) {
    return inventoryRecords.value.items[idx].item.id.unicity;
  }

  void addItemToCart({required String itemCode, required int index}) {
    final bool targetFound =
        cartProducts.map((element) => element.itemCode).contains(itemCode);
    if (targetFound) {
      updateQuantity(CartUpdate.increament, itemCode);
      return;
    }
    final InventoryRecordItems itemFound = inventoryRecords.value.items
        .firstWhere((item) => item.item.id.unicity == itemCode);
    final CartProductsItem item = CartProductsItem(
        itemCode: itemFound.item.id.unicity,
        productName: itemFound.catalogSlideContent.content.description,
        quantity: 1,
        itemPrice: itemFound.terms.priceEach,
        itemPv: itemFound.terms.pvEach,
        totalPrice: 1 * itemFound.terms.priceEach,
        totalPv: 1 * itemFound.terms.pvEach);
    cartProducts.insert(index, item);
    calculateTotal();
  }

  void updateQuantity(CartUpdate type, String itemCode) {
    final CartProductsItem target =
        cartProducts.firstWhere((item) => item.itemCode == itemCode);
    if (target.itemCode != "") {
      if (CartUpdate.increament == type) {
        target.quantity++;
        target.totalPrice = target.quantity * target.itemPrice;
        target.totalPv = target.quantity * target.itemPv;
      } else {
        if (target.quantity == 1) {
          onPressRemove(itemCode);
        } else {
          target.quantity = target.quantity - 1;
        }
      }
    }
    cartProducts.refresh();
    calculateTotal();
  }

  void calculateTotal() {
    totalCartPrice.value =
        cartProducts.fold(0, (i, element) => i + element.totalPrice);
    totalCartPv.value =
        cartProducts.fold(0, (i, element) => i + element.totalPv);
    // update();
  }

  void onUpdateQuantity(CartUpdate type, String itemCode) {
    if (type == CartUpdate.increament) {
      updateQuantity(CartUpdate.increament, itemCode);
    } else {
      updateQuantity(CartUpdate.decreament, itemCode);
    }
  }

  void onPressRemove(String itemCode) {
    final bool targetFound =
        cartProducts.map((element) => element.itemCode).contains(itemCode);
    if (!targetFound) return;
    cartProducts.removeWhere((item) => item.itemCode == itemCode);
    calculateTotal();
  }

  List<String> dropDownItems() {
    final items =
        inventoryRecords.value.items.map((e) => e.item.id.unicity).toList();
    return items;
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
              getPurchaseLog(periodLogResponse.idLog);
            }
          }
        }
      }
    } catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.toString());
    }
  }

  Future<bool> getPlaceOrders(PurchaseLogRequestData data) async {
    try {
      final PlaceOrder response =
          await ApiService.shared().getPlaceOrders(data);
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

  Future<bool> checkOrderEntryServerStatus() async {
    try {
      final String status = await MemberCallsService.init()
          .checkOrderEntryStatus(kCheckOrderEntryServerStatus);
      if (status == "on") {
        // continue with order place
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

  Future<bool> sendOrderOnline(PlaceOrder data) async {
    try {
      UserInfo info = UserSessionManager.shared.userInfo!;
      final VerifyOrderResponse status = await MemberCallsService.init()
          .sendOrderOnline(
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
      if (status == "on") {
        // continue with order place
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

  Future<GetPeriodLogResponse?> placeOrder(String periodResponse) async {
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
      final VerifyOrderResponse response =
          await MemberCallsService.init().verifyOrder(requestData);
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
    }
  }

  String prepareRequestPaylod() {
    final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
    final nonEmptyProducts = cartProducts.where((e) => e.itemCode != "");
    final List<ProductLineItem> checkoutItems = nonEmptyProducts
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
        shipToEmail: usedInfo.email,
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
    final String jsonUser = jsonEncode(requestData);
    return jsonUser;
  }

  Future<bool> getPurchaseLog(int periodLog) async {
    try {
      final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
      final String status = await MemberCallsService.init().logPurchaseOrder(
          kPurchaseLog,
          prepareRequestPaylod(),
          usedInfo.id.unicity.toString(),
          getCurrentPeriod(),
          periodLog.toString());
      print("getPurchaseLog, ${status}");
      if (status == "on") {
        // continue with order place
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

  void onChangedSearchType(RadioButtonModel data) {
    seletedOption.value = paymentOptions[data.index];
    totalCheckoutAmount.value = data.index == 0
        ? totalCartPrice.value
        : totalCartPrice.value - availableCreditAmount.value;
  }

  void _onDioError(DioError e) {
    _sendingMsgProgressBar.hide();
    errorMessage(e.error.toString());
    renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    returnResponse(e.response!);
  }

  void _onCatchError(Object err) {
    errorMessage(err.toString());
    LoggerService.instance.e(err.toString());
    _sendingMsgProgressBar.hide();
  }
}
