

import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalAmountBox extends StatelessWidget {
  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());
  TotalAmountBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: 120,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(text: "Total PV:", style: TextTypes.bodyText2),
                Obx(() => AppText(text: "${listController.totalCartPv} PV:", style: TextTypes.bodyText2))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(text: "Total Price:", style: TextTypes.bodyText2),
                Obx(() => AppText(text: "${listController.totalCartPrice} THB", style: TextTypes.bodyText2))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Color(0xFF9999A4)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(text: "Payment Amount", style: TextTypes.subtitle1),
              Obx(() => AppText(text: "${listController.totalCartPrice} THB", style: TextTypes.subtitle1))
            ],
          ),
        ],
      ),
    );
  }
}
