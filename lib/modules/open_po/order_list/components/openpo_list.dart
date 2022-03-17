import 'package:dsc_tools/modules/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../controller/openpo.list.controller.dart';
import 'po_item.dart';

class OpenPoList extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  OpenPoList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OpenPoListController controller;

  @override
  Widget build(BuildContext context) {
    const double _crossAxisSpacing = 8;
    const double _mainAxisSpacing = 0;
    final double _aspectRatio = _homeController.isMobileLayout ? 6 : 2.2;
    final int _crossAxisCount = _homeController.isMobileLayout ? 1 : 2;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          color: AppColor.kWhiteSmokeColor,
          child: Obx(
            () => controller.tempOpenPlaceOrders.isEmpty
                ? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: const Text("Sorry no orders found"))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                      crossAxisSpacing: _crossAxisSpacing,
                      childAspectRatio: _aspectRatio,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.tempOpenPlaceOrders.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return POItem(
                          openPo: controller.tempOpenPlaceOrders[index],
                          controller: controller);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
