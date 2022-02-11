import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dsc_tools/routes/app_pages.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../data/provider/globals.dart';
import '../../../data/model/cart_products.dart';
import '../../../data/model/general_models.dart';
import '../../../data/model/inventory_item_v2.dart';
import '../../../data/model/user_minimal_data.dart';
import '../../../data/services/api_service.dart';
import '../../../helpers/exceptions.dart';
import '../../../utils/snackbar.dart';
import '../../home/controller/home.controller.dart';

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

  // Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  Rx<InventoryItemV2> inventoryEasyShipRecords = InventoryItemV2(items: []).obs;
  Rx<InventoryItemV2> tempInventoryEasyShipRecords =
      InventoryItemV2(items: []).obs;
  Rx<InventoryItemV2> inventoryRecords = InventoryItemV2(items: []).obs;
  Rx<InventoryItemV2> tempInventoryRecords = InventoryItemV2(items: []).obs;

  @override
  void onInit() {
    FirebaseAnalytics().setCurrentScreen(screenName: "order_entry");
    receiveIntentData();
    loadInventory();
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

  Future<void> loadInventory() async {
    try {
      isLoading.toggle();
      final InventoryItemV2 records = await MemberCalls2Service.auth()
          .loadInventoryProductsV2(Globals.currentMarketWarehouseId, "item",
              Globals.currentMarket!.isoCode);
      inventoryRecords.value.items = List.from(records.items!);
      tempInventoryRecords.value.items = List.from(records.items!);
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      debugPrint(e.toString());
    } on AppException catch (exception, stack) {
      isLoading.toggle();
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stack);
    }
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
    final InventoryItem itemFound = inventoryRecords.value.items!
        .firstWhere((item) => item.item!.id!.unicity == itemCode);
    final CartProductsItem item = CartProductsItem(
        itemCode: itemFound.item!.id!.unicity!,
        productName: itemFound.catalogSlide!.content!.description!,
        quantity: 1,
        itemPrice: itemFound.terms!.priceEach!,
        itemPv: itemFound.terms!.pvEach!,
        imageUrl: itemFound.itemInfo!.imageUrl,
        totalPrice: 1 * itemFound.terms!.priceEach!,
        totalPv: 1 * itemFound.terms!.pvEach!);
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
    Get.toNamed(Routes.ORDER_ENTRY_SUMMARY);
  }

  void onTextChanged(String text) {
    tempInventoryRecords.value.items!.clear();
    if (text.isEmpty) {
      tempInventoryRecords =
          InventoryItemV2(items: List.from(tempInventoryRecords.value.items!))
              .obs;
      tempInventoryRecords.refresh();
      return;
    }

    for (final item in inventoryRecords.value.items!) {
      if (item.catalogSlide!.content!.description!.contains(text) ||
          item.item!.id!.unicity!.contains(text)) {
        tempInventoryRecords.value.items!.add(item);
      }
    }
    tempInventoryRecords.refresh();
  }
}
