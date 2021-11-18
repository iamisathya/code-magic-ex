import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/screens/enroll/controllers/enroll.controller.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enroll/components/enroll_cart_item.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_summary/controller/enrollment.summary.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'enrol_summary_cartt_item.dart';
import 'enroller_info_card.dart';
import 'payment_method_card.dart';
import 'shipping_address_card.dart';
import 'total_amount_card.dart';

class Body extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());

  final EnrollHomeController enrollHomeController =
      Get.put(EnrollHomeController());

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldFont = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF000000));
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const PageTitle(title: "Enrollment Summary"),
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFF6F9FD),
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: enrollHomeController.cartProducts.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final CartProductsItem item =
                            enrollHomeController.cartProducts[index];
                        return EnrollSummaryCartItem(item: item, idx: index);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ShippingAddressCard(),
                  const SizedBox(height: 20),
                  EnrollerInfoCard(),
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
