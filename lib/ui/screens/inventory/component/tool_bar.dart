import 'package:dsc_tools/ui/screens/inventory/component/search_inventory.dart';
import 'package:dsc_tools/ui/screens/inventory/controller/inventory.home.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InventoryToolBar extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE3E8ED),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Flexible(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.stockOptions
                      .map((element) => GestureDetector(
                          onTap: () =>
                              controller.onChangeStockType(element.value),
                          child: Text(element.name,
                              style: controller.activeStockType.value.name ==
                                      element.name
                                  ? Theme.of(context).textTheme.subtitle1
                                  : Theme.of(context).textTheme.bodyText2)))
                      .toList()))),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(kPrintIcon,
                      width: 20, semanticsLabel: 'print icon'),
                  SvgPicture.asset(kDownloadIcon,
                      width: 20, semanticsLabel: 'download icon'),
                  GestureDetector(
                    onTap: () => Get.to(() => SearchProducts()),
                    child: SvgPicture.asset(kSearchIcon,
                        width: 20, semanticsLabel: 'search icon'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
