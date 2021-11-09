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
      margin: const EdgeInsetsDirectional.all(60),
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
                EnrollTextField(
                    controller: controller.idNumberTextController,
                    label: "ID Card Number",
                    textInputAction: TextInputAction.next,
                    isLoading: controller.isLoading.value), //! Harcoded
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: EnrollTextField(
                      controller: controller.enrollerIdTextController,
                      label: "Enroller ID",
                      textInputAction: TextInputAction.next,
                      isLoading: controller.isLoading.value), //! Harcoded
                ),
                EnrollTextField(
                    controller: controller.sponsorIdTextController,
                    label: "Sponsor ID",
                    textInputAction: TextInputAction.go,
                    isLoading: controller.isLoading.value), //! Harcoded
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: const Color(0xFF384250))),
      child: TextField(
        controller: controller,
        autofocus: true,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: isLoading
                ? Image.asset(kAnimatedSpin, width: 20)
                : const Icon(Icons.arrow_right_alt_outlined)),
      ),
    );
  }
}
