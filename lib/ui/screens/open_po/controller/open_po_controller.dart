import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/cart_products.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/models/validate_order.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/ui/screens/open_po/order_details/partner_order_details.dart';
import 'package:code_magic_ex/ui/screens/open_po/order_table/order_entry.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/open_order_id.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class OpenPoController extends GetxController {
  RxString filterMethod = "6".obs;
  RxInt count = 0.obs;
  String currentPoNumber = "";

  RxInt totalCartPv = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;

  Rx<InventoryRecords> _inventoryRecords = InventoryRecords(items: []).obs;
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;
  RxList<OpenPO> allOpenPlaceOrders = List<OpenPO>.filled(0, OpenPO()).obs;
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails =
      List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;
  OpenPlaceOrderId openPlaceOrderId = OpenPlaceOrderId();
  RxList<OpenPO> _tempOpenPlaceOrders = <OpenPO>[].obs;
  RxInt increment() => count++;
  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  // Use this to retrieve all records
  List<OpenPO> get openPlaceOrders {
    return _tempOpenPlaceOrders;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _generateEmptyCart();
  }

  void _generateEmptyCart() {
    for (var i = 0; i < 40; i++) {
      final CartProductsItem item = CartProductsItem();
      cartProducts.add(item);
    }
  }

  void addItemToCart({required String itemCode, required int index}) {
    final InventoryRecordItems itemFound = _inventoryRecords.value.items
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

  // double totalCartPrice() {
  //   double totalCartAmount = 0.0;
  //   for (final item in cartProducts) {
  //     totalCartAmount += item.totalPrice;
  //   }
  //   return totalCartAmount;
  // }

  bool get isEmptyCart => cartProducts.isEmpty;

  // int totalCartPv() {
  //   int totalCartPv = 0;
  //   for (final item in cartProducts) {
  //     totalCartPv += item.totalPv;
  //   }
  //   return totalCartPv;
  // }

  bool checkIsItemExist(int index) {
    if (cartProducts.asMap().containsKey(index)) {
      return true;
    }
    return false;
  }

  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  OpenPoTypes currentType = OpenPoTypes.poNumber;

  RxString errorMessage = "".obs;
  RxString detailsErrorMessage = "".obs;

  RxBool loading = false.obs;

  RxBool loadingDetails = false.obs;
  RxBool showDetails = false.obs;

  Rx<bool> get isEmptyList => _tempOpenPlaceOrders.isEmpty.obs;
  int get currentItemsLength => _tempOpenPlaceOrders.length;

  // swap true/false & save it to observable
  void toggle() {
    showDetails.value = !showDetails.value;
    update();
  }

  Future<void> getOpenPlaceOrderDetails(
      String ponumber, BuildContext context) async {
    // showDetails(true);
    loadingDetails(true);
    detailsErrorMessage("");
    update();
    try {
      _sendingMsgProgressBar.show(context);
      // * Getting order id from getOpenOrderId API - 203
      openPlaceOrderId =
          await MemberCallsService.init().getOpenOrderId("203", ponumber);
      currentPoNumber = openPlaceOrderId.orderId;
      // * Getting order details from from getOpenOrderDetails API - 204
      final List<OpenPlaceOrderDetails> detailsResponse =
          await MemberCallsService.init()
              .getOpenOrderDetails("204", openPlaceOrderId.orderId);
      openPlaceOrderDetails = detailsResponse.obs;
      _sendingMsgProgressBar.hide();
      Get.to(PurchaseOrderDetailsPage());
      // Navigator.pushNamed(context, '/poOrderDetailsPage');

      loadingDetails(false);
      detailsErrorMessage("");
      update();
    } catch (err) {
      loadingDetails(false);
      detailsErrorMessage(err.toString());
      _sendingMsgProgressBar.hide();
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  // Use this to retrieve all records
  InventoryRecords get fetchInventoryRecords {
    return _inventoryRecords.value;
  }

  Future<void> loadInventoryRecords() async {
    const String userId =
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c";
    try {
      _inventoryRecords =
          Rx(await ApiService.shared().getInventoryRecords(userId, "item"));
    } catch (err) {
      detailsErrorMessage(err.toString());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> getAllOpenPo() async {
    loading(true);
    try {
      final List<OpenPO> allOpenPO = await MemberCallsService.init()
          .getAllOpenPo("106", filterMethod.value, "2970466");
      _tempOpenPlaceOrders = allOpenPO.obs;
      allOpenPO.insert(
          0,
          OpenPO(
              orderDscid: "DSC ID",
              iconAttachment: "Attachment",
              orderDate: "Date",
              orderOpid: "P/O Number",
              orderStatus: "Status",
              orderTime: "Time",
              orderTotalPrice: "Totol Price",
              orderTotalPv: "Total PV"));
      allOpenPlaceOrders(allOpenPO);
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  void onSortCulumn(OpenPoTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case OpenPoTypes.poNumber:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderDscid.compareTo(b.orderDscid));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderDscid.compareTo(b.orderDscid));
        }
        break;
      case OpenPoTypes.date:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderDate.compareTo(b.orderDate));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderDate.compareTo(b.orderDate));
        }
        break;
      case OpenPoTypes.time:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderTime.compareTo(b.orderTime));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderTime.compareTo(b.orderTime));
        }
        break;
      case OpenPoTypes.totalPv:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderTotalPv.compareTo(b.orderTotalPv));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderTotalPv.compareTo(b.orderTotalPv));
        }
        break;
      case OpenPoTypes.totalPrice:
        if (isAscending) {
          _tempOpenPlaceOrders
              .sort((a, b) => a.orderTotalPrice.compareTo(b.orderTotalPrice));
        } else {
          _tempOpenPlaceOrders
              .sort((b, a) => a.orderTotalPrice.compareTo(b.orderTotalPrice));
        }
        break;
      default:
    }
    update();
  }

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "6",
          child: ListTile(
            shape: kRoundedBorder(),
            onTap: () {
              filterMethod = "6".obs;
              update();
              Navigator.pop(context);
              getAllOpenPo();
            },
            selected: filterMethod.value == "6",
            selectedTileColor: kMainColor,
            title: const Text("6 Months"),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "12",
          child: ListTile(
            shape: kRoundedBorder(),
            selected: filterMethod.value == "12",
            onTap: () {
              filterMethod = "12".obs;
              update();
              Navigator.pop(context);
              getAllOpenPo();
            },
            selectedTileColor: kMainColor,
            title: const Text("All"),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderId}) async {
    final String imgUrl = "${Address.poOrder}?order_id=$orderId";
    _sendingMsgProgressBar.show(context);
    final Dio dio = Dio();
    final response = await dio.get(imgUrl);
    // * removing background from html document
    final removedBackground =
        response.toString().replaceAll('background: rgb(204,204,204);', '');
    _sendingMsgProgressBar.hide();
    await Printing.layoutPdf(
        dynamicLayout: false,
        onLayout: (PdfPageFormat format) async => Printing.convertHtml(
              format: format,
              html: removedBackground,
            ));
  }

  Future<void> validateOrder(BuildContext context) async {
    final ProgressBar _sendingMsgProgressBar = ProgressBar();
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
      loading(false);
      errorMessage(err.toString());
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

  Future<void> placeOrder(String orderId) async {
//     type: 201
// comment: TEST ORDER 2
// token: cyzr29ke2go0at89ygorpdd
// cus_id: 1
// cus_dscid: 0001
// poid: BKM 2021-07-W002
// totalpv: 20
// totalprice: 7,900
// cusname: Thailand TEST DSC
// data: @17532|1@17616|1
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
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  Future<void> onAddOrderTap() async {
    Get.to(OpenPoTable());
  }
}
