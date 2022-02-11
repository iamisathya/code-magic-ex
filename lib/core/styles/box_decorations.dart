import 'package:flutter/material.dart';

import '../values/colors.dart';

BoxDecoration normalBoxDecoration() {
  return BoxDecoration(
      color: AppColor.kWhiteSmokeColor,
      border: Border.all(color: AppColor.kMainColor, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)));
}

BoxDecoration kCircular8 = BoxDecoration(
    borderRadius: BorderRadius.circular(8), color: AppColor.kMainColor);

BoxDecoration kTableHeaderBoxDecoration(
        {Color c = AppColor.kMainColor,
        double w = 0.5,
        Color bc = Colors.white}) =>
    BoxDecoration(color: c, border: Border.all(width: w, color: bc));

BoxDecoration kCheckoutDecoration({Color c = Colors.white, double r = 15}) =>
    BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(r),
    );

BoxDecoration kEnrollHeader = const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    color: AppColor.kMainColor);
