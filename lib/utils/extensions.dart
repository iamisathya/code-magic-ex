// ignore_for_file: unnecessary_string_escapes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/enums.dart';
import 'parsing.dart';

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension WidgetOp on Widget {
  Widget addVerticalSpace(double height) {
    return SizedBox(height: height);
  }

  Widget addHorizontalSpace(double width) {
    return SizedBox(width: width);
  }
}

extension DoubleParsing on RxDouble {
  String numberFormat() {
    return NumberFormat("#,###").format(value);
  }
}

extension IntParsing on RxInt {
  String numberFormat() {
    return NumberFormat("#,###").format(value);
  }
}

extension NumberParsing on String {
  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  bool isNumberOnly() {
    final n = num.tryParse(this);
    if (n == null) {
      return false;
    }
    return true;
  }

  String get precisionCheck {
    if (contains(".")) {
      return (split(".")[1] == "00" || split(".")[1] == "0")
          ? split(".")[0]
          : this;
    }
    return this;
  }
}

extension FormatNumber on String {
  String format() {
    return NumberFormat().format(Parsing.intFrom(this));
  }

  double numberFormatDouble() {
    return double.tryParse(replaceAll(",", "")) ?? 0.00;
  }
}

extension DateParsing on DateTime {
  String yyyyMMdd() {
    return DateFormat('yyyy-MM-dd').format(this).toString();
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
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

  String retrieveBarcode() {
    // <a href=\"https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f7525477d2ced9d2f1fac6c0ddf622ee02f2&token=ad4e6c2d-aad2-473b-8686-b02b2fc903d0\" target=\"_blank\">423177348</a>
    const start = ">";
    const end = "</a>";
    final startIndex = indexOf(start);
    final endIndex = indexOf(end, startIndex + start.length);
    try {
      return substring(startIndex + start.length, endIndex);
    } catch (e) {
      return this;
    }
  }

  String retrieveLastString() {
    // https://dsc-th.unicity.com/barcode/?href=cb35c0faba9c0ecd572a6929e3c912293874eb850fabf9595af7b0ae858e164b&token=654a5e49-e5cd-410d-82ab-32f1a6ca28cd&user=23123123
    try {
      return substring(lastIndexOf("=") + 1, length);
    } catch (e) {
      return this;
    }
  }

  String retrieveHrefCode() {
    // <a href=\"https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f7525477d2ced9d2f1fac6c0ddf622ee02f2&token=ad4e6c2d-aad2-473b-8686-b02b2fc903d0\" target=\"_blank\">423177348</a>
    const start = 'href=\"';
    const end = '\" target=';
    final startIndex = indexOf(start);
    final endIndex = indexOf(end, startIndex + start.length);
    try {
      return substring(startIndex + start.length, endIndex);
    } catch (e) {
      return this;
    }
  }

  String retrieveUserIdFromUrl() {
    // <a href=\"https://dsc-th.unicity.com/barcode?lang=th&href=31512d2a1d4a2a5860bc785d27d1f75242aefdebb44a852efed13fe78f817c45&token=daac50bb-9e17-4d31-b824-c7841f03d1eb&user=100280466\" target=\"_blank\"><span class=\"glyphicon glyphicon-ok-circle\" style=\"width: 16px;color:green;\" ></span></a>
    const start = "user=";
    const end = '\" target=';
    final startIndex = indexOf(start);
    final endIndex = indexOf(end, startIndex + start.length);
    try {
      return substring(startIndex + start.length, endIndex);
    } catch (e) {
      return this;
    }
  }

  String retrieveOrderCodeFromUrl() {
    // <a href=\"https://dsc-th.unicity.com/barcode?lang=th&href=31512d2a1d4a2a5860bc785d27d1f75242aefdebb44a852efed13fe78f817c45&token=daac50bb-9e17-4d31-b824-c7841f03d1eb&user=100280466\" target=\"_blank\"><span class=\"glyphicon glyphicon-ok-circle\" style=\"width: 16px;color:green;\" ></span></a>
    const start = "orders/";
    const end = "&token";
    final startIndex = indexOf(start);
    final endIndex = indexOf(end, startIndex + start.length);
    try {
      return substring(startIndex + start.length, endIndex);
    } catch (e) {
      return this;
    }
  }

  String retrieveOrderCodeFromLightUrl() {
    // https://dsc-th.unicity.com/barcode?lang=en&href=31512d2a1d4a2a5860bc785d27d1f752db37de8ea067cef098ede454fbf66dad&token=3c9a4466-9b31-4e5d-bf18-ca4b8c3dd76d&user=236187666\"
    const start = "href=";
    const end = "&token";
    final startIndex = indexOf(start);
    final endIndex = indexOf(end, startIndex + start.length);
    try {
      return substring(startIndex + start.length, endIndex);
    } catch (e) {
      return this;
    }
  }

  String getAfterLastSlash() {
    try {
      return substring(lastIndexOf('/') + 1);
    } catch (e) {
      return this;
    }
  }

  OrderStatus orderStatus() {
    try {
      return contains("glyphicon-ok-circle")
          ? OrderStatus.success
          : OrderStatus.unknown;
    } catch (e) {
      return OrderStatus.unknown;
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

  String get asMMM {
    try {
      final DateTime currentDateTime = DateFormat("yyyy-MM").parse(this);
      return DateFormat('MMM').format(currentDateTime);
    } catch (e) {
      return '';
    }
  }

  String get asYYYY {
    try {
      final DateTime currentDateTime = DateFormat("yyyy-MM").parse(this);
      return DateFormat('yyyy').format(currentDateTime);
    } catch (e) {
      return '';
    }
  }
}

RegExp regex = RegExp(r"([.]*0)(?!.*\d)");

extension DoubleExtension on double {
  String get asReadableString => toInt().toString();
  String get precisionCheck => toString().replaceAll(regex, "");

  String doubleNumberFormat() {
    return NumberFormat("#,###.##").format(this);
  }
}

extension AppStyles on TextTheme {
  TextStyle get error => const TextStyle(
      decoration: TextDecoration.lineThrough,
      fontSize: 20.0,
      color: Colors.blue,
      fontWeight: FontWeight.bold);

  TextStyle get checkoutText => const TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500);

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

  TextStyle get commonText =>
      const TextStyle(fontSize: 15.0, color: Colors.black);
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

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
