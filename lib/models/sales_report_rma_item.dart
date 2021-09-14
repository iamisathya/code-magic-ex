import 'package:json_annotation/json_annotation.dart';

part 'sales_report_rma_item.g.dart';

@JsonSerializable()
class SalesReportRmaItem {
  @JsonKey(name: "inputdata")
  String inputData;
  @JsonKey(name: "customer")
  String customer;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "ordernumber")
  String orderNumber;
  @JsonKey(name: "rmaordernumber")
  String rmaOrderNumber;
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "total")
  String total;
  @JsonKey(name: "totalpv")
  String totalPv;

  SalesReportRmaItem(
      {required this.inputData,
      required this.customer,
      required this.name,
      required this.orderNumber,
      required this.rmaOrderNumber,
      required this.date,
      required this.time,
      required this.total,
      required this.totalPv});

  factory SalesReportRmaItem.fromJson(Map<String, dynamic> json) =>
      _$SalesReportRmaItemFromJson(json);

  Map<String, dynamic> toJson() => _$SalesReportRmaItemToJson(this);

  Map<String, dynamic> toMap() => {
        'inputData': inputData,
        'customer': customer,
        'name': name,
        'orderNumber': orderNumber,
        'date': date,
        'time': time,
        'total': total,
        'totalPv': totalPv,
        'rmaOrderNumber': rmaOrderNumber
      };
}
