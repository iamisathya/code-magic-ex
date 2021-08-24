import 'package:flutter/material.dart';

EdgeInsets kEdgeInsetSymmetric({double v = 12.0, double h = 16.0}) =>
    EdgeInsets.symmetric(vertical: v, horizontal: h);

EdgeInsets kEdgeInset({double v = 8.0}) => EdgeInsets.all(v);

EdgeInsets kEdgeInsetTLRB(
        {double t = 0.0, double r = 0.0, double b = 0.0, double l = 0.0}) =>
    EdgeInsets.only(bottom: b, top: t, left: l, right: r);
