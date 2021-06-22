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
