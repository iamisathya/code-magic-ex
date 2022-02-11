import 'package:json_annotation/json_annotation.dart';

part 'open_po_create_order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OpenPOCreateOrderResponse {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "poid")
  String poId;
  @JsonKey(name: "cus_code")
  String customerCode;
  @JsonKey(name: "cus_id")
  String customerId;
  @JsonKey(name: "totalpv")
  String totalPv;
  @JsonKey(name: "totalprice")
  String totalPrice;
  @JsonKey(name: "cusname")
  String customerName;
  @JsonKey(name: "comment")
  String comment;
  @JsonKey(name: "poimg1")
  String poImg1;
  @JsonKey(name: "poimg2")
  String poImg2;

  OpenPOCreateOrderResponse(
      {required this.success,
      required this.poId,
      required this.customerCode,
      required this.customerId,
      required this.totalPv,
      required this.totalPrice,
      required this.customerName,
      required this.comment,
      required this.poImg1,
      required this.poImg2});

  factory OpenPOCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenPOCreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OpenPOCreateOrderResponseToJson(this);

  Map<String, dynamic> toMap() => {
        'success': success,
        'poId': poId,
        'customerCode': customerCode,
        'customerId': customerId,
        'totalPv': totalPv,
        'totalPrice': totalPrice,
        'customerName': customerName,
        'comment': comment,
        'poImg1': poImg1,
        'poImg2': poImg2,
      };
}
