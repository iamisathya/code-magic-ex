import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/widgets/bottom_button_bar.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import 'widgets/body.dart';

class TermsConditionsScreen extends StatelessWidget {
  static const String routeName = "/termsConditionsScreen";
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
