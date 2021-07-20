import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/api/request/request_order_calculation.dart';
import 'package:code_magic_ex/models/order_calc_response.dart';
import 'package:code_magic_ex/models/cart_products.dart';
import 'package:code_magic_ex/models/cash_coupon_response.dart';
import 'package:code_magic_ex/models/enroll_response.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryTableController extends GetxController {
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;
  RxInt availableCreditAmount = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _generateEmptyCart();
    loadInventoryRecords();
  }

  void _generateEmptyCart() {
    for (var i = 0; i < 40; i++) {
      final CartProductsItem item = CartProductsItem();
      cartProducts.add(item);
    }
  }

  Future<void> loadInventoryRecords() async {
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      inventoryRecords =
          Rx(await ApiService.shared().getInventoryRecords(userId, "item"));
      dropDownItems();
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<bool> validateEmail() async {
    try {
      final EnrollResponse validationResponse = await MemberCallsService.init()
          .validateEmail(kCurrentLanguage, "rasachankan@gmail.com");
      if (validationResponse.success != "No") {
        return true;
      }
      return false;
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
      return false;
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<bool> orderCalculation() async {
    try {
      final List<LineItem> checkoutItems = cartProducts
          .map((element) => LineItem(
              itemId: element.itemCode,
              quantity: element.quantity.toString(),
              items: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/items?id.unicity=${element.itemCode}")))
          .toList();
      final RequestOrderCalculation requestObject = RequestOrderCalculation(
          uShopData: UShopData(loginId: "3011266"),
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
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
      return false;
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getCashCoupon() async {
    try {
      final CashCouponResponse cashCoupon = await MemberCalls2Service.init()
          .getCashCoupon(totalCartPv.value.toString());
      if (cashCoupon.success != false) {
        // continue with order place
        availableCreditAmount.value = cashCoupon.availableCreditAmount;
      }
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> validateOrder() async {
    final bool isValidEMail = await validateEmail();
    if (!isValidEMail) return;

    final bool validated = await orderCalculation();
    if (!validated) return;

    await getCashCoupon();
    if (!validated) return;
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
        target.quantity = target.quantity + 1;
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

  void placeOrder() {}

  List<String> dropDownItems() {
    final items =
        inventoryRecords.value.items.map((e) => e.item.id.unicity).toList();
    return items;
  }
}
