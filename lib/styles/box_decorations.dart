import 'package:flutter/material.dart';

import '../constants/colors.dart';

BoxDecoration normalBoxDecoration() {
  return BoxDecoration(
      color: kWhiteSmokeColor,
      border: Border.all(color: kMainColor, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)));
}

BoxDecoration kCircular8 =
    BoxDecoration(borderRadius: BorderRadius.circular(8), color: kMainColor);

BoxDecoration kTableHeaderBoxDecoration(
        {Color c = kMainColor, double w = 0.5, Color bc = Colors.white}) =>
    BoxDecoration(color: c, border: Border.all(width: w, color: bc));

BoxDecoration kCheckoutDecoration({Color c = Colors.white, double r = 15}) =>
    BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(r),
    );
