import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';

Container renderTextField(
    {TextEditingController? ctlr,
    bool enabled = true,
    String label = "",
    String helperText = "",
    String hintText = "",
    int maxLines = 1,
    int minLines = 2}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Column(
      children: [
        _renderLabel(label),
        TextField(
            enabled: enabled,
            controller: ctlr,
            maxLines: maxLines,
            minLines: minLines,
            style: const TextStyle(fontSize: 16),
            decoration: enabled == false
                ? kDisabledTextInputDecoration(helperText: helperText)
                : kActiveTextInputDecoration(helperText: helperText))
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
