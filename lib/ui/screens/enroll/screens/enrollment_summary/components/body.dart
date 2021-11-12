import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enroll/components/enroll_cart_item.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_summary/controller/enrollment.summary.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'enroller_info_card.dart';
import 'payment_method_card.dart';
import 'shipping_address_card.dart';
import 'total_amount_card.dart';

class Body extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldFont = Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF000000));
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const PageTitle(title: "Enrollment Summary"),
            Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.cartProducts.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final CartProductsItem item = controller.cartProducts[index];
                  return EnrollCartItem(item: item, idx: index);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFF6F9FD),
              child: Column(
                children: [
                  const ShippingAddressCard(),
                  const SizedBox(height: 20),
                  const EnrollerInfoCard(),
                  const SizedBox(height: 20),
                  TotalAmountCard(boldFont: boldFont),
                  const SizedBox(height: 20),
                  PaymentMethodCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}