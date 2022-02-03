import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyTextField extends StatelessWidget {
  const VerifyTextField(
      {Key? key,
      required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kWhiteColor,
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        color: AppColor.kWhiteColor,
        height: 54,
        child: TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(letterSpacing: 6.0, fontSize: 24),
          controller: controller,
          inputFormatters: [LengthLimitingTextInputFormatter(6)],
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kWhiteColor, width: 0.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kWhiteColor, width: 0.0),
            ),
            hintText: '######',
          ),
        ),
      ),
    );
  }
}
