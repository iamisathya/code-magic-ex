import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../../inventory/component/page_title.dart';
import '../../enrollment_details/components/error_message.dart';
import '../controller/enrollment.userinfo.controller.dart';
import 'enroll_textfield.dart';
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
            PageTitle(title: "enrollment_details".tr),
            Container(
              color: AppColor.crayola,
              padding: const EdgeInsets.all(20),
              height: 134,
              child: Row(
                children: [
                  UserInfoCard(
                      title: "enroller".tr,
                      id: controller.enrolerProfile.id.unicity.toString(),
                      name: controller.enrolerProfile.humanName.fullName,
                      nativeName:
                          controller.enrolerProfile.humanName.fullNameTh!),
                  const SizedBox(width: 10),
                  UserInfoCard(
                      title: "sponsor".tr,
                      id: controller.sponsorProfile.id.unicity.toString(),
                      name: controller.sponsorProfile.humanName.fullName,
                      nativeName:
                          controller.sponsorProfile.humanName.fullNameTh!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child:
                  AppText(text: "information".tr, style: TextTypes.headline6),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: '${"first_name_th".tr} (Thai)',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeLastNameController,
                      isLoading: controller.isLoading.value,
                      label: '${"last_name_th".tr} (Thai)',
                      textInputAction: TextInputAction.next),
                  const SizedBox(height: 20),
                  EnrollTextField(
                      controller: controller.firstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'first_name_en'.tr,
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.lastNameController,
                      isLoading: controller.isLoading.value,
                      label: 'last_name_en'.tr,
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
                              isLoading: false,
                              label: 'gender'.tr,
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
                              isLoading: false,
                              label: 'Marital Status', //! hardcoded
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
                        isLoading: false,
                        label: 'birth_day'.tr,
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
                            text: "Contact Address", //! hardcoded
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
                      label: 'zip'.tr,
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.provienceController,
                      isLoading: controller.isLoading.value,
                      label: 'province'.tr,
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.districtController,
                      isLoading: controller.isLoading.value,
                      label: 'District - Subdistrict', //! hardcoded
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.streetController,
                      isLoading: controller.isLoading.value,
                      label: 'address'.tr,
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.mobileNumberController,
                      isLoading: controller.isLoading.value,
                      label: 'Mobile Number', //! hardcoded
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.emailController,
                      isLoading: controller.isLoading.value,
                      label: 'email'.tr,
                      textInputAction: TextInputAction.next),
                  if (controller.enrolmentErrorMessages.isNotEmpty)
                    ErrorMessage(errors: controller.enrolmentErrorMessages),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
