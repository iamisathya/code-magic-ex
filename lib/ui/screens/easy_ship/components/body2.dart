import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/barcode/components/search_textfield.dart';
import 'package:dsc_tools/ui/screens/easy_ship/controller/easyshiphome.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'easyship.item.dart';

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
                bgColor: const Color(0xFFFFBF3A),
                onSubmit: () => controller.onSearchEasyShipReport(),
                onScan: () => controller.onSearchEasyShipReport(),
                textFieldController: controller.baNumberTextField),
            ListView.builder(
              padding: const EdgeInsets.all(10.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.allEasyShipOrders.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return EasyShipItem(
                    item: controller.allEasyShipOrders[index], index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageToolBox extends StatelessWidget {
  const PageToolBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EasyShipHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      color: const Color(0xFFFFBF3A),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
              text: "BA Number: ${controller.baNumberTextField.text}",
              style: TextTypes.subtitle1),
          SvgPicture.asset(
            kScreenShotIcon,
            width: 20,
          )
        ],
      ),
    );
  }
}
