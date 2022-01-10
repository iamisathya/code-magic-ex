import 'package:json_annotation/json_annotation.dart';

import 'easyship_report.dart';

part 'easyship_report_with_total.g.dart';

@JsonSerializable()
class EasyShipReportsWithTotal {
  @JsonKey(name: "month")
  String? month;
  @JsonKey(name: "totalPrice")
  double? totalPrice;
  @JsonKey(name: "totalPv")
  int? totalPv;
  @JsonKey(name: "reports")
  List<EasyShipReports>? reports;

  EasyShipReportsWithTotal({
    this.month,
    this.totalPrice,
    this.totalPv,
    this.reports,
  });

  factory EasyShipReportsWithTotal.fromJson(Map<String, dynamic> json) =>
      _$EasyShipReportsWithTotalFromJson(json);

  Map<String, dynamic> toJson() => _$EasyShipReportsWithTotalToJson(this);

  Map<String, dynamic> toMap() => {
        'totalPrice': totalPrice,
        'totalPv': totalPv,
        'reports': reports
      };
}
