import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../../widgets/page_title.dart';
import '../../../enroll/screens/enrollment_details/components/error_message.dart';
import '../../terms_conditions/widgets/title_bar.dart';
import '../controller/update_email.controller.dart';
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
