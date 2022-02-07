import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:photo_view/photo_view.dart';
import 'package:printing/printing.dart';

import '../../../../../api/api_address.dart';
import '../../../../../api/config/api_service.dart';
import '../../../../../models/inventory_item_v2.dart' hide Dialog;
import '../../../../../models/open_order_id.dart';
import '../../../../../models/open_po_details.dart';
import '../../../../../utilities/logger.dart';
import '../../order_list/controller/openpo.list.controller.dart';

class OpenPoDetailsController extends GetxController {
  // final MemberCallsService api;

  // OpenPoDetailsController({required this.api});

  String currentPoNumber = "";
  RxString passedOrderNumber = "".obs;
  String poOrderAttachment = "";

  OpenPlaceOrderId openPlaceOrderId = OpenPlaceOrderId();
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails =
      List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;
  OpenPoListController poListController = Get.find();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      passedOrderNumber.value = data as String;
      getOpenPlaceOrderDetails(passedOrderNumber.value);
    }
    super.onInit();
  }

  Future<void> getOpenPlaceOrderDetails(String ponumber) async {
    isLoading.toggle();
    try {
      // * Getting order id from getOpenOrderId API - 203
      poOrderAttachment = await MemberCallsService.init()
          .getPoOrderAttachment("getAttachment", ponumber);
      openPlaceOrderId =
          await MemberCallsService.init().getOpenOrderId("203", ponumber);
      currentPoNumber = openPlaceOrderId.orderId;
      // * Getting order details from from getOpenOrderDetails api - 204
      final List<OpenPlaceOrderDetails> detailsResponse =
          await MemberCallsService.init()
              .getOpenOrderDetails("204", openPlaceOrderId.orderId);
      // Attching product images from hydra products
      for (var i = 0; i < detailsResponse.length; i++) {
        final OpenPlaceOrderDetails currentItem = detailsResponse[i];
        final InventoryItem? foundItem = poListController
            .inventoryRecordsV2.value.items!
            .firstWhereOrNull((hydraItem) =>
                currentItem.productId == hydraItem.item!.id!.unicity);
        if (foundItem != null) {
          currentItem.imageUrl = foundItem.itemInfo!.imageUrl;
        }
      }
      openPlaceOrderDetails = detailsResponse.obs;
      isLoading.toggle();
      // change(openPlaceOrderDetails, status: RxStatus.success());
    } catch (err) {
      isLoading.toggle();
      // change(null, status: RxStatus.error());
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> proceedToPrint(BuildContext context,
      {required String orderId}) async {
    isLoading.toggle();
    final String imgUrl = "${Address.poOrder}?order_id=$orderId";
    final Dio dio = Dio();
    final response = await dio.get(imgUrl);
    // * removing background from html document
    final removedBackground =
        response.toString().replaceAll('background: rgb(204,204,204);', '');
    isLoading.toggle();
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => Printing.convertHtml(
              format: format,
              html: removedBackground,
            ));
  }

  void openDialog(BuildContext context, String attchmentName) => showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          final String url = "${Address.resource}$attchmentName";
          return Dialog(
            child: PhotoView(
              tightMode: true,
              imageProvider: NetworkImage(url),
              heroAttributes: PhotoViewHeroAttributes(tag: url),
            ),
          );
        },
      );
}
