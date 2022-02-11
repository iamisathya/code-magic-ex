import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/function.dart';
import '../../enrollment_user_info/controller/enrollment.userinfo.controller.dart';
import 'each_info_row.dart';

class EnrollerInfoCard extends StatelessWidget {
  final EnrollmentUserInfoController ctrl =
      Get.put(EnrollmentUserInfoController());
  EnrollerInfoCard({
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
                title: "enroller".tr,
                value:
                    "${ctrl.enrolerProfile.id.unicity.toString()} ${ctrl.enrolerProfile.humanName.fullName}, ${ctrl.enrolerProfile.humanName.fullNameTh}"),
            EeachUserinfoItem(
                title: "sponsor".tr,
                value:
                    "${ctrl.sponsorProfile.id.unicity.toString()} ${ctrl.sponsorProfile.humanName.fullName}, ${ctrl.sponsorProfile.humanName.fullNameTh}"),
            EeachUserinfoItem(title: "pv_month".tr, value: getCurrentPeriod()),
            EeachUserinfoItem(
                title: "government_id".tr, value: ctrl.govtId.value),
            EeachUserinfoItem(
                title: "gender".tr, value: ctrl.genderController.text),
            EeachUserinfoItem(
                title: "marital_status".tr,
                value: ctrl.maritalStatusController.text),
            EeachUserinfoItem(
                title: "birthday".tr, value: ctrl.birthdayController.text),
          ],
        ),
      ),
    );
  }
}
