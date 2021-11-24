import 'package:dsc_tools/ui/screens/open_po/order_list/home_screen.dart';
import 'package:get/get.dart';

import '../../../../../models/openpo_create_order_result.dart';
import '../../../../screens/open_po/home/home.screen.dart';
import '../../../home/home.dart';
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
    Get.off(() => OpenPoHomeScreen());
  }

  void gotoHome() {
    Get.offAll(() => MainHomeScreen());
  }
}
