import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../../constants/colors.dart';
import '../../../../../../../../utilities/enums.dart';
import '../../../../../../../../utilities/images.dart';
import '../../../../../../../global/theme/text_view.dart';
import '../../../../../../../global/widgets/page_title.dart';
import '../../../../../../enroll/screens/enrollment_details/components/error_message.dart';
import '../../../../terms_conditions/widgets/title_bar.dart';
import '../controller/change_password.controller.dart';
import 'text_input_field.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final ChangePasswordController controller =
      Get.put(ChangePasswordController());

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
              children: [
                SvgPicture.asset(kProfileNewPasswordImage),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 15),
                  child: AppText(
                      text: "create_new_password".tr,
                      style: TextTypes.headline4),
                ),
                AppText(
                    text:
                        "Create a new password that is at least 6 characterslong. A strong password is combination of letters,numbers, and punctuation marks."
                            .tr,
                    align: TextAlign.center,
                    style: TextTypes.subtitle2),
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
                      text: "enter_new_password".tr,
                      style: TextTypes.headline4),
                  const SizedBox(height: 20),
                  ProfileTextField(
                      controller: controller.newPasswordController,
                      labelText: "new_password".tr),
                  const SizedBox(height: 30),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SvgPicture.asset(kBarcodeCheckSuccessIcon,
                          color: AppColor.mediumAquamarine,
                          height: 20,
                          width: 20),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText(
                            text:
                                "Log me out of Unicity DSC Everywhere else my account might be open. (Choose this if a Stranger used your account.)"
                                    .tr,
                            maxLines: 10,
                            style: TextTypes.subtitle2),
                      ),
                    ),
                  ]),
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
