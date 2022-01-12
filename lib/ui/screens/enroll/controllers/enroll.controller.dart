import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../models/cart_products.dart';
import '../../../../models/inventory_item_v2.dart';
import '../../../../models/inventory_records.dart';
import '../../../../models/managed_warehouse.dart';
import '../../../../models/product_v2.dart';
import '../../../../services/rest_api/exceptions.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/logger.dart';
import '../../../../utilities/snackbar.dart';
import '../../../global/theme/text_view.dart';
import '../../order_entry/screens/home/components/white_search_field.dart';
import '../screens/enrollment_details/home.dart';

class EnrollHomeController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController searchProductTextController = TextEditingController();
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  final Rx<InventoryRecords> searchResult = InventoryRecords(items: []).obs;
  final Rx<InventoryItemV2> searchResult1 = InventoryItemV2(items: []).obs;
  Rx<InventoryItemV2> inventoryRecordsV2 = InventoryItemV2(items: []).obs;
  ManagedWarehouses warehouses = ManagedWarehouses(items: []);
  late HydraProducts hydraProducts;
  RxInt totalCartPv = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onInit() {
    // loadInventory();
    getManagedWarehouses1();
    // cartProducts
    //     .listen((c) => {cartProducts.refresh(), calculateTotal()});
    super.onInit();
  }

  Future<void> loadInventory2(String warehouseId) async {
    try {
      final InventoryItemV2 records = await MemberCalls2Service.authNoLogger()
          .loadInventoryProductsV2(
              warehouseId, "item", Globals.currentMarket!.isoCode);
      inventoryRecordsV2.value.items = List.from(records.items!);
      searchResult1.value.items = List.from(records.items!);
      addStarterKit();
      calculateTotal();
      if (records.items!.isEmpty) {
        SnackbarUtil.showError(message: "no_warehouses_found".tr);
      }
    } on DioError catch (e, stack) {
      const AppException().logError(e, stack);
    } on AppException catch (exception, stack) {
      exception.logError(exception, stack);
    }
  }

  Future<void> loadInventory() async {
    try {
      isLoading.toggle();
      await Future.wait<void>([
        getManagedWarehouses().then((value) =>
            value != null ? inventoryRecords.value.items = value.items : {}),
        getHydraProducts().then((value) => value != null
            ? hydraProducts = value
            : {}), // Get hydra products to get image urls
      ]).then((value) => mapInventoryItems());
    } on AppException catch (exception, stack) {
      isLoading.toggle();
      exception.logError(exception, stack);
    }
  }

  Future<HydraProducts?> getHydraProducts() async {
    try {
      final HydraProducts hydraProducts =
          await MemberCalls2Service.clientNoLogger()
              .getHydraProducts("THA", "A", "shop");
      return hydraProducts;
    } on DioError catch (e) {
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } catch (err, s) {
      Get.printError(info: err.toString());
      Get.printError(info: s.toString());
    }
  }

  void mapInventoryItems() {
    try {
      for (var i = 0; i < hydraProducts.items.length; i++) {
        final ProductItem currentItem = hydraProducts.items[i];
        final int index = inventoryRecords.value.items.indexWhere(
            (hydraItem) => currentItem.itemCode == hydraItem.item.id.unicity);
        if (index != -1) {
          inventoryRecords.value.items[index].imageUrl = currentItem.imageUrl;
        }
      }
      searchResult.value.items = List.from(inventoryRecords.value.items);
      inventoryRecords.refresh();
      searchResult.refresh();
      addStarterKit();
      calculateTotal();
      isLoading.toggle();
    } on AppException catch (exception, stack) {
      isLoading.toggle();
      exception.logError(exception, stack);
    }
  }

  Future<void> getManagedWarehouses1() async {
    isLoading.toggle();
    try {
      warehouses = await ApiService.clientNoLogger().getManagedWarehouses();
      if (warehouses.items.isNotEmpty) {
        await loadInventory2(warehouses.items[0].href.getAfterLastSlash());
      } else {
        SnackbarUtil.showError(message: "no_warehouses_found".tr);
      }
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } on AppException catch (err, stack) {
      isLoading.toggle();
      err.logError(err, stack);
    }
  }

  Future<InventoryRecords?> getManagedWarehouses() async {
    // InventoryRecords? records = InventoryRecords(items: []);
    try {
      warehouses = await ApiService.clientNoLogger().getManagedWarehouses();
      if (warehouses.items.isNotEmpty) {
        return await loadInventoryProducts(
            warehouses.items[0].href.getAfterLastSlash());
      } else {
        SnackbarUtil.showError(message: "no_warehouses_found".tr);
      }
    } on DioError catch (e) {
      isLoading.toggle();
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: message);
      returnResponse(e.response!);
    } on AppException catch (err, stack) {
      isLoading.toggle();
      err.logError(err, stack);
    }
  }

  Future<InventoryRecords?> loadInventoryProducts(String warehouseId) async {
    const String type = "item";
    try {
      return await ApiService.clientNoLogger()
          .getInventoryRecords(warehouseId, type);
    } on DioError catch (e) {
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: "${"error!".tr} $message");
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  void onSearchTextChange(String searchKey) {
    if (searchKey == "") {
      searchResult1.value.items =
          List.from(inventoryRecordsV2.value.items!.toList());
      return;
    }
    searchResult1.value.items!.clear();
    searchResult1.value.items = inventoryRecordsV2.value.items!
        .where((item) => item.catalogSlide!.content!.description!
            .toLowerCase()
            .contains(searchKey.toLowerCase()))
        .toList();
    searchResult1.refresh();
  }

  void removeItem(String itemCode) {
    cartProducts.removeWhere((element) => element.itemCode == itemCode);
    cartProducts.refresh();
    calculateTotal();
  }

  void addStarterKit() {
    try {
      final InventoryItem? cartItem = searchResult1.value.items!
          .firstWhereOrNull((element) =>
              element.catalogSlide!.content!.description == "Starter Kit TH");
      if (cartItem == null) {
        SnackbarUtil.showWarning(message: "No starter kit found!");
      } else {
        // check if item already exists
        final CartProductsItem target = cartProducts.firstWhere(
            (item) => item.itemCode == cartItem.item!.id!.unicity,
            orElse: () => CartProductsItem());
        if (target.itemCode == "") {
          // if starter kit item not found in cart
          final CartProductsItem i = CartProductsItem(
              itemCode: cartItem.item!.id!.unicity!,
              productName: cartItem.catalogSlide!.content!.description!,
              quantity: 1,
              itemPrice: cartItem.terms!.priceEach!.toDouble(),
              itemPv: cartItem.terms!.pvEach!,
              totalPrice: 1 * cartItem.terms!.priceEach!.toDouble(),
              totalPv: 1 * cartItem.terms!.pvEach!);
          cartProducts.insert(0, i);
          calculateTotal();
        }
      }
    } on AppException catch (exception, stack) {
      isLoading.toggle();
      exception.logError(exception, stack);
    }
  }

  void onContinue() {
    if (cartProducts.isEmpty) {
      SnackbarUtil.showWarning(message: "add_products_to_cart_to_checkout".tr);
      return;
    }
    Get.to(() => EnrollmentDetailsHomeScreen());
  }

  void showBottomModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.kWhiteSmokeColor,
      context: context,
      isDismissible: true,
      builder: (context) {
        return DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.75,
          expand: false,
          builder: (_, ctrl) => Container(
            color: AppColor.brightGray,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: WhiteSearchField(
                      controller: searchProductTextController,
                      onChanged: (val) => onSearchTextChange(val),
                      onPress: () {},
                      isFetching: false.obs),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      controller: ctrl,
                      itemCount: searchResult1.value.items!.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final InventoryItem item =
                            searchResult1.value.items![index];
                        return GestureDetector(
                          onTap: () {
                            addItemToCart(item);
                            Navigator.pop(context);
                          },
                          child: Card(
                            child: Container(
                              height: 75,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: CachedNetworkImage(
                                        imageUrl: item.itemInfo!.imageUrl,
                                        height: 55,
                                        width: 70,
                                        errorWidget: (context, url, _) =>
                                            SvgPicture.asset(
                                                kProductPlaceholderImage,
                                                width: 80)),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            item.catalogSlide!.content!
                                                .description!,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: AppColor.charcoal)),
                                        AppText(
                                          text:
                                              "${"code".tr}: ${item.item!.id!.unicity}",
                                          style: TextTypes.caption,
                                          color: AppColor.metallicSilver,
                                        ),
                                        AppText(
                                          text:
                                              "${item.terms!.pvEach} ${"pv".tr} | ${item.terms!.priceEach} ${Globals.currency}",
                                          style: TextTypes.subtitle2,
                                          color: AppColor.charcoal,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).whenComplete(() => searchProductTextController.text = "");
  }

  Future<void> addItemToCart(InventoryItem cartItem) async {
    final CartProductsItem target = cartProducts.firstWhere(
        (item) => item.itemCode == cartItem.item!.id!.unicity,
        orElse: () => CartProductsItem());
    if (target.itemCode != "") {
      onUpdateQuantity(CartUpdate.increament, target.itemCode);
    } else {
      final CartProductsItem i = CartProductsItem(
          itemCode: cartItem.item!.id!.unicity!,
          productName: cartItem.catalogSlide!.content!.description!,
          quantity: 1,
          itemPrice: cartItem.terms!.priceEach!.toDouble(),
          itemPv: cartItem.terms!.pvEach!,
          totalPrice: 1 * cartItem.terms!.priceEach!.toDouble(),
          imageUrl: cartItem.itemInfo!.imageUrl,
          totalPv: 1 * cartItem.terms!.pvEach!);
      cartProducts.insert(0, i);
      calculateTotal();
    }
  }

  void onUpdateQuantity(CartUpdate type, String itemCode) {
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
          target.totalPrice = target.quantity * target.itemPrice;
          target.totalPv = target.quantity * target.itemPv;
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
  }
}
