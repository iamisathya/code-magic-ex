import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/raised_gradient_button.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_details/components/error_message.dart';
import 'package:dsc_tools/ui/screens/login/widgets/login_text_field.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/login.controller.dart';

class Body extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          SvgPicture.asset(kUnicityLogoGradientImage, height: 25),
          const SizedBox(height: 60),
          SvgPicture.asset(kLoginScreenImage),
          const SizedBox(height: 60),
          AppText(text: "make_life_better".tr, style: TextTypes.headline4),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: _controller.onClickForgotPassword,
            child: AppText(
                text: "forgot_password".tr,
                style: TextTypes.bodyText1,
                color: AppColor.dodgerBlue),
          ),
          // SizedBox(height: SizeConfig.screenHeight * 0.04),
          const SizedBox(height: 40),
          Container(
            color: AppColor.ateneoBlue,
            padding: const EdgeInsets.all(40),
            width: double.infinity,
            child: Form(
              key: _controller.formKey,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginTextField(
                        controller: _controller.userIdController,
                        textInputAction: TextInputAction.next,
                        hintText: "Username"),
                    const SizedBox(height: 20),
                    LoginTextField(
                        controller: _controller.passwordController,
                        secureText: true,
                        textInputAction: TextInputAction.go,
                        hintText: "Password"),
                        const SizedBox(height: 20),
                    RaisedGradientButton(
                      gradient: const LinearGradient(
                        colors: <Color>[Color(0xFF1C9CFC), Color(0xFF4CDFFF)],
                      ),
                      onPressed: () => _controller.onPressContinue(context),
                      label: 'login_to_dsc',
                    ),
                    const SizedBox(height: 10),
                    if (_controller.errorMessages.isNotEmpty)
                      ErrorMessage(errors: [_controller.errorMessages.value]),
                  ],
                ),
              ),
            ),
          ),
          Obx(() => _controller.isSessionExpired.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: AppText(
                      text: "session_expired_login_again".tr,
                      align: TextAlign.center,
                      style: TextTypes.subtitle1,
                      color: Colors.red),
                )
              : const SizedBox()),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppText(
                text: "copyright_message".tr,
                style: TextTypes.bodyText1,
                color: AppColor.manatee),
          ),
        ],
      ),
    );
  }
}
