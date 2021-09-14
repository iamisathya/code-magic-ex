import 'package:json_annotation/json_annotation.dart';

part 'sales_report_item_item.g.dart';

@JsonSerializable()
class SalesReportItemItem {
  @JsonKey(name: "itemcode")
  String itemCode;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "pv")
  int pv;
  @JsonKey(name: "qty")
  int qty;
  @JsonKey(name: "totalpv")
  String totalPv;

  SalesReportItemItem(
      {required this.itemCode,
      required this.description,
      required this.pv,
      required this.qty,
      required this.totalPv});

  factory SalesReportItemItem.fromJson(Map<String, dynamic> json) =>
      _$SalesReportItemItemFromJson(json);

  Map<String, dynamic> toJson() => _$SalesReportItemItemToJson(this);

  Map<String, dynamic> toMap() => {
        'itemCode': itemCode,
        'description': description,
        'pv': pv,
        'qty': qty,
        'totalPv': totalPv
      };
}
