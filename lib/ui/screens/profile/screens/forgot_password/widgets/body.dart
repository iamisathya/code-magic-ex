import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../../../global/widgets/page_title.dart';
import '../../../../enroll/screens/enrollment_details/components/error_message.dart';
import '../../terms_conditions/widgets/title_bar.dart';
import '../controller/forgot_password.controller.dart';
import 'text_input_field.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(title: "forgot_password".tr),
          TitleBar(
              title: 'change_password'.tr, icon: kProfileUserEditPencilIcon),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SvgPicture.asset(kProfileNewPasswordImage),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child:
                AppText(text: "forgot_password".tr, style: TextTypes.headline4),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            color: AppColor.brightGrayThird,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: "get_a_code_via_login".tr,
                      style: TextTypes.headline6),
                  const SizedBox(height: 20),
                  ProfileTextField(
                      controller: controller.userIdCtrl,
                      labelText: "user_id".tr),
                  const SizedBox(height: 30),
                  ProfileTextField(
                      controller: controller.emailAddressCodeCtrl,
                      labelText: "send_code_via_email".tr),
                  const SizedBox(height: 20),
                  Container(
                      key: controller.widgetKey,
                      child: controller.errorMessages.isNotEmpty
                          ? ErrorMessage(
                              errors: [controller.errorMessages.value])
                          : null)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
