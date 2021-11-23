import 'package:dsc_tools/models/openpo_create_order_result.dart';
import 'package:dsc_tools/ui/screens/home/home.dart';
import 'package:get/get.dart';

import '../../../../screens/open_po/home/home.screen.dart';
import '../../controller/openpo.list.controller.dart';

class OpenPoOrderResultController extends GetxController {
  final OpenPoListController homeCtrol = Get.put(OpenPoListController());

  late OpenPoCreateOrderResult result;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      result = data as OpenPoCreateOrderResult;
    } else {
      Get.back();
    }
    super.onInit();
  }

  void onPressedBack() {
    homeCtrol.getAllOpenPo();
    Get.off(() => OpenPOHomeScreen());
  }

  void gotoHome() {
    Get.offAll(() => MainHomeScreen());
  }
}
