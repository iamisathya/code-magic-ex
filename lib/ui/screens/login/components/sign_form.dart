import 'package:dsc_tools/ui/global/widgets/plain_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/size_config.dart';
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
              ctlr: controller.userIdController,
              label: "User ID",
              hintText: "Enter your user id"),
          // buildUserIdFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
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
          PlainButton(
              title: 'Login',
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0)
            ),
          )
        ],
      ),
    );
  }
}
