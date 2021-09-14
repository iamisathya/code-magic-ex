import 'package:json_annotation/json_annotation.dart';

part 'sales_report_order_item.g.dart';

@JsonSerializable()
class SalesReportOrderItem {
  @JsonKey(name: "inputdata")
  String inputData;
  @JsonKey(name: "customer")
  String customer;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "ordernumber")
  String orderNumber;
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "total")
  String total;
  @JsonKey(name: "totalpv")
  int totalPv;
  @JsonKey(name: "barcode")
  String barcode;

  SalesReportOrderItem(
      {required this.inputData,
      required this.customer,
      required this.name,
      required this.orderNumber,
      required this.date,
      required this.time,
      required this.total,
      required this.totalPv,
      required this.barcode});

  factory SalesReportOrderItem.fromJson(Map<String, dynamic> json) =>
      _$SalesReportOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$SalesReportOrderItemToJson(this);

  Map<String, dynamic> toMap() => {
        'inputData': inputData,
        'customer': customer,
        'name': name,
        'orderNumber': orderNumber,
        'date': date,
        'time': time,
        'total': total,
        'totalPv': totalPv,
        'barcode': barcode
      };
}
