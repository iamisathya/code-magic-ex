import 'package:code_magic_ex/ui/global/widgets/cart_footer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/open_po/controller/open_po_table_controller.dart';
import 'package:code_magic_ex/ui/screens/open_po/order_table/components/open_po_table_body.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenPoTable extends StatelessWidget {
  static const String routeName = '/orderEntryTablePage';
  final OpenPoTableController controller =
      Get.put(OpenPoTableController());
  @override
  Widget build(BuildContext context) {
    controller.loadInventoryRecords(context);
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
