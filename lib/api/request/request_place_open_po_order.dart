import 'package:json_annotation/json_annotation.dart';
part 'request_place_open_po_order.g.dart';

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
  String item;
  @JsonKey(name: 'po_img')
  String base64Image;

  RequestPlaceOpenPoOrder({
    required this.comment,
    required this.customerId,
    required this.customeDscId,
    required this.poId,
    required this.totalPv,
    required this.totalPrice,
    required this.customerName,
    required this.item,
    required this.base64Image,
  });

  factory RequestPlaceOpenPoOrder.fromJson(Map<String, dynamic> json) =>
      _$RequestPlaceOpenPoOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPlaceOpenPoOrderToJson(this);
}
