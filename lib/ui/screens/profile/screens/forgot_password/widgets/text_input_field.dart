import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.isObscure = false,
      this.showSuffix = false,
      this.onPressSuffixIcon,
      this.enabled = true})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool enabled;
  final bool isObscure;
  final bool showSuffix;
  final VoidCallback? onPressSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kWhiteColor,
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: AppColor.kWhiteColor,
        height: 54,
        child: TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            enabled: enabled,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: InputBorder.none,
            floatingLabelStyle: const TextStyle(color: AppColor.darkLiver),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kWhiteColor, width: 0.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kWhiteColor, width: 0.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kWhiteColor, width: 0.0),
            ),
            suffixIcon: showSuffix
                ? IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: onPressSuffixIcon)
                : null,
          ),
        ),
      ),
    );
  }
}
