import 'package:dsc_tools/ui/screens/open_po/order_list/controller/openpo.list.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/enums.dart';
import '../../../global/theme/text_view.dart';
import '../../../global/widgets/bottom_button_bar.dart';
import '../order_create/component/loader.dart';
import 'components/body2.dart';
import 'controller/openpo.details.controller.dart';

class OpenPoOrderDetails extends StatelessWidget {
  final OpenPoDetailsController controller = Get.put(OpenPoDetailsController());
  static const String routeName = '/openPoOrderDetailsHomePage';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: AppColor.kWhiteSmokeColor,
          appBar: AppBar(
              title: Obx(() => AppText(
                  text: controller.passedOrderNumber.value,
                  style: TextTypes.headline6))),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "back".tr,
            positiveText: "print_po_list".tr,
            onTapPositiveButton: () {
              controller.proceedToPrint(context,
                  orderId: controller.openPlaceOrderId.orderId);
            },
          ),
        ),
      ),
    );
  }
}
