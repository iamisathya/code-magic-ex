import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/models/open_order_id.dart';
import 'package:dsc_tools/models/open_po_details.dart';
import 'package:dsc_tools/ui/screens/open_po/order_details/orderdetails.screen.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:get/get.dart';

class OpenPoController extends GetxController {
  String currentPoNumber = "";

  OpenPlaceOrderId openPlaceOrderId = OpenPlaceOrderId();
  RxList<OpenPlaceOrderDetails> openPlaceOrderDetails =
      List<OpenPlaceOrderDetails>.filled(0, OpenPlaceOrderDetails()).obs;

  Future<void> getOpenPlaceOrderDetails(String ponumber) async {
    try {
      // * Getting order id from getOpenOrderId API - 203
      openPlaceOrderId =
          await MemberCallsService.init().getOpenOrderId("203", ponumber);
      currentPoNumber = openPlaceOrderId.orderId;
      // * Getting order details from from getOpenOrderDetails API - 204
      final List<OpenPlaceOrderDetails> detailsResponse =
          await MemberCallsService.init()
              .getOpenOrderDetails("204", openPlaceOrderId.orderId);
      openPlaceOrderDetails = detailsResponse.obs;
      Get.to(PurchaseOrderDetailsPage());
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }
}
