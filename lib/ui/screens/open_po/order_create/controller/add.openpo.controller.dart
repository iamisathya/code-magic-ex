import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart' show DioError;
import 'package:dsc_tools/ui/global/widgets/inventory_bottom_sheet.dart';
import 'package:dsc_tools/ui/screens/open_po/order_list/controller/openpo.list.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../api/config/api_service.dart';
import '../../../../../api/request/request_place_open_po_order.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/globals.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../models/inventory_item_v2.dart';
import '../../../../../models/inventory_records.dart';
import '../../../../../models/open_po_create_order_response.dart';
import '../../../../../models/openpo_create_order_result.dart';
import '../../../../../models/validate_order.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/function.dart';
import '../../../../../utilities/logger.dart';
import '../../../../../utilities/snackbar.dart';
import '../../../../../utilities/user_session.dart';
import '../../order_success/main_screen.dart';

class CreateOpenPoOrderController extends GetxController
    with StateMixin<List<InventoryRecords>> {
  final TextEditingController searchProductTextController = TextEditingController();
  final Rx<InventoryItemV2> inventoryRecordsV2 = InventoryItemV2(items: []).obs;
  final Rx<InventoryItemV2> searchResult1 = InventoryItemV2(items: []).obs;
  final RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  final OpenPoListController poListController = Get.find();

  RxInt totalCartPv = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  XFile uploadFile = XFile("");
  RxString selectedFileName = "".obs;
  String? selectedImageBaes64 = "";
  RxBool isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    initialiseCreate();
    super.onInit();
  }

  void initialiseCreate() {
    inventoryRecordsV2.value.items =
        List.from(poListController.inventoryRecordsV2.value.items!);
    searchResult1.value.items =
        List.from(poListController.inventoryRecordsV2.value.items!);
    calculateTotal();
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
      searchResult1.value.items = List.from(inventoryRecordsV2.value.items!);
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

  void showBottomModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.kWhiteSmokeColor,
      context: context,
      isDismissible: true,
      builder: (context) {
        return InventoryBottomSheet(
            onSearchTextChange: (val) => onSearchTextChange(val),
            onTapItem: (item) => addItemToCart(item),
            searchProductTextController: searchProductTextController,
            searchResult: searchResult1);
      },
    ).whenComplete(() => searchProductTextController.text = "");
  }
}
