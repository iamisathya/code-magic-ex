import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/enrollment.summary.controller.dart';
import 'card_validator/textfield_ccnumber.dart';
import 'card_validator/textfield_cvv.dart';
import 'card_validator/textfield_expirydate.dart';
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
          label: 'card_number'.tr,
          textInputAction: TextInputAction.next),
      EnrollTextField(
          controller: controller.cardHolderNameController,
          isLoading: controller.isLoading.value,
          label: 'card_holder_name'.tr,
          textInputAction: TextInputAction.next),
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: ExpireDateTextField(
                  controller: controller.expireDayController,
                  isLoading: controller.isLoading.value,
                  label: 'expiration_date'.tr,
                  textInputAction: TextInputAction.next),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CVVFormTextField(
                controller: controller.cvvController,
                isLoading: controller.isLoading.value,
                label: 'cvv'.tr,
                textInputAction: TextInputAction.done),
          ),
        ],
      ),
    ]);
  }
}
