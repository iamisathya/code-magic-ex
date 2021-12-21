import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../utilities/extensions.dart';
import '../controller/add.openpo.controller.dart';
import 'browse_attachment.dart';
import 'po_cart_item.dart';
import 'total_price_container.dart';
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
