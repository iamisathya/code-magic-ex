import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_summary/controller/enrollment.summary.controller.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/enroll_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardDetails extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  CreditCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      EnrollTextField(
          controller: controller.cardNumberController,
          isLoading: controller.isLoading.value,
          label: 'Card Number',
          textInputAction: TextInputAction.next),
      EnrollTextField(
          controller: controller.cardNumberController,
          isLoading: controller.isLoading.value,
          label: 'Card Holder Name',
          textInputAction: TextInputAction.next),
      Row(
        children: [
          Expanded(
            child: EnrollTextField(
                controller: controller.cardNumberController,
                isLoading: controller.isLoading.value,
                label: 'Expiration Date',
                textInputAction: TextInputAction.next),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: EnrollTextField(
                controller: controller.cardNumberController,
                isLoading: controller.isLoading.value,
                label: 'CVV',
                textInputAction: TextInputAction.done),
          ),
        ],
      ),
    ]);
  }
}
