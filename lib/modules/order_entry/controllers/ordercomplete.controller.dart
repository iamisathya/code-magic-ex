import 'package:dsc_tools/data/model/place_order.dart'
    hide
        Customer,
        ShipToAddress,
        ShippingMethod,
        ShipToName,
        ProductLines,
        ProductTerms,
        Transactions;
import 'package:dsc_tools/modules/home/home.dart';
import 'package:dsc_tools/utils/function.dart';
import 'package:dsc_tools/utils/user_session.dart';
import 'package:get/get.dart';

import '../../../core/values/endpoints.dart';

class OrderCompleteController extends GetxController {
  late PlaceOrder orderResponse;

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      orderResponse = data as PlaceOrder;
    }
  }

  void gotoHome() {
    Get.off(() => MainHomeScreen());
  }

  void openBarCode() {
    launchURL(
        "${Endpoints.baseDscTh}/barcode/?href=31512d2a1d4a2a5860bc785d27d1f752ef2a0cd919b417e7899c79ae4fc690d6&token=${UserSessionManager.shared.customerToken.token}&user=${UserSessionManager.shared.userInfo!.id.unicity}");
  }

  void viewOrder() {
    launchURL(
        "${Endpoints.orderedItems}/31512d2a1d4a2a5860bc785d27d1f752ef2a0cd919b417e7899c79ae4fc690d6&token=${UserSessionManager.shared.customerToken.token}&number=423160354");
  }

  void openProductList() {
    launchURL("${Endpoints.printOrderItems}?number=423160354");
  }
}
