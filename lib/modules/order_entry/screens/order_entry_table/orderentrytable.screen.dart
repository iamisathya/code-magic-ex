import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/cart_footer.dart';
import '../../../../widgets/transparent_app_bar.dart';
import '../../controllers/orderentry.controller.dart';
import 'components/order_entry_body.dart';

class OrderEntryTable extends StatelessWidget {
  final OrderEntryTableController controller =
      Get.put(OrderEntryTableController());
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 100), () {
      controller.loadInventoryRecords(context);
    });
    return Scaffold(
        appBar: TransAppBar(
          title: controller.passedUser.fullName,
          subTitle: controller.passedUser.userId,
        ),
        body: OrderEntryBody(),
        bottomNavigationBar: BottomAppBar(
            color: kPageBackground,
            child: Obx(() => CartFooter(
                  onPressed: () => controller.validateOrder(context),
                  totalCartPrice: controller.totalCartPrice.value,
                  totalCartPv: controller.totalCartPv.value,
                ))));
  }
}
