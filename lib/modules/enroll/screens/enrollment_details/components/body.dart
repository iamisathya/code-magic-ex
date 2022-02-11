import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../controller/enrollement.details.controller.dart';

class Body extends StatelessWidget {
  final EnrollmentDetailsHomeController controller =
      Get.put(EnrollmentDetailsHomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsetsDirectional.only(top: 60, start: 60, end: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 118,
                  child: AppText(
                      maxLines: 2,
                      text: "enrollment_details".tr,
                      style: TextTypes.headline4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RichText(
                    text: TextSpan(
                      text: '${"terms".tr} & ',
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 14, color: AppColor.cadet),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'conditions_apply'.tr,
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16,
                                color: AppColor.dodgerBlue,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => controller.navigateToTermsPage(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => EnrollTextField(
                      controller: controller.idNumberTextController,
                      label: "id_card".tr,
                      textInputAction: TextInputAction.next,
                      isLoading: controller.isLoading.value,
                      fillColor: controller.isValidGovtId.value == 0
                          ? AppColor.kWhiteColor
                          : controller.isValidGovtId.value == 1
                              ? AppColor.kWhiteSmokeColor
                              : AppColor.mistyRose,
                      icon: controller.isValidGovtId.value == 1
                          ? const Icon(Icons.check, color: Colors.green)
                          : const Icon(Icons.arrow_right_alt_outlined),
                      onTap: () => controller.isValidGovtId.value = 0,
                      enabled: controller.isValidGovtId.value == 0 ||
                          controller.isValidGovtId.value == 2,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Obx(() => EnrollTextField(
                        controller: controller.enrollerIdTextController,
                        label: "enroller".tr,
                        textInputAction: TextInputAction.next,
                        isLoading: controller.isLoading.value,
                        fillColor: controller.isValidEnrolerId.value == 0
                            ? AppColor.kWhiteColor
                            : controller.isValidEnrolerId.value == 1
                                ? AppColor.kWhiteSmokeColor
                                : AppColor.mistyRose,
                        icon: controller.isValidEnrolerId.value == 1
                            ? const Icon(Icons.check, color: Colors.green)
                            : const Icon(Icons.arrow_right_alt_outlined),
                        onTap: () => controller.isValidEnrolerId.value = 0,
                        enabled: controller.isValidEnrolerId.value == 0 ||
                            controller.isValidEnrolerId.value == 2,
                      )),
                ),
                Obx(() => EnrollTextField(
                      controller: controller.sponsorIdTextController,
                      label: "sponsor".tr,
                      textInputAction: TextInputAction.done,
                      isLoading: controller.isLoading.value,
                      fillColor: controller.isValidSponsorId.value == 0
                          ? AppColor.kWhiteColor
                          : controller.isValidSponsorId.value == 1
                              ? AppColor.kWhiteSmokeColor
                              : AppColor.mistyRose,
                      icon: controller.isValidSponsorId.value == 1
                          ? const Icon(Icons.check, color: Colors.green)
                          : const Icon(Icons.arrow_right_alt_outlined),
                      onTap: () => controller.isValidSponsorId.value = 0,
                      enabled: controller.isValidSponsorId.value == 0 ||
                          controller.isValidSponsorId.value == 2,
                    )),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "please_contact_unicity".tr,
                  style: TextTypes.headline4,
                  color: AppColor.darkLiver,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppText(
                    text: "contact_unicity_if_problem".tr,
                    style: TextTypes.subtitle1,
                    color: AppColor.darkLiver,
                    align: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class EnrollTextField extends StatelessWidget {
  const EnrollTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.textInputAction,
    required this.isLoading,
    this.enabled = true,
    this.fillColor = AppColor.kWhiteColor,
    this.onTap,
    this.icon = const Icon(Icons.arrow_right_alt_outlined),
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String label;
  final bool isLoading;
  final Icon icon;
  final bool enabled;
  final Color fillColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColor.charcoal)),
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          controller: controller,
          autofocus: true,
          enabled: enabled,
          textInputAction: textInputAction,
          decoration: InputDecoration(
              labelText: label,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
              fillColor: fillColor,
              filled: true,
              suffixIcon:
                  isLoading ? Image.asset(kAnimatedSpin, width: 20) : icon),
        ),
      ),
    );
  }
}
