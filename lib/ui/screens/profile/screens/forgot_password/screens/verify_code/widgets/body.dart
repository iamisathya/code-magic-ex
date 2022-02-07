import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../constants/colors.dart';
import '../../../../../../../../utilities/enums.dart';
import '../../../../../../../../utilities/images.dart';
import '../../../../../../../global/theme/text_view.dart';
import '../../../../../../../global/widgets/page_title.dart';
import '../../../../../../enroll/screens/enrollment_details/components/error_message.dart';
import '../../../../terms_conditions/widgets/title_bar.dart';
import '../controller/verify_code.controller.dart';
import 'verification_text_field.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final VerifyCodeController controller = Get.put(VerifyCodeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(title: "forgot_password".tr),
          TitleBar(
              title: 'change_password'.tr, icon: kProfileUserEditPencilIcon),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: "we_sent_your_code_to:".tr,
                    style: TextTypes.headline4),
                const SizedBox(height: 15),
                AppText(
                    text: "Synn1559@gmail.com".tr, style: TextTypes.headline6),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: AppText(
                        text:
                            "Please check your email for a message with your code. Your code is 6 number long.:"
                                .tr,
                        style: TextTypes.subtitle1,
                        color: AppColor.darkLiver)),
                AppText(
                    text: "Didn't get a code?:".tr,
                    style: TextTypes.subtitle1,
                    color: AppColor.dodgerBlue),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            color: AppColor.brightGrayThird,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: "Enter the 6-digit code".tr,
                      style: TextTypes.subtitle1),
                  const SizedBox(height: 20),
                  VerifyTextField(controller: controller.verificationCodeCtrl),
                  const SizedBox(height: 20),
                  if (controller.errorMessages.isNotEmpty)
                    ErrorMessage(errors: [controller.errorMessages.value]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
