import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/size_config.dart';
import '../controller/login.controller.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "welcome_message".tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "singin_message".tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Obx(() => controller.isSessionExpired.value
                    ? Text(
                        "session_expired_login_again".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox()),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
