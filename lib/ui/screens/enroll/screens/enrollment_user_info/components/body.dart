import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/enroll_textfield.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/controller/enrollment.userinfo.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'user_info_card.dart';

class Body extends StatelessWidget {
  final EnrollmentUserInfoController controller =
      Get.put(EnrollmentUserInfoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.hideButtonController,
      child: SafeArea(
        child: Column(
          children: [
            const PageTitle(title: "Enrollment Details"),
            Container(
              color: const Color(0xFF76E5DE),
              padding: const EdgeInsets.all(20),
              height: 134,
              child: Row(
                children: [
                  UserInfoCard(
                      title: "Enroller ID",
                      id: controller.enrolerProfile.id.unicity.toString(),
                      name: controller.enrolerProfile.humanName.fullName,
                      nativeName:
                          controller.enrolerProfile.humanName.fullNameTh!),
                  const SizedBox(width: 10),
                  UserInfoCard(
                      title: "Sponsor ID",
                      id: controller.sponsorProfile.id.unicity.toString(),
                      name: controller.sponsorProfile.humanName.fullName,
                      nativeName:
                          controller.sponsorProfile.humanName.fullNameTh!),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: AppText(text: "Information", style: TextTypes.headline6),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'First Name (Thai)',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeLastNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Last Name (Thai)',
                      textInputAction: TextInputAction.next),
                  const SizedBox(height: 20),
                  EnrollTextField(
                      controller: controller.firstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'First Name',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.lastNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Last Name',
                      textInputAction: TextInputAction.next),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.showPicker(
                              context,
                              controller.selectedGenderIndex,
                              controller.genderOptions,
                              controller.genderController),
                          child: EnrollTextField(
                              controller: controller.genderController,
                              isLoading: controller.isLoading.value,
                              label: 'Gender',
                              icon: Icons.add,
                              showIcon: true,
                              enabled: false,
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.showPicker(
                              context,
                              controller.selectedMaritalStatusIndex,
                              controller.maritalStatusOptions,
                              controller.maritalStatusController),
                          child: EnrollTextField(
                              controller: controller.maritalStatusController,
                              isLoading: controller.isLoading.value,
                              label: 'Marital Status',
                              icon: Icons.add,
                              showIcon: true,
                              enabled: false,
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => controller.renderDatePicker(context),
                    child: EnrollTextField(
                        controller: controller.birthdayController,
                        isLoading: controller.isLoading.value,
                        label: 'Birth Day',
                        icon: Icons.add,
                        showIcon: true,
                        enabled: false,
                        textInputAction: TextInputAction.next),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                            text: "Contact Address",
                            style: TextTypes.headline6),
                        GestureDetector(
                            onTap: () =>
                                controller.openAddressSearchDialog(context),
                            child: SvgPicture.asset(kSearchV2Icon, width: 20))
                      ],
                    ),
                  ),
                  EnrollTextField(
                      controller: controller.zipCodeController,
                      isLoading: controller.isLoading.value,
                      label: 'Zip Code',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.provienceController,
                      isLoading: controller.isLoading.value,
                      label: 'Province',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.districtController,
                      isLoading: controller.isLoading.value,
                      label: 'District - Subdistrict',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.streetController,
                      isLoading: controller.isLoading.value,
                      label: 'Address - Street',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.mobileNumberController,
                      isLoading: controller.isLoading.value,
                      label: 'Mobile Number',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.emailController,
                      isLoading: controller.isLoading.value,
                      label: 'Email',
                      textInputAction: TextInputAction.next),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
