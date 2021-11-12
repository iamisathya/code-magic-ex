import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_summary/controller/enrollment.summary.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_validator/textfield_ccnumber.dart';
import 'card_validator/textfield_cvv.dart';
import 'card_validator/textfield_expirydate.dart';
import 'card_validator/textfield_username.dart';
import 'form_text_field.dart';

class CreditCardDetails extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  CreditCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CardNumberTextField(
          controller: controller.cardNumberController,
          isLoading: controller.isLoading.value,
          label: 'Card Number',
          textInputAction: TextInputAction.next),
      EnrollTextField(
          controller: controller.cardHolderNameController,
          isLoading: controller.isLoading.value,
          label: 'Card Holder Name',
          textInputAction: TextInputAction.next),
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: ExpireDateTextField(
                  controller: controller.expireDayController,
                  isLoading: controller.isLoading.value,
                  label: 'Expiration Date',
                  textInputAction: TextInputAction.next),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CVVFormTextField(
                controller: controller.cvvController,
                isLoading: controller.isLoading.value,
                label: 'CVV',
                textInputAction: TextInputAction.done),
          ),
        ],
      ),
    ]);
  }
}
