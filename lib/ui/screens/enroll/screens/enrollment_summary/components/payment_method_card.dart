import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';
import '../controller/enrollment.summary.controller.dart';
import 'payment_details.dart';
import 'payment_option_item.dart';

class PaymentMethodCard extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  PaymentMethodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: AppText(text: "Payment Method", style: TextTypes.headline6), //! hardcoded
          ),
          Obx(
            () => Container(
              color: AppColor.gainsboro,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  PaymentOptionItem(
                      title: "Credit Card / Debit Card", //! hardcoded
                      icon: kCreditCardIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.creditCard,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.creditCard),
                  PaymentOptionItem(
                      title: "cash_on_delivery",
                      icon: kCashOnDeliveryIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.cashOnDelivery,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.cashOnDelivery),
                  PaymentOptionItem(
                      title: "cash",
                      icon: kCashPayIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.cashCounterPay,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.cashCounterPay),
                  PaymentOptionItem(
                      title: "ec_pay",
                      icon: kECPayIcon,
                      onPress: () =>
                          controller.currentPaymentType = PaymentOptions.ecPay,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.ecPay),
                  PaymentOptionItem(
                      title: "prompt_pay",
                      icon: kPromptPayIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.promptPay,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.promptPay),
                  PaymentOptionItem(
                      title: "bank_wire",
                      icon: kBankWireIcon,
                      onPress: () => controller.currentPaymentType =
                          PaymentOptions.bankWire,
                      isActive: controller.currentPaymentType ==
                          PaymentOptions.bankWire),
                ],
              ),
            ),
          ),
          PaymentDetails()
        ],
      ),
    );
  }
}
