import 'package:dsc_tools/modules/open_po/order_create/component/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bottom_button_bar.dart';
import 'widgets/body.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: const Body(),
      bottomNavigationBar: BottomButtonBar(
        showNeutral: false,
        onTapCancelButton: Get.back,
        negetiveText: "cancel".tr,
        positiveText: "ok_got_it".tr,
        onTapPositiveButton: Get.back,
      ),
    );
  }
}
