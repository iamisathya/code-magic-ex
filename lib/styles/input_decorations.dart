import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utilities/size_config.dart';
import 'border.dart';

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

InputDecoration kTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(20.0),
    focusedBorder: kFocusedOutlineInputBorder(),
    border: kOutlineInputBorder(),
    hintText: hintText,
    helperText: helperText,
  );
}

InputDecoration kActiveTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(20.0),
    focusedBorder: kFocusedOutlineInputBorder(),
    enabledBorder: kFocusedOutlineInputBorder(),
    disabledBorder: kFocusedOutlineInputBorder(),
    hintText: hintText,
    helperText: helperText,
  );
}

InputDecoration kDisabledTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.all(20.0),
    focusedBorder: kFocusedOutlineInputBorder(),
    enabledBorder: kFocusedOutlineInputBorder(),
    disabledBorder: kFocusedOutlineInputBorder(),
    hintText: hintText,
    helperText: helperText,
  );
}

InputDecoration kAutoCompleteTextInputDecoration(
    {String hintText = "", String helperText = ""}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    focusedBorder: kFocusedOutlineInputBorder(),
    border: kOutlineInputBorder(),
  );
}

InputDecoration kBorderNone = const InputDecoration(border: InputBorder.none);

InputDecoration kInputDecoration(String hintText, String label) {
  return InputDecoration(
    border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.kMainColor)),
    hintText: hintText,
    labelText: label,
  );
}
