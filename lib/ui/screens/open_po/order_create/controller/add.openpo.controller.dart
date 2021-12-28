import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart' show DioError;
import 'package:dsc_tools/models/product_v2.dart';
import 'package:dsc_tools/services/rest_api/exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../api/config/api_service.dart';
import '../../../../../api/request/request_place_open_po_order.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/globals.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../models/inventory_records.dart';
import '../../../../../models/managed_warehouse.dart';
import '../../../../../models/open_po_create_order_response.dart';
import '../../../../../models/openpo_create_order_result.dart';
import '../../../../../models/validate_order.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/function.dart';
import '../../../../../utilities/images.dart';
import '../../../../../utilities/logger.dart';
import '../../../../../utilities/snackbar.dart';
import '../../../../../utilities/user_session.dart';
import '../../../../global/theme/text_view.dart' show AppText;
import '../../../order_entry/screens/home/components/white_search_field.dart';
import '../../order_success/main_screen.dart';

class CreateOpenPoOrderController extends GetxController
    with StateMixin<List<InventoryRecords>> {
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  final Rx<InventoryRecords> searchResult = InventoryRecords(items: []).obs;
  TextEditingController searchProductTextController = TextEditingController();
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  ManagedWarehouses warehouses = ManagedWarehouses(items: []);
  late HydraProducts hydraProducts;

  RxInt totalCartPv = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  XFile uploadFile = XFile("");
  RxString selectedFileName = "".obs;
  String? selectedImageBaes64 = "";
  RxBool isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    loadInventory();
    super.onInit();
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
          await MemberCalls2Service.init().getHydraProducts("THA", "A", "shop");
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
      calculateTotal();
      isLoading.toggle();
    } on AppException catch (exception, stack) {
      isLoading.toggle();
      exception.logError(exception, stack);
    }
  }

  int get inventorySize => searchProductTextController.text.isNotEmpty
      ? searchResult.value.items.length
      : inventoryRecords.value.items.length;

  InventoryRecords get inventoryItems =>
      searchProductTextController.text.isNotEmpty
          ? searchResult.value
          : inventoryRecords.value;

  Future<InventoryRecords?> getManagedWarehouses() async {
    try {
      warehouses = await ApiService.shared().getManagedWarehouses();
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
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  Future<InventoryRecords?> loadInventoryProducts(String warehouseId) async {
    const String type = "item";
    try {
      return await ApiService.shared().getInventoryRecords(warehouseId, type);
    } on DioError catch (e) {
      final String message = getErrorMessage(e.response!.data);
      SnackbarUtil.showError(message: "${"error".tr}! $message");
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> addItemToCart(InventoryRecordItems cartItem) async {
    final CartProductsItem target = cartProducts.firstWhere(
        (item) => item.itemCode == cartItem.item.id.unicity,
        orElse: () => CartProductsItem());

    if (target.itemCode != "") {
      onUpdateQuantity(CartUpdate.increament, target.itemCode);
    } else {
      final CartProductsItem i = CartProductsItem(
          itemCode: cartItem.item.id.unicity,
          productName: cartItem.catalogSlideContent.content.description,
          quantity: 1,
          itemPrice: cartItem.terms.priceEach,
          itemPv: cartItem.terms.pvEach,
          totalPrice: 1 * cartItem.terms.priceEach,
          totalPv: 1 * cartItem.terms.pvEach);
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

  void brosweAttachment(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: Text("take_select_photo_msg".tr),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () => onImageOptionSelect(ImageSource.camera),
            child: Text("open_camera".tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () => onImageOptionSelect(ImageSource.gallery),
            child: Text("browse_photos".tr),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: Navigator.of(context).pop,
          child: Text("cancel".tr),
        ),
      ),
    );
  }

  Future<void> onImageOptionSelect(ImageSource source) async {
    try {
      final _pickedImage = (await _picker.pickImage(
        source: source,
      ))!;
      selectedImageBaes64 = await readFileByte(_pickedImage.path);
      uploadFile = _pickedImage;
      debugPrint(_pickedImage.path.split('/').last);
      selectedFileName.value = _pickedImage.path.split('/').last;
      Navigator.of(Get.context!).pop();
    } catch (e) {
      Navigator.of(Get.context!).pop();
      debugPrint(e.toString());
    }
  }

  Future<void> validateOrder(BuildContext context) async {
    if (cartProducts.isEmpty) {
      SnackbarUtil.showError(message: "add_products_to_cart_to_checkout".tr);
      return;
    }
    confirmOrder(context);
  }

  Future<void> confirmOrder(BuildContext context) async {
    try {
      isLoading.toggle();
      final dynamic reponse = await MemberCallsService.init()
          .valiadateOrder("TH", Globals.customerPoCode);
      final jsonResponse = jsonDecode(reponse.toString());
      final ValidateOrder orderResponse =
          ValidateOrder.fromJson(jsonResponse as Map<String, dynamic>);
      if (orderResponse.success == "Yes") {
        placeOrder(orderResponse.message, context);
      }
    } on DioError catch (e) {
      isLoading.toggle();
      renderErrorSnackBar(title: "error!".tr, subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
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

  Future<void> placeOrder(String orderId, BuildContext context) async {
    // type: 201, comment: TEST ORDER 2, token: cyzr29ke2go0at89ygorpdd, cus_id: 1, cus_dscid: 0001, poid: BKM 2021-07-W002, totalpv: 20, totalprice: 7,900, cusname: Thailand TEST DSC, data: @17532|1@17616|1
    try {
      final RequestPlaceOpenPoOrder request = RequestPlaceOpenPoOrder(
          comment: "",
          customerId: UserSessionManager.shared.customerIdInfo!.customerId,
          customeDscId: UserSessionManager.shared.customerIdInfo!.customerCode,
          poId: orderId,
          totalPrice: totalCartPv.value.toString(),
          totalPv: totalCartPrice.value.toString(),
          customerName: UserSessionManager.shared.userInfo!.humanName.fullName,
          base64Image: selectedImageBaes64!.isNotEmpty
              ? "data:image/png;base64,${selectedImageBaes64!}"
              : "",
          item: _collectOrderData());
      final OpenPOCreateOrderResponse reponse =
          await MemberCallsService.init().placeOrder(kPlaceOrder, request);
      isLoading.toggle();
      // Sending result
      _onPlaceOrder(reponse);
    } on DioError catch (e) {
      isLoading.toggle();
      renderErrorSnackBar(title: "error!".tr, subTitle: e.error.toString());
      returnResponse(e.response!);
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }

  void _onPlaceOrder(OpenPOCreateOrderResponse reponse) {
    final OpenPoCreateOrderResult args = OpenPoCreateOrderResult(
        isSuccess: reponse.success,
        poNumber: reponse.poId,
        distributorId: Globals.userId);
    if (reponse.success == true) {
      Get.offAll(() => CreateOpenPoOrderResult(), arguments: args);
    } else {
      Get.offAll(() => CreateOpenPoOrderResult(), arguments: args);
    }
  }

  void onSearchTextChange(String searchKey) {
    if (searchKey == "") {
      searchResult.value.items = List.from(inventoryRecords.value.items);
      return;
    }
    searchResult.value.items.clear();
    searchResult.value.items = inventoryRecords.value.items
        .where((item) => item.catalogSlideContent.content.description
            .toLowerCase()
            .contains(searchKey.toLowerCase()))
        .toList();
    searchResult.refresh();
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
                      hintText: "",
                      isFetching: false.obs),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      controller: ctrl,
                      itemCount: searchResult.value.items.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final InventoryRecordItems item =
                            searchResult.value.items[index];
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
                                    child: (item.imageUrl != null &&
                                            item.imageUrl!.isNotEmpty)
                                        ? CachedNetworkImage(
                                            imageUrl: item.imageUrl!,
                                            height: 55,
                                            width: 70)
                                        : SvgPicture.asset(
                                            kProductPlaceholderImage,
                                            width: 80),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            item.catalogSlideContent.content
                                                .description,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: AppColor.charcoal)),
                                        AppText(
                                          text:
                                              "${"code".tr}: ${item.item.id.unicity}",
                                          style: TextTypes.caption,
                                          color: AppColor.metallicSilver,
                                        ),
                                        AppText(
                                          text:
                                              "${item.terms.pvEach} ${"pv".tr} | ${item.terms.priceEach} ${Globals.currency}",
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
}
