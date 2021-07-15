import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/cart_products.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/models/order_entry_product_item.dart';
import 'package:code_magic_ex/models/order_entry_product_info.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';

class OrderEntryTableController extends GetxController {
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  RxList<OrderEntryItem> allProductList = <OrderEntryItem>[].obs;
  OrderEntryProductInfo orderEntryProductInfo = OrderEntryProductInfo();
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // loadInventoryRecords();
    _generateEmptyCart();
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

  Future<void> getOrderEntryProductList(String itemCode) async {
    const String warehouse =
        "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      // * search for users by user id(search key)
      allProductList.value = await MemberCallsService.init()
          .getOrderEntryProductList(kOrderEntryProductList,
              "6e4234c7-fee7-4160-9e17-c029415a6b4f", warehouse);
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> getOrderEntryProductInfo(String itemCode) async {
    const String selectname = "itemcode190";
    try {
      // * search for users by user id(search key)
      var response = await MemberCallsService.init().getOrderEntryProductInfo(
          kOrderEntryProductInfo, itemCode, selectname);
    } on DioError catch (e) {
      errorMessage(e.error.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    } finally {
      isLoading(false);
    }
  }

  void addItemToCart({required String itemCode, required int index}) {
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
    update();
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
          cartProducts.removeWhere((item) => item.itemCode == itemCode);
        } else {
          target.quantity = target.quantity - 1;
        }
      }
    }
    update();
  }

  void placeOrder() {}
}
