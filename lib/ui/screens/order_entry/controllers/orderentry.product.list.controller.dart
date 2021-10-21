import 'package:dio/dio.dart';
import 'package:collection/collection.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryProductListController extends GetxController {
  TextEditingController searchUserTextController = TextEditingController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> searchOptions = [
    NameValueType(name: "My Cart", value: "myCart"),
    NameValueType(name: "Payment Type", value: "paymentType"),
  ].obs;
  RxString filterMethod = "all".obs;
  RxBool isLoading = false.obs;
  RxBool isFetching = false.obs;
  RxList<String> searchedUsers = <String>["Hi", "Sathya"].obs;
  final selecteduserIndex = Rxn<int>();
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;

  RxList<NameValueType> paymentTypes = [
    NameValueType(name: " Pay with DSC", value: "payWithDsc"),
  ].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> tempInventoryRecords = InventoryRecords(items: []).obs;

  RxString selectedPayment = "payWithDsc".obs;
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "order_entry");
    loadInventoryRecords();
    super.onInit();
  }

  Future<void> loadInventoryRecords() async {
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      isLoading.toggle();
      inventoryRecords =
          Rx(await ApiService.shared().getInventoryRecords(userId, "item"));
      isLoading.toggle();
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err, s) {
      _onCatchError(err, s);
    }
  }

  String _getErrorMessage(dynamic error) {
    // final errorObj = jsonDecode(error.toString());
    final mappedObj = error as Map<String, dynamic>;
    return mappedObj["error"]["error_message"].toString();
  }

  void _onDioError(DioError e) {
    isLoading.toggle();
    debugPrint(e.toString());
    final message = _getErrorMessage(e.response!.data);
    SnackbarUtil.showError(message: message);
    returnResponse(e.response!);
  }

  void _onCatchError(Object err, StackTrace s) {
    debugPrint(err.toString());
    SnackbarUtil.showError(message: "Error while getting user details!");
    LoggerService.instance.e(s);
    isLoading.toggle();
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    searchUserTextController.text = "";
    filterMethod.value = searchOptions[index].value;
    // getAllOpenPo();
  }

  void onSelectUser(int idx) {
    searchUserTextController.text = searchedUsers[idx];
    selecteduserIndex.value = idx;
    searchedUsers.refresh();
  }

  void onSearchPressed() {}

  void onCancel() {}

  void onProceedNext() {}

  void onTabChange(OrderEntryItemFilters type) {
    filterMethod.value =
        type == OrderEntryItemFilters.allProduct ? "all" : "easyShip";
  }

  void addItemToCart({required String itemCode}) {
    final bool targetFound =
        cartProducts.map((element) => element.itemCode).contains(itemCode);
    if (targetFound) {
      onPressRemove(itemCode);
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
    cartProducts.insert(0, item);
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
          target.totalPrice = target.quantity * target.itemPrice;
          target.totalPv = target.quantity * target.itemPv;
        }
      }
    }
    cartProducts.refresh();
  }

  void onUpdateQuantity(CartUpdate type, String itemCode) {
    if (type == CartUpdate.increament) {
      updateQuantity(CartUpdate.increament, itemCode);
    } else {
      updateQuantity(CartUpdate.decreament, itemCode);
    }
  }

  void calculateTotal() {
    totalCartPrice.value =
        cartProducts.fold(0, (i, element) => i + element.totalPrice);
    totalCartPv.value =
        cartProducts.fold(0, (i, element) => i + element.totalPv);
    // update();
  }

  void clearCart() {
    cartProducts.clear();
  }

  void onPressRemove(String itemCode) {
    final bool targetFound =
        cartProducts.map((element) => element.itemCode).contains(itemCode);
    if (!targetFound) return;
    cartProducts.removeWhere((item) => item.itemCode == itemCode);
    calculateTotal();
  }

  int cartItemIndex(String itemCode) {
    return cartProducts.reversed
        .toList()
        .indexWhere((element) => element.itemCode == itemCode);
  }

  bool isItemInCart(String itemCode) {
    // cartProducts.indexWhere((element) => false)(element)
    final CartProductsItem? item = cartProducts
        .firstWhereOrNull((element) => element.itemCode == itemCode);
    return item != null;
  }

  void onClickNuetralButton() {
    SnackbarUtil.showWarning(
        message: "Please add items to cart before proceed!");
  }

  void onTextChanged(String text) {
    tempInventoryRecords.value.items.clear();
    if (text.isEmpty) {
      tempInventoryRecords =
          InventoryRecords(items: List.from(tempInventoryRecords.value.items))
              .obs;
      tempInventoryRecords.refresh();
      return;
    }

    for (final item in inventoryRecords.value.items) {
      if (item.catalogSlideContent.content.description.contains(text) ||
          item.item.id.unicity.contains(text)) {
        tempInventoryRecords.value.items.add(item);
      }
    }
    tempInventoryRecords.refresh();
  }
}
