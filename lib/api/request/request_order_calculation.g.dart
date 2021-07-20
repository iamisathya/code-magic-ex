// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_order_calculation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestOrderCalculation _$RequestOrderCalculationFromJson(
    Map<String, dynamic> json) {
  return RequestOrderCalculation(
    order: Order.fromJson(json['order'] as Map<String, dynamic>),
    uShopData: UShopData.fromJson(json['uShopData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RequestOrderCalculationToJson(
        RequestOrderCalculation instance) =>
    <String, dynamic>{
      'order': instance.order,
      'uShopData': instance.uShopData,
    };

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    lines: Lines.fromJson(json['lines'] as Map<String, dynamic>),
    customer: CustomerHref.fromJson(json['customer'] as Map<String, dynamic>),
    shipToAddress:
        ShipToAddress.fromJson(json['shipToAddress'] as Map<String, dynamic>),
    shippingMethod:
        ShippingMethod.fromJson(json['shippingMethod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'customer': instance.customer,
      'lines': instance.lines,
      'shipToAddress': instance.shipToAddress,
      'shippingMethod': instance.shippingMethod,
    };

Lines _$LinesFromJson(Map<String, dynamic> json) {
  return Lines(
    items: (json['items'] as List<dynamic>)
        .map((e) => LineItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LinesToJson(Lines instance) => <String, dynamic>{
      'items': instance.items,
    };

LineItem _$LineItemFromJson(Map<String, dynamic> json) {
  return LineItem(
    items: CustomerHref.fromJson(json['item'] as Map<String, dynamic>),
    itemId: json['itemID'] as String,
    quantity: json['quantity'] as String,
  );
}

Map<String, dynamic> _$LineItemToJson(LineItem instance) => <String, dynamic>{
      'item': instance.items,
      'itemID': instance.itemId,
      'quantity': instance.quantity,
    };

ShipToAddress _$ShipToAddressFromJson(Map<String, dynamic> json) {
  return ShipToAddress(
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$ShipToAddressToJson(ShipToAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
    };

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) {
  return ShippingMethod(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

CustomerHref _$CustomerHrefFromJson(Map<String, dynamic> json) {
  return CustomerHref(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerHrefToJson(CustomerHref instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

UShopData _$UShopDataFromJson(Map<String, dynamic> json) {
  return UShopData(
    loginId: json['loginId'] as String,
  );
}

Map<String, dynamic> _$UShopDataToJson(UShopData instance) => <String, dynamic>{
      'loginId': instance.loginId,
    };
