import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/barcode/components/search_textfield.dart';
import 'package:dsc_tools/ui/screens/easy_ship/controller/easyshiphome.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

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
            PageToolBox(controller: controller),
            SearchTextfield(
                icon: kSearchIcon,
                isLoading: controller.isLoading.value,
                labelText: "BA Number",
                bgColor: const Color(0xFFFFBF3A),
                onSubmit: () => controller.onSearchEasyShipReport(),
                onScan: () => controller.onSearchEasyShipReport(),
                textFieldController: controller.baNumberTextField),
            SingleChildScrollView(
              child: Screenshot(
                controller: controller.screenshotController,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(kEasyShipBgImage),
                    fit: BoxFit.cover,
                  )),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.orderedEasyShipOrders.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      final key =
                          controller.orderedEasyShipOrders.keys.toList()[index];
                      return EasyShipItem(
                          item: controller.orderedEasyShipOrders[key]!,
                          index: index,
                          date: key);
                    },
                  ),
                ),
              ),
            ),
            // if(controller.capturedImage.lengthInBytes != 1000000)
            // Image.memory(controller.capturedImage)
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
          GestureDetector(
            onTap: () => controller.onCaptureScreenShot(context),
            child: SvgPicture.asset(
              kScreenShotIcon,
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
