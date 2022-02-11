import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/enrollment.summary.controller.dart';
import 'each_info_row.dart';

class ShippingAddressCard extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  ShippingAddressCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
        child: Column(
          children: [
            EeachUserinfoItem(
                title: "name".tr,
                value:
                    "${controller.enrolleeUserData.firstName} ${controller.enrolleeUserData.lastName}\n ${controller.enrolleeUserData.firstNameTh} ${controller.enrolleeUserData.lastNameTh}"),
            EeachUserinfoItem(
                title: "address".tr,
                value:
                    "${controller.enrolleeUserData.mainAddress1} \n ${controller.enrolleeUserData.mainAddress2} \n ${controller.enrolleeUserData.city} \n ${controller.enrolleeUserData.zipCode} "),
            EeachUserinfoItem(
                title: "mobile_number".tr,
                value: controller.enrolleeUserData.mobileNumber),
            EeachUserinfoItem(
                title: "email".tr, value: controller.enrolleeUserData.email),
          ],
        ),
      ),
    );
  }
}
