import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';
import '../../barcode/components/search_textfield.dart';
import '../controller/easyshiphome.controller.dart';

class Body extends StatelessWidget {
  final EasyShipHomeController controller = Get.put(EasyShipHomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PageTitle(title: "easyship_report".tr),
            SearchTextfield(
                icon: kSearchIcon,
                isLoading: controller.isLoading.value,
                labelText: "ba_number",
                bgColor: AppColor.sunglow,
                onSubmit: () => controller.onSearchEasyShipReport(),
                onScan: () => controller.onSearchEasyShipReport(),
                textFieldController: controller.baNumberTextField),
          ],
        ),
      ),
    );
  }
}
