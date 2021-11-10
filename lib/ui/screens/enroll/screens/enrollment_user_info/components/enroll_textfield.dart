import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';

class EnrollTextField extends StatelessWidget {
  const EnrollTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.textInputAction,
    required this.isLoading,
    this.showIcon = false,
    this.enabled = true,
    this.icon = Icons.arrow_right_alt_outlined,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String label;
  final bool isLoading;
  final bool showIcon;
  final bool enabled;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD0D0CF)),
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(3)),
      child: TextField(
        controller: controller,
        autofocus: true,
        textInputAction: textInputAction,
        enabled: enabled,
        decoration: InputDecoration(
            fillColor: const Color(0xFFFFFFFF),
            filled: true,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: showIcon
                ? (isLoading
                    ? Image.asset(kAnimatedSpin, width: 20)
                    : Icon(icon))
                : null),
      ),
    );
  }
}
