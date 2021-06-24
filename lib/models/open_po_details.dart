import 'package:json_annotation/json_annotation.dart';

part 'open_po_details.g.dart';

@JsonSerializable(explicitToJson: true)
class OpenPlaceOrderDetails {
  @JsonKey(name: "comment")
  String comment;
  @JsonKey(name: "pro_id")
  String productId;
  @JsonKey(name: "pro_name")
  String productName;
  @JsonKey(name: "pro_price")
  String productPrice;
  @JsonKey(name: "pro_pv")
  String productPv;
  @JsonKey(name: "pro_qty")
  String productQty;
  @JsonKey(name: "total")
  String total;
  @JsonKey(name: "total2")
  String total2;
  @JsonKey(name: "totalprice")
  String totalPrice;
  @JsonKey(name: "totalpv")
  String totalPv;

  OpenPlaceOrderDetails(
      {this.comment = "",
      this.productId = "",
      this.productName = "",
      this.productPrice = "",
      this.productPv = "",
      this.productQty = "",
      this.total = "",
      this.total2 = "",
      this.totalPrice = "",
      this.totalPv = ""});

  factory OpenPlaceOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OpenPlaceOrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OpenPlaceOrderDetailsToJson(this);

  Map<String, dynamic> toMap() => {
        'comment': comment,
        'productId': productId,
        'productName': productName,
        'productPrice': productPrice,
        'productPv': productPv,
        'productQty': productQty,
        'total': total,
        'total2': total2,
        'totalPrice': totalPrice,
        'totalPv': totalPv,
      };
}
