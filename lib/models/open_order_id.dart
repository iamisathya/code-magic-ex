import 'package:json_annotation/json_annotation.dart';

part 'open_order_id.g.dart';

@JsonSerializable(explicitToJson: true)
class OpenPlaceOrderId {
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "order_dscid")
  String orderDscId;
  @JsonKey(name: "order_opid")
  String orderOpId;
  @JsonKey(name: "order_total_pv")
  String orderTotalPv;
  @JsonKey(name: "order_total_price")
  String orderTotalPrice;
  @JsonKey(name: "order_date")
  String orderDate;
  @JsonKey(name: "order_status")
  String orderStatus;
  @JsonKey(name: "create_by")
  String createBy;
  @JsonKey(name: "create_date")
  String createDate;
  @JsonKey(name: "update_by")
  String updateBy;
  @JsonKey(name: "update_date")
  String updateDate;
  @JsonKey(name: "delete_by")
  String deleteBy;
  @JsonKey(name: "delete_date")
  String deleteDate;
  @JsonKey(name: "cus_id")
  String customerId;
  @JsonKey(name: "so_id")
  String soId;
  @JsonKey(name: "comment")
  String comment;
  @JsonKey(name: "is_print")
  String isPrint;
  @JsonKey(name: "printed_by")
  String printedBy;
  @JsonKey(name: "last_update")
  String lastUpdate;

  OpenPlaceOrderId(
      {this.orderId = "",
      this.orderDscId = "",
      this.orderOpId = "",
      this.orderTotalPv = "",
      this.orderTotalPrice = "",
      this.orderDate = "",
      this.orderStatus = "",
      this.createBy = "",
      this.createDate = "",
      this.updateBy = "",
      this.updateDate = "",
      this.deleteBy = "",
      this.deleteDate = "",
      this.customerId = "",
      this.soId = "",
      this.comment = "",
      this.isPrint = "",
      this.printedBy = "",
      this.lastUpdate = ""});

  factory OpenPlaceOrderId.fromJson(Map<String, dynamic> json) =>
      _$OpenPlaceOrderIdFromJson(json);

  Map<String, dynamic> toJson() => _$OpenPlaceOrderIdToJson(this);

  Map<String, dynamic> toMap() => {
        'orderId': orderId,
        'orderDscId': orderDscId,
        'orderOpId': orderOpId,
        'orderTotalPv': orderTotalPv,
        'orderTotalPrice': orderTotalPrice,
        'orderDate': orderDate,
        'orderStatus': orderStatus,
        'createBy': createBy,
        'createDate': createDate,
        'updateBy': updateBy,
        'updateDate': updateDate,
        'deleteBy': deleteBy,
        'deleteDate': deleteDate,
        'customerId': customerId,
        'soId': soId,
        'comment': comment,
        'isPrint': isPrint,
        'printedBy': printedBy,
        'lastUpdate': lastUpdate,
      };
}
