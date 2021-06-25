import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension OrderId on String {
  String retrieveOrderId() {
    try {
      return split("-")[1];
    } catch (e) {
      return this;
    }
  }

  String retrieveAttachementName() {
    //* Example: 4_201907101007524248.jpg_0
    try {
      return split("_")[1];
    } catch (e) {
      return this;
    }
  }
}

extension DateFormater on String {
  String get asDDMMYYYY {
    try {
      final DateTime currentDateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('DD/MM/YYYY');
      return formatter.format(currentDateTime);
    } catch (e) {
      return '';
    }
  }

  String get asHHMMA {
    try {
      final DateTime currentDateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('HH:MM a');
      return formatter.format(currentDateTime);
    } catch (e) {
      return '';
    }
  }
}

extension DoubleExtension on double {
  String get asReadableString => toInt().toString();
}

extension AppStyles on TextTheme {
  TextStyle get error => const TextStyle(
      decoration: TextDecoration.lineThrough,
      fontSize: 20.0,
      color: Colors.blue,
      fontWeight: FontWeight.bold);

  TextStyle get tableHeader =>
      const TextStyle(fontSize: 16.0, color: Colors.white);

  TextStyle get productTitle =>
      const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600);

  TextStyle get tableData =>
      const TextStyle(fontSize: 14.0, color: Colors.black);

  TextStyle get cardItemTitle =>
      const TextStyle(fontSize: 16.0, color: Colors.black);

  TextStyle get backButton =>
      const TextStyle(fontSize: 14.0, color: Colors.black);
}
