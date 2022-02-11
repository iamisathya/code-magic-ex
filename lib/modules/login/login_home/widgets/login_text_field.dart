import 'package:flutter/material.dart';

import '../../../../core/values/colors.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.controller,
    required this.textInputAction,
    this.enabled = true,
    this.secureText = false,
    this.hintText = '',
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final bool enabled;
  final String hintText;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
          color: AppColor.kWhiteColor, borderRadius: BorderRadius.circular(3)),
      child: TextField(
        controller: controller,
        autofocus: true,
        textInputAction: textInputAction,
        enabled: enabled,
        obscureText: secureText,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: AppColor.kWhiteColor,
          filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
