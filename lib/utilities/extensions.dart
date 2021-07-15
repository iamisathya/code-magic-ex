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

  String retrieveOrderStatus() {
    try {
      return split("_")[0];
    } catch (e) {
      return this;
    }
  }
}

extension DateFormater on String {
  String get asDDMMYYYY {
    try {
      final DateTime currentDateTime = DateTime.parse(this);
      return DateFormat('dd-MM-yyyy').format(currentDateTime);
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


  TextStyle get cartFooter =>
      const TextStyle(fontSize: 16.0, color: Colors.black);

  TextStyle get tableHeader =>
      const TextStyle(fontSize: 16.0, color: Colors.white);

  TextStyle get productTitle => const TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600);

  TextStyle get tableData =>
      const TextStyle(fontSize: 14.0, color: Colors.black);

  TextStyle get cardItemTitle =>
      const TextStyle(fontSize: 16.0, color: Colors.black);

  TextStyle get backButton =>
      const TextStyle(fontSize: 14.0, color: Colors.black);

  TextStyle get whiteButtonText =>
      const TextStyle(fontSize: 14.0, color: Colors.white);
}

extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}

extension DateFormula on DateTime {
  bool isAdult(DateTime birthDate) {
    // Current time - at this moment
    final DateTime today = DateTime.now();

    // Date to check but moved 18 years ahead
    final DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }
}
