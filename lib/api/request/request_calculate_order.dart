import 'package:json_annotation/json_annotation.dart';

part 'request_calculate_order.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestPostCaclulateOrder {
  @JsonKey(name: 'customer')
  Customer customer;
  @JsonKey(name: 'lines')
  Lines lines;
  @JsonKey(name: 'shipToName')
  ShipToName shipToName;
  @JsonKey(name: 'shipToPhone')
  String shipToPhone;
  @JsonKey(name: 'shipToEmail')
  String shipToEmail;
  @JsonKey(name: 'shipToAddress')
  ShipToAddress shipToAddress;
  @JsonKey(name: 'shippingMethod')
  Customer shippingMethod;

  RequestPostCaclulateOrder(
      {required this.customer,
      required this.lines,
      required this.shipToName,
      required this.shipToPhone,
      required this.shipToEmail,
      required this.shipToAddress,
      required this.shippingMethod});

  factory RequestPostCaclulateOrder.fromJson(Map<String, dynamic> json) =>
      _$RequestPostCaclulateOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostCaclulateOrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Customer {
  @JsonKey(name: 'href')
  String href;

  Customer({required this.href});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Lines {
  @JsonKey(name: 'items')
  List<Items> items;

  Lines({required this.items});

  factory Lines.fromJson(Map<String, dynamic> json) => _$LinesFromJson(json);

  Map<String, dynamic> toJson() => _$LinesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Items {
  @JsonKey(name: 'item')
  Customer item;
  @JsonKey(name: 'quantity')
  String quantity;

  Items({required this.item, required this.quantity});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipToName {
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;

  ShipToName({required this.firstName, required this.lastName});

  factory ShipToName.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipToAddress {
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'address1')
  String address1;
  @JsonKey(name: 'zip')
  String zip;

  ShipToAddress(
      {required this.city,
      required this.country,
      required this.state,
      required this.address1,
      required this.zip});

  factory ShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$ShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToAddressToJson(this);
}
