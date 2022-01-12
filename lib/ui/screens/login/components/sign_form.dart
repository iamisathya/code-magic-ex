import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/size_config.dart';
import '../../../global/widgets/plain_button.dart';
import '../controller/login.controller.dart';

class SignForm extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    if (!kReleaseMode) {
      controller.userIdController.text = "2970466";
      controller.passwordController.text = "1234";
    }
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _renderTextField(
              ctlr: controller.userIdController, label: "user_id".tr),
          // buildUserIdFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          _renderTextField(
              ctlr: controller.passwordController,
              label: "password".tr,
              isPassword: true),
          // buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => controller.openMailConfirmationDialog(context),
                child: Text(
                  "forgot_password".tr,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )),
          SizedBox(height: getProportionateScreenHeight(20)),
          PlainButton(
              title: 'login'.tr,
              onTap: () => controller.onPressContinue(context)),
        ],
      ),
    );
  }

  Container _renderTextField(
      {TextEditingController? ctlr,
      bool enabled = true,
      String label = "",
      String hintText = "",
      bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          TextFormField(
            validator: (value) =>
                controller.inputValidate(value: value!, isPassword: isPassword),
            obscureText: isPassword,
            enabled: enabled,
            controller: ctlr,
            decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0)),
          )
        ],
      ),
    );
  }
}
