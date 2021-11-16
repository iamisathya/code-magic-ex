import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_details/controller/enrollement.details.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                const SizedBox(
                  width: 118,
                  child: AppText(
                      text: "Enrollment Details", style: TextTypes.headline4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'Terms & ',
                      style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 14, color: const Color(0xFF606975)),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Conditions Apply',
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16,
                                color: const Color(0xFF1C9CFC),
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
                      label: "ID Card Number", //! Harcoded
                      textInputAction: TextInputAction.next,
                      isLoading: controller.isLoading.value,
                      fillColor: controller.isValidGovtId.value == 0
                          ? const Color(0xFFFFFFFF)
                          : controller.isValidGovtId.value == 1
                              ? const Color(0xFFF5F5F5)
                              : const Color(0xFFFFE7EB),
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
                        label: "Enroller ID", //! Harcoded
                        textInputAction: TextInputAction.next,
                        isLoading: controller.isLoading.value,
                        fillColor: controller.isValidEnrolerId.value == 0
                            ? const Color(0xFFFFFFFF)
                            : controller.isValidEnrolerId.value == 1
                                ? const Color(0xFFF5F5F5)
                                : const Color(0xFFFFE7EB),
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
                      label: "Sponsor ID", //! Harcoded
                      textInputAction: TextInputAction.done,
                      isLoading: controller.isLoading.value,
                      fillColor: controller.isValidSponsorId.value == 0
                          ? const Color(0xFFFFFFFF)
                          : controller.isValidSponsorId.value == 1
                              ? const Color(0xFFF5F5F5)
                              : const Color(0xFFFFE7EB),
                      icon: controller.isValidSponsorId.value == 1
                          ? const Icon(Icons.check, color: Colors.green)
                          : const Icon(Icons.arrow_right_alt_outlined),
                      onTap: () => controller.isValidSponsorId.value = 0,
                      enabled: controller.isValidSponsorId.value == 0 ||
                          controller.isValidSponsorId.value == 2,
                    )),
                    Obx(() => Text(controller.isValidEnrolerId.value.toString()))
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppText(
                  text: "Please Contact Unicity",
                  style: TextTypes.headline4,
                  color: Color(0xFF505050),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: AppText(
                    text:
                        "If you experience any problems with this application or if you have any questions.",
                    style: TextTypes.subtitle1,
                    color: Color(0xFF505050),
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
    this.fillColor = const Color(0xFFFFFFFF),
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
      decoration:
          BoxDecoration(border: Border.all(color: const Color(0xFF384250))),
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
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
