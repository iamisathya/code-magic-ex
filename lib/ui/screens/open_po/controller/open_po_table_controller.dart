import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/cart_products.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_minimal_data.dart';
import 'package:code_magic_ex/models/validate_order.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OpenPoTableController extends GetxController {
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  RxList<CartProductsItem> checkoutProducts = <CartProductsItem>[].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;

  final ProgressBar _sendingMsgProgressBar = ProgressBar();
  late UserMinimalData passedUser;

  @override
  void onInit() {
    super.onInit();
    _generateEmptyCart();
    initUserDetails();
  }

  void initUserDetails() {
    try {
      final UserInfo info = UserSessionManager.shared.userInfo!;
      if (info.id.unicity == "") return;
      passedUser = UserMinimalData(
          email: info.email,
          fullName: info.humanName.fullName,
          userId: info.id.unicity.toString());
    } catch (e) {
      LoggerService.instance.e(e.toString());
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
    try {
      final ValidateOrder reponse =
          await MemberCallsService.init().valiadateOrder("TH", "BKM");
      if (reponse.success == "yes") {
        // placeOrder(reponse.message);
      }
      _sendingMsgProgressBar.hide();
    } catch (err) {
      _sendingMsgProgressBar.hide();
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> placeOrder(String orderId) async {
    // type: 201, comment: TEST ORDER 2, token: cyzr29ke2go0at89ygorpdd, cus_id: 1, cus_dscid: 0001, poid: BKM 2021-07-W002, totalpv: 20, totalprice: 7,900, cusname: Thailand TEST DSC, data: @17532|1@17616|1
    try {
      final dynamic reponse = await MemberCallsService.init().placeOrder(
          kPlaceOrder,
          "TEST ORDER DYNAMIC",
          generateRandomString(23),
          UserSessionManager.shared.customerId,
          UserSessionManager.shared.customerCode,
          orderId,
          totalCartPv.value.toString(),
          totalCartPrice.value.toString(),
          "Thailand TEST DSC",
          _collectOrderData());
      if (reponse.success == "yes") {}
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  String _collectOrderData() {
    final buffer = StringBuffer();
    try {
      for (final item in cartProducts) {
        buffer.write("@${item.itemCode}|${item.quantity}");
      }
      return buffer.toString();
    } catch (e) {
      return buffer.toString();
    }
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
