import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_details/components/error_message.dart';
import 'package:dsc_tools/ui/screens/profile/screens/terms_conditions/widgets/title_bar.dart';
import 'package:dsc_tools/ui/screens/profile/screens/update_email/controller/update_email.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'text_input_field.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final UpdateEmailController controller = Get.put(UpdateEmailController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(title: "account".tr),
          TitleBar(title: 'change_email'.tr, icon: kProfileUserEditPencilIcon),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SvgPicture.asset(kProfileNewEmailImage),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: AppText(
                text: "new_email_address".tr, style: TextTypes.headline4),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            color: AppColor.brightGrayThird,
            child: Obx(
              () => Column(
                children: [
                  ProfileTextField(
                      controller: controller.userIdController,
                      labelText: "user_id".tr,
                      enabled: false),
                  const SizedBox(height: 30),
                  ProfileTextField(
                      controller: controller.emailController,
                      labelText: "email".tr),
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
