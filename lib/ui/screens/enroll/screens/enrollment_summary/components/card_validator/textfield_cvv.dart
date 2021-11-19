import '../../../../../../global/widgets/payment_card.dart';
import '../../../../../../../utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CVVFormTextField extends StatelessWidget {
  const CVVFormTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.textInputAction,
    required this.isLoading,
    this.showIcon = false,
    this.enabled = true,
    this.onIconTap,
    this.icon = Icons.arrow_right_alt_outlined,
  }) : super(key: key);

  final VoidCallback? onIconTap;
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
      child: TextFormField(
        controller: controller,
        autofocus: true,
        textInputAction: textInputAction,
        enabled: enabled,
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
        ],
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        validator: CardUtils.validateCVV,
        keyboardType: TextInputType.number,
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
                    : GestureDetector(onTap: onIconTap, child: Icon(icon)))
                : null),
      ),
    );
  }
}
