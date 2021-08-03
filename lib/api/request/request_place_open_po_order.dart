import 'package:json_annotation/json_annotation.dart';
part 'request_calculate_order.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestPlaceOpenPoOrder {
  @JsonKey(name: 'comment')
  String comment;
  @JsonKey(name: 'cus_id')
  String customerId;
  @JsonKey(name: 'cus_dscid')
  String customeDscId;
  @JsonKey(name: 'poid')
  String poId;
  @JsonKey(name: 'totalpv')
  String totalPv;
  @JsonKey(name: 'totalprice')
  String totalPrice;
  @JsonKey(name: 'cusname')
  String customerName;
  @JsonKey(name: 'item')
  @JsonKey(name: 'item')
  String totalPitemrice;
  @JsonKey(name: 'po_img')
  String base64Image;

  RequestPlaceOpenPoOrder(
      {required this.comment,
      required this.customerId,
      required this.customeDscId,
      required this.poId,
      required this.totalPv,
      required this.totalPrice,
      required this.item,
      required this.name,
  });

  factory RequestPostCaclulateOrder.fromJson(Map<String, dynamic> json) =>
      _$RequestPostCaclulateOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostCaclulateOrderToJson(this);
}

