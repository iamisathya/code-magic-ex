import 'dart:async';

import 'package:code_magic_ex/ui/global/widgets/cart_footer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/order_entry_table/components/order_entry_body.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryTable extends StatelessWidget {
  static const String routeName = '/orderEntryTablePage';
  final OrderEntryTableController controller =
      Get.put(OrderEntryTableController());
  @override
  Widget build(BuildContext context) {
     Timer(const Duration(milliseconds: 100), () {
      controller.loadInventoryRecords(context);
    });
    return Scaffold(
        backgroundColor: kPageBackground,
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
