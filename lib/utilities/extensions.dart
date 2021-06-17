import 'package:easy_localization/easy_localization.dart';

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
}

extension DoubleExtension on double {
   String get asReadableString => toInt().toString();
}