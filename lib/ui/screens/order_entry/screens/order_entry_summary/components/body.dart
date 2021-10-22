import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.summary.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkout_item.dart';
import 'filter_tabs.dart';
import 'healine.dart';
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
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      elevation: 0,
                      child: ListTile(
                          title: AppText(
                              text: controller.paymentTypes[index].name,
                              style: TextTypes.subtitle1),
                          leading: Radio(
                              value: controller.paymentTypes[index].value,
                              groupValue: controller.selectedPayment.value,
                              fillColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF6FCF97),
                              ),
                              onChanged: null)),
                    );
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
