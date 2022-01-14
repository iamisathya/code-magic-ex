import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/cart_products.dart';
import '../../../../models/general_models.dart';
import '../../../../models/inventory_records.dart';
import '../../../../models/user_minimal_data.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/snackbar.dart';
import '../../home/controller/home.controller.dart';
import '../screens/order_entry_summary/home.dart';

class OrderEntryProductListController extends GetxController {
  TextEditingController searchUserTextController = TextEditingController();
  HomeController homeController = HomeController();
  RxInt currentTab = 0.obs;
  RxList<NameValueType> filterOptions = [
    NameValueType(name: "all_product", value: "all"),
    NameValueType(name: "easyship_set", value: "easyShip"),
  ].obs;
  RxString filterMethod = "all".obs;

  RxBool isLoading = false.obs;
  RxBool isFetching = false.obs;
  RxList<String> searchedUsers = <String>[].obs;
  final selecteduserIndex = Rxn<int>();
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;

  late UserMinimalData userData;

  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  Rx<InventoryRecords> inventoryEasyShipRecords =
      InventoryRecords(items: []).obs;
  Rx<InventoryRecords> tempInventoryEasyShipRecords =
      InventoryRecords(items: []).obs;
  Rx<InventoryRecords> tempInventoryRecords = InventoryRecords(items: []).obs;
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "order_entry");
    receiveIntentData();
    loadInventoryRecords();
    super.onInit();
  }

  void receiveIntentData() {
    final dynamic data = Get.arguments;
    if (data != null) {
      userData = data as UserMinimalData;
    } else {
      Get.back();
    }
  }

  set currentFilteredMethod(String type) => filterMethod.value = type;

  String get currentFilteredMethod => filterMethod.value;

  Future<void> loadInventoryRecords() async {
    // const String userId =
    //     "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      isLoading.toggle();
      // inventoryRecords =
      //     Rx(await ApiService.shared().getInventoryRecords(userId, "item"));
      // final InventoryRecords invRecords = await homeController.loadInventory();
      // inventoryRecords.value = invRecords;
      // tempInventoryRecords.value = invRecords;
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
    SnackbarUtil.showError(message: "error_getting_user_details".tr);
    LoggerService.instance.e(s);
    isLoading.toggle();
  }

  void onChangeMonthType(int index) {
    currentTab.value = index;
    searchUserTextController.text = "";
    filterMethod.value = filterOptions[index].value;
    // getAllOpenPo();
  }

  void onSelectUser(int idx) {
    searchUserTextController.text = searchedUsers[idx];
    selecteduserIndex.value = idx;
    searchedUsers.refresh();
  }

  void onSearchPressed() {}

  void onCancel() {
    Get.back();
  }

  void onProceedNext() {}

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
        imageUrl: itemFound.imageUrl ?? "",
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
    calculateTotal();
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

  void clearCart({bool clearOnly = false}) {
    cartProducts.clear();
    if (!clearOnly) {
      Navigator.pop(Get.context!);
    }
    calculateTotal();
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
    SnackbarUtil.showWarning(message: "please_add_item_to_cart_msg".tr);
  }

  void onClickPositiveButton() {
    Get.to(() => OrderEntrySummary());
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
