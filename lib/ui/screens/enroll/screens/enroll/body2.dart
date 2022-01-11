import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../models/cart_products.dart';
import '../../../../../utilities/extensions.dart';
import '../../controllers/enroll.controller.dart';
import 'components/enroll_cart_item.dart';
import 'components/total_price.dart';

class Body extends StatelessWidget {
  final EnrollHomeController controller = Get.put(EnrollHomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            PageTitle(title: "enrollment".tr),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.height - 365),
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final CartProductsItem item =
                            controller.cartProducts[index];
                        return Slidable(
                          actionPane: const SlidableDrawerActionPane(),
                          actionExtentRatio: 0.5,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'delete'.tr,
                              color: AppColor.ultraRed,
                              icon: Icons.delete,
                              foregroundColor: Colors.white,
                              onTap: () => controller.removeItem(item.itemCode),
                            ),
                          ],
                          child: EnrollCartItem(item: item, idx: index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => TotalPrice(
                totalPrice: controller.totalCartPrice.numberFormat(),
                totalPv: controller.totalCartPv.numberFormat(),
                bgColor: AppColor.kWhiteSmokeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
