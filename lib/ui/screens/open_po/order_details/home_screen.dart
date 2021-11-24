import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/bottom_button_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.details.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'components/body2.dart';

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
            bgColor: AppColor.brightGray,
            onTapCancelButton: Get.back,
            negetiveText: "back",
            positiveText: "Print PO List",
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
