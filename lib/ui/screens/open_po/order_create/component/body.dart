import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/controller/add.openpo.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/po_cart_item.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/total_price_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utilities/extensions.dart';
import 'browse_attachment.dart';
import 'user_information.dart';

class Body extends StatelessWidget {
  final CreateOpenPoOrderController controller =
      Get.put(CreateOpenPoOrderController());
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.height - 334),
              child: Column(
                children: [
                  const UserInformation(),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final CartProductsItem item =
                            controller.cartProducts[index];
                        return PoCartItem(item: item, idx: index);
                      })),
                ],
              ),
            ),
            Column(
              children: [
                Obx(() => TotalPrice(
                      totalPrice: controller.totalCartPrice.numberFormat(),
                      totalPv: controller.totalCartPv.numberFormat(),
                      bgColor: AppColor.kWhiteSmokeColor,
                    )),
                BrosweAttachment(controller: controller)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
