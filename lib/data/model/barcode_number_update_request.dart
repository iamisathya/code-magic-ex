import 'package:json_annotation/json_annotation.dart';

part 'barcode_number_update_request.g.dart';

@JsonSerializable()
class BarcodeNumberUpdateRequest {
  @JsonKey(name: "order")
  List<Order> order;
  @JsonKey(name: "scan")
  List<BarcodeNumbers> scan;
  @JsonKey(name: "orderNumber")
  String orderNumber;

  BarcodeNumberUpdateRequest(
      {required this.order, required this.scan, required this.orderNumber});

  factory BarcodeNumberUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$BarcodeNumberUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeNumberUpdateRequestToJson(this);

  Map<String, dynamic> toMap() =>
      {'order': order, 'scan': scan, 'orderNumber': orderNumber};
}

@JsonSerializable()
class Order {
  @JsonKey(name: "item")
  String item;
  @JsonKey(name: "quantity")
  int quantity;

  Order({required this.item, required this.quantity});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Map<String, dynamic> toMap() => {'item': item, 'quantity': quantity};
}

@JsonSerializable()
class BarcodeNumbers {
  @JsonKey(name: "item")
  String item;

  BarcodeNumbers({required this.item});

  factory BarcodeNumbers.fromJson(Map<String, dynamic> json) =>
      _$BarcodeNumbersFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeNumbersToJson(this);

  Map<String, dynamic> toMap() => {'item': item};
}
