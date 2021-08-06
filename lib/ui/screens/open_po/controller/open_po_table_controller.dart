import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../../../../api/config/api_service.dart';
import '../../../../api/config/member_class.dart';
import '../../../../api/request/request_place_open_po_order.dart';
import '../../../../models/cart_products.dart';
import '../../../../models/inventory_records.dart';
import '../../../../models/open_po_create_order_response.dart';
import '../../../../models/user_info.dart';
import '../../../../models/user_minimal_data.dart';
import '../../../../models/validate_order.dart';
import '../../../../utilities/Logger/logger.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/overlay_progress.dart';
import '../home/home.dart';
import '../order_table/components/upload_image.dart';

class OpenPoTableController extends GetxController {
  TextEditingController selectedFileController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  RxList<CartProductsItem> checkoutProducts = <CartProductsItem>[].obs;
  Rx<InventoryRecords> inventoryRecords = InventoryRecords(items: []).obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt totalCartPv = 0.obs;

  final ProgressBar _sendingMsgProgressBar = ProgressBar();
  late UserMinimalData passedUser;
  XFile uploadFile = XFile("");
  String? selectedImageBaes64 = "";
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _generateEmptyCart();
    FirebaseAnalytics().setCurrentScreen(screenName: "open_po_table");
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
    renderBottomSheet(context);
  }

  Future<void> confirmOrder(BuildContext context) async {
    _sendingMsgProgressBar.show(context);
    try {
      final dynamic reponse =
          await MemberCallsService.init().valiadateOrder("TH", "BKM");
      final jsonResponse = jsonDecode(reponse.toString());
      final ValidateOrder orderResponse =
          ValidateOrder.fromJson(jsonResponse as Map<String, dynamic>);
      if (orderResponse.success == "Yes") {
        placeOrder(orderResponse.message, context);
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    }
  }

  Future<void> placeOrder(String orderId, BuildContext context) async {
    // type: 201, comment: TEST ORDER 2, token: cyzr29ke2go0at89ygorpdd, cus_id: 1, cus_dscid: 0001, poid: BKM 2021-07-W002, totalpv: 20, totalprice: 7,900, cusname: Thailand TEST DSC, data: @17532|1@17616|1
    try {
      final RequestPlaceOpenPoOrder request = RequestPlaceOpenPoOrder(
          comment: commentController.text,
          customerId: UserSessionManager.shared.customerIdInfo!.customerId,
          customeDscId: UserSessionManager.shared.customerIdInfo!.customerCode,
          poId: orderId,
          totalPrice: totalCartPv.value.toString(),
          totalPv: totalCartPrice.value.toString(),
          customerName: UserSessionManager.shared.userInfo!.humanName.fullName,
          base64Image: "data:image/png;base64,${selectedImageBaes64!}",
          item: _collectOrderData());
      final OpenPOCreateOrderResponse reponse =
          await MemberCallsService.init().placeOrder(kPlaceOrder, request);
      if (reponse.success == true) {
        renderGetSnackbar(
            title: "Order created! Id: ${reponse.poId}",
            message: "Your order created successfully");
        _sendingMsgProgressBar.hide();
        Navigator.pop(context);
        Timer(const Duration(milliseconds: 1000), () {
          Get.off(() => OpenPOHomeScreen());
        });
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    }
  }

  String _collectOrderData() {
    final buffer = StringBuffer();
    try {
      for (final item in checkoutProducts) {
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
    //* Logging add to cart
    FirebaseAnalytics().logAddToCart(
      itemId: itemFound.item.id.unicity,
      itemName: itemFound.catalogSlideContent.content.description,
      itemCategory: "open_po",
      quantity: 1,
      price: itemFound.terms.priceEach,
      origin: "TH",
      currency: "THB",
    ); //! Update currency
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
    final CartProductsItem target =
        cartProducts.firstWhere((item) => item.itemCode == itemCode);
    //** Logging remove from cart
    FirebaseAnalytics().logRemoveFromCart(
        itemId: target.itemCode,
        itemName: target.productName,
        itemCategory: "open_po",
        quantity: 0);
  }

  List<String> dropDownItems() {
    final items =
        inventoryRecords.value.items.map((e) => e.item.id.unicity).toList();
    return items;
  }

  void selectSource() {
    final Widget cameraButton = TextButton(
      onPressed: () {
        browseImage(ImageSource.camera);
        Get.back();
      },
      child: const Text(
        "Open Camera",
        style: TextStyle(color: Colors.black),
      ),
    );
    final Widget photosButton = TextButton(
      onPressed: () {
        browseImage(ImageSource.gallery);
        Get.back();
      },
      child: const Text(
        "Browse photos",
        style: TextStyle(color: Colors.black),
      ),
    );
    final Widget canncelButton = TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text(
        "Cacnel",
        style: TextStyle(color: Colors.red),
      ),
    );

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Upload Image",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        content: const Text(
          "Take/Select an image you wish to upload",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          cameraButton,
          photosButton,
          canncelButton,
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future<void> browseImage(ImageSource source) async {
    try {
      final _pickedImage = (await _picker.pickImage(
        source: source,
      ))!;
      selectedImageBaes64 = await readFileByte(_pickedImage.path);
      uploadFile = _pickedImage;
      selectedFileController.text =
          '           ${_pickedImage.path.split('/').last}';
      debugPrint(_pickedImage.path.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> uploadImage() async {
    if (uploadFile.path.isEmpty) return;
    try {
      final String fileName = uploadFile.path.split('/').last;
      final FormData formData = FormData.fromMap({
        "kartik-input-710":
            await MultipartFile.fromFile(uploadFile.path, filename: fileName),
      });
      final response = await MemberCallsService.init().uploadFile(
          "weylbzpplvy6wq9ae5rma",
          "BKM%20-00-W001",
          "0",
          kUploadFileId,
          formData);

      final jsonResponse = jsonDecode(response.toString());
      if (jsonResponse != null) {
        final mapped = jsonResponse as Map<String, dynamic>;
        debugPrint(mapped["append"].toString());
        debugPrint(mapped["id"].toString());
      }
    } on DioError catch (e) {
      _onDioError(e);
    } catch (err) {
      _onCatchError(err);
    }
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
