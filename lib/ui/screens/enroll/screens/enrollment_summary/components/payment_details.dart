import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../controller/enrollment.summary.controller.dart';
import 'cash_on_delivery_details.dart';
import 'credit_card_details.dart';
import 'payment_option_bankwire.dart';
import 'payment_option_prompt.dart';

class PaymentDetails extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  PaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() => currentPaymentWidget()));
  }

  Widget currentPaymentWidget() {
    switch (controller.currentPaymentType) {
      case PaymentOptions.creditCard:
        return CreditCardDetails();
      case PaymentOptions.cashOnDelivery:
        return const CashOnDeliveryDetails(
            message:
                "Pay in cash using the exact change once your items are delivered!",
            image: kCashOnDeliveryImage);
      case PaymentOptions.cashCounterPay:
        return const CashOnDeliveryDetails(
            message: "Pay in cash to the staff when you receive the Products",
            image: kSalesCashCounterImage);
      case PaymentOptions.ecPay:
        return const CashOnDeliveryDetails(
            message: "The page will redirect you to ECPay", image: kECPayImage);
      case PaymentOptions.promptPay:
        return const PromptPaymentOption();
      case PaymentOptions.bankWire:
        return const BankWirePaymentOption();
      default:
        return const SizedBox();
    }
  }
}
