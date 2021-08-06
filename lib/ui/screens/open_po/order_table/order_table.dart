import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../../../global/widgets/cart_footer.dart';
import '../../../global/widgets/transparent_app_bar.dart';
import '../controller/open_po_table_controller.dart';
import 'components/open_po_table_body.dart';

class OpenPoTable extends StatelessWidget {
  static const String routeName = '/openPoTable';
  final OpenPoTableController controller = Get.put(OpenPoTableController());

  @override
  Widget build(BuildContext context) {
    // wait till widget build
    Timer(const Duration(milliseconds: 100), () {
      controller.loadInventoryRecords(context);
    });
    return Scaffold(
        backgroundColor: kPageBackground,
        appBar: TransAppBar(
          title: controller.passedUser.fullName,
          subTitle: controller.passedUser.userId,
        ),
        body: OpenPoTableBody(controller: controller),
        bottomNavigationBar: BottomAppBar(
            color: kPageBackground,
            child: Obx(() => CartFooter(
                  onPressed: () => controller.validateOrder(context),
                  totalCartPrice: controller.totalCartPrice.value,
                  totalCartPv: controller.totalCartPv.value,
                ))));
  }
}
