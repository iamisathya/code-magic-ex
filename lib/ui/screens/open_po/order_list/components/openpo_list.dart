
import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/screens/open_po/order_list/controller/openpo.list.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          color: AppColor.kWhiteSmokeColor,
          child: Obx(
            () => ListView.builder(
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
