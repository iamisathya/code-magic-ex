import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../../barcode/components/search_textfield.dart';
import '../../inventory/component/page_title.dart';
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
            const PageTitle(title: "Easyship Report"),
            SearchTextfield(
                icon: kSearchIcon,
                isLoading: controller.isLoading.value,
                labelText: "BA Number",
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
