import 'package:json_annotation/json_annotation.dart';

part 'open_po.g.dart';

@JsonSerializable()
class OpenPO {
  @JsonKey(name: "icon_attachment")
  String iconAttachment;
  @JsonKey(name: "order_date")
  String orderDate;
  @JsonKey(name: "order_dscid")
  String orderDscid;
  @JsonKey(name: "order_opid")
  String orderOpid;
  @JsonKey(name: "order_status")
  String orderStatus;
  @JsonKey(name: "order_time")
  String orderTime;
  @JsonKey(name: "order_total_price")
  String orderTotalPrice;
  @JsonKey(name: "order_total_pv")
  String orderTotalPv;

  OpenPO(
      {required this.orderDscid,
      required this.orderOpid,
      required this.orderTotalPv,
      required this.orderTotalPrice,
      required this.orderDate,
      required this.orderTime,
      required this.orderStatus,
      required this.iconAttachment});

  Map<String, dynamic> toMap() => {
        'iconAttachment': iconAttachment,
        'orderDate': orderDate,
        'orderDscid': orderDscid,
        'orderOpid': orderOpid,
        'orderStatus': orderStatus,
        'orderTime': orderTime,
        'orderTotalPrice': orderTotalPrice,
        'orderTotalPv': orderTotalPv,
      };

  factory OpenPO.fromJson(Map<String, dynamic> json) => _$OpenPOFromJson(json);

  Map<String, dynamic> toJson() => _$OpenPOToJson(this);
}
