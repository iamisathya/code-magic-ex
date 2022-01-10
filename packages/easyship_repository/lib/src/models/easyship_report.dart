import 'package:json_annotation/json_annotation.dart';

part 'easyship_report.g.dart';

@JsonSerializable()
class EasyShipReports {
  @JsonKey(name: "ordernumber")
  String orderNumber;
  @JsonKey(name: "pvdate")
  String pvDate;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "itemname")
  String itemName;
  @JsonKey(name: "price")
  String price;
  @JsonKey(name: "pv")
  int pv;
  @JsonKey(name: "totalprice")
  String totalPrice;

  EasyShipReports({
    required this.orderNumber,
    required this.pvDate,
    required this.name,
    required this.itemName,
    required this.price,
    required this.pv,
    required this.totalPrice,
  });

  factory EasyShipReports.fromJson(Map<String, dynamic> json) =>
      _$EasyShipReportsFromJson(json);

  Map<String, dynamic> toJson() => _$EasyShipReportsToJson(this);

  Map<String, dynamic> toMap() => {
        'orderNumber': orderNumber,
        'pvDate': pvDate,
        'name': name,
        'itemName': itemName,
        'price': price,
        'pv': pv,
        'totalPrice': totalPrice,
      };
}
