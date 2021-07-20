import 'package:json_annotation/json_annotation.dart';

part 'request_order_calculation.g.dart';

@JsonSerializable()
class RequestOrderCalculation {
  @JsonKey(name: "order")
  Order order;
  @JsonKey(name: "uShopData")
  UShopData uShopData;
  RequestOrderCalculation({
    required this.order,
    required this.uShopData,
  });

  factory RequestOrderCalculation.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderCalculationFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOrderCalculationToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: "items")
  List<LineItem> items;

  Order({required this.items});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class LineItem {
  @JsonKey(name: "item")
  CustomerHref items;
  @JsonKey(name: "itemID")
  String itemId;
  @JsonKey(name: "quantity")
  String quantity;

  LineItem({required this.items, required this.itemId, required this.quantity});

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);

  Map<String, dynamic> toJson() => _$LineItemToJson(this);
}

@JsonSerializable()
class ShipToAddress {
  @JsonKey(name: "country")
  String country;

  ShipToAddress({required this.country});

  factory ShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$ShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToAddressToJson(this);
}

@JsonSerializable()
class ShippingMethod {
  @JsonKey(name: "href")
  String href;

  ShippingMethod({required this.href});

  factory ShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodToJson(this);
}

@JsonSerializable()
class CustomerHref {
  @JsonKey(name: "href")
  String href;

  CustomerHref({required this.href});

  factory CustomerHref.fromJson(Map<String, dynamic> json) =>
      _$CustomerHrefFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerHrefToJson(this);
}

@JsonSerializable()
class UShopData {
  @JsonKey(name: "loginId")
  String loginId;

  UShopData({required this.loginId});

  factory UShopData.fromJson(Map<String, dynamic> json) =>
      _$UShopDataFromJson(json);

  Map<String, dynamic> toJson() => _$UShopDataToJson(this);
}
