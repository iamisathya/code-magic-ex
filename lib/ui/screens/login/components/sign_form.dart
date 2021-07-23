import 'package:code_magic_ex/ui/global/widgets/primary_button.dart';
import 'package:code_magic_ex/ui/screens/login/controller/login_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:get/get.dart';

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
              ctlr: controller.userIdController,
              label: "User ID",
              hintText: "Enter your user id"),
          // buildUserIdFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          _renderTextField(
              ctlr: controller.passwordController,
              label: "Password",
              isPassword: true,
              hintText: "Enter your password"),
          // buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              Obx(() => Checkbox(
                  value: controller.remember.value,
                  activeColor: Colors.blueAccent,
                  onChanged: (value) => controller.remember.value = value!)),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => controller.openMailConfirmationDialog(context),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          PrimaryButton(
              text: "Continue",
              press: () => controller.onPressContinue(context)),
        ],
      ),
    );
  }

  Container _renderTextField(
      {TextEditingController? ctlr,
      bool enabled = true,
      String label = "",
      String hintText = "",
      bool isPassword = false,
      String helperText = ""}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _renderLabel(label),
          TextFormField(
              validator: (value) => controller.inputValidate(
                  value: value!, isPassword: isPassword),
              obscureText: isPassword,
              enabled: enabled,
              controller: ctlr,
              style: const TextStyle(fontSize: 18),
              cursorColor: kMainColor,
              decoration: kTextInputDecoration(
                  helperText: helperText, hintText: hintText))
        ],
      ),
    );
  }

  Padding _renderLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: SizedBox(
        width: Get.width,
        child: Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
