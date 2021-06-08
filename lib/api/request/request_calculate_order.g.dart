// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_calculate_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPostCaclulateOrder _$RequestPostCaclulateOrderFromJson(
    Map<String, dynamic> json) {
  return RequestPostCaclulateOrder(
    customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    lines: Lines.fromJson(json['lines'] as Map<String, dynamic>),
    shipToName: ShipToName.fromJson(json['shipToName'] as Map<String, dynamic>),
    shipToPhone: json['shipToPhone'] as String,
    shipToEmail: json['shipToEmail'] as String,
    shipToAddress:
        ShipToAddress.fromJson(json['shipToAddress'] as Map<String, dynamic>),
    shippingMethod:
        Customer.fromJson(json['shippingMethod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RequestPostCaclulateOrderToJson(
        RequestPostCaclulateOrder instance) =>
    <String, dynamic>{
      'customer': instance.customer.toJson(),
      'lines': instance.lines.toJson(),
      'shipToName': instance.shipToName.toJson(),
      'shipToPhone': instance.shipToPhone,
      'shipToEmail': instance.shipToEmail,
      'shipToAddress': instance.shipToAddress.toJson(),
      'shippingMethod': instance.shippingMethod.toJson(),
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'href': instance.href,
    };

Lines _$LinesFromJson(Map<String, dynamic> json) {
  return Lines(
    items: (json['items'] as List<dynamic>)
        .map((e) => Items.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LinesToJson(Lines instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    item: Customer.fromJson(json['item'] as Map<String, dynamic>),
    quantity: json['quantity'] as String,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item.toJson(),
      'quantity': instance.quantity,
    };

ShipToName _$ShipToNameFromJson(Map<String, dynamic> json) {
  return ShipToName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  );
}

Map<String, dynamic> _$ShipToNameToJson(ShipToName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

ShipToAddress _$ShipToAddressFromJson(Map<String, dynamic> json) {
  return ShipToAddress(
    city: json['city'] as String,
    country: json['country'] as String,
    state: json['state'] as String,
    address1: json['address1'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$ShipToAddressToJson(ShipToAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'address1': instance.address1,
      'zip': instance.zip,
    };
