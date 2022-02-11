import 'package:dsc_tools/utils/constants.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Function(String) onPressed;
  final String label;
  final String value;
  final Color c;

  const CommonButton({
    required this.onPressed,
    required this.label,
    required this.c,
    required this.value,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: c, padding: kEdgeA12()),
      onPressed: () => onPressed(value),
      child: Text(label),
    );
  }
}
