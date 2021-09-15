import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../../inventory/component/search_inventory.dart';
import '../controller/salesreports.home.controller.dart';
import 'search_open_po.dart';

class SalesReportToolBar extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

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
                  children: controller.sortOptions
                      .map((element) => GestureDetector(
                          onTap: () =>
                              controller.onChangeViewType(element.value),
                          child: Text(element.name,
                              style: controller.activeStockType.value.name ==
                                      element.name
                                  ? Theme.of(context).textTheme.subtitle1
                                  : Theme.of(context).textTheme.bodyText2)))
                      .toList()))),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () => Get.to(() => SearchSalesReport()),
                      child: SvgPicture.asset(kSearchIcon,
                          width: 20, semanticsLabel: 'search icon'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
