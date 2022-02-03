import 'package:dsc_tools/ui/global/widgets/bottom_button_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/loader.dart';
import 'package:dsc_tools/ui/screens/profile/screens/update_email/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'controller/update_email.controller.dart';

class UpdateEmailScreen extends StatelessWidget {
  static const String routeName = "/updateEmailScreen";
  final UpdateEmailController controller = Get.put(UpdateEmailController());

  UpdateEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "cancel".tr,
            positiveText: "save".tr,
            onTapPositiveButton: controller.onClickSave,
          ),
        ),
      ),
    );
  }
}
