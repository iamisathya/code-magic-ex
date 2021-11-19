import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/cart_products.dart';
import '../../../../../../utilities/enums.dart';
import '../../../controllers/orderentry.product.list.controller.dart';
import '../../../controllers/orderentry.summary.controller.dart';
import 'checkout_item.dart';
import 'filter_tabs.dart';
import 'healine.dart';
import 'payment_item.dart';
import 'total_amount_box.dart';
import 'user_info_box.dart';

class Body extends StatelessWidget {
  final OrderEntryCheckoutSummaryController controller =
      Get.put(OrderEntryCheckoutSummaryController());

  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Headline(title: "Order Entry Summary"),
            UserInfoBox(),
            FilterTabs(),
            Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 20, bottom: 20),
                itemCount: controller.filterMethod.value == "myCart"
                    ? listController.cartProducts.length
                    : PaymentTypes.values.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  if (controller.filterMethod.value == "myCart") {
                    final CartProductsItem item =
                        listController.cartProducts[index];
                    return CheckoutItem(item: item);
                  } else {
                    return PaymentItem(controller: controller, index: index);
                  }
                },
              ),
            ),
          ],
        ),
        TotalAmountBox(),
      ],
    );
  }
}
