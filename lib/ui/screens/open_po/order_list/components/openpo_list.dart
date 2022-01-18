import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../controller/openpo.list.controller.dart';
import 'po_item.dart';

class OpenPoList extends StatelessWidget {
  const OpenPoList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OpenPoListController controller;

  @override
  Widget build(BuildContext context) {
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
                : ListView.builder(
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
