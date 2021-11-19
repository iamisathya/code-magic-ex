import '../../enrollment_user_info/controller/enrollment.userinfo.controller.dart';
import '../../../../../../utilities/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'each_info_row.dart';

class EnrollerInfoCard extends StatelessWidget {
  final EnrollmentUserInfoController ctrl = Get.put(EnrollmentUserInfoController());
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
                title: "Enroller",
                value: "${ctrl.enrolerProfile.id.unicity.toString()} ${ctrl.enrolerProfile.humanName.fullName}, ${ctrl.enrolerProfile.humanName.fullNameTh}"),
            EeachUserinfoItem(
                title: "Sponsor",
                value: "${ctrl.sponsorProfile.id.unicity.toString()} ${ctrl.sponsorProfile.humanName.fullName}, ${ctrl.sponsorProfile.humanName.fullNameTh}"),
            EeachUserinfoItem(title: "PV Month", value: getCurrentPeriod()),
            EeachUserinfoItem(title: "Government ID", value: ctrl.govtId.value),
            EeachUserinfoItem(title: "Gender", value: ctrl.genderController.text),
            EeachUserinfoItem(title: "Marital Status", value: ctrl.maritalStatusController.text),
            EeachUserinfoItem(title: "Birthday", value: ctrl.birthdayController.text),
          ],
        ),
      ),
    );
  }
}
