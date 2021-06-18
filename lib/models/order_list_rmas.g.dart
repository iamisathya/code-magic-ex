// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_rmas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersAndRmas _$OrdersAndRmasFromJson(Map<String, dynamic> json) {
  return OrdersAndRmas(
    orders: (json['orders'] as List<dynamic>)
        .map((e) => AllOrders.fromJson(e as Map<String, dynamic>))
        .toList(),
    rmas: (json['rmas'] as List<dynamic>)
        .map((e) => AllRma.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrdersAndRmasToJson(OrdersAndRmas instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'rmas': instance.rmas,
    };

RmaItem _$RmaItemFromJson(Map<String, dynamic> json) {
  return RmaItem(
    creator:
        CommonHumanNameObject.fromJson(json['creator'] as Map<String, dynamic>),
    customer:
        CustomerDetails.fromJson(json['customer'] as Map<String, dynamic>),
    currency: json['currency'] as String,
    order: OrderData.fromJson(json['order'] as Map<String, dynamic>),
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    dateCreated: json['dateCreated'] as String,
    id: CommonIdAndIota.fromJson(json['id'] as Map<String, dynamic>),
    shipToName: CommonShipToNameFull.fromJson(
        json['shipToName'] as Map<String, dynamic>),
    type: json['type'] as String,
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$RmaItemToJson(RmaItem instance) => <String, dynamic>{
      'creator': instance.creator,
      'customer': instance.customer,
      'currency': instance.currency,
      'order': instance.order,
      'terms': instance.terms,
      'dateCreated': instance.dateCreated,
      'id': instance.id,
      'shipToName': instance.shipToName,
      'type': instance.type,
      'href': instance.href,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData(
    id: CommonIdAndIota.fromJson(json['id'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
    };

AllOrders _$AllOrdersFromJson(Map<String, dynamic> json) {
  return AllOrders(
    items: (json['items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllOrdersToJson(AllOrders instance) => <String, dynamic>{
      'items': instance.items,
    };

AllRma _$AllRmaFromJson(Map<String, dynamic> json) {
  return AllRma(
    items: (json['items'] as List<dynamic>)
        .map((e) => RmaItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllRmaToJson(AllRma instance) => <String, dynamic>{
      'items': instance.items,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    creator:
        CommonHumanNameObject.fromJson(json['creator'] as Map<String, dynamic>),
    currency: json['currency'] as String,
    customer:
        CustomerDetails.fromJson(json['customer'] as Map<String, dynamic>),
    dateCreated: json['dateCreated'] as String,
    id: CommonIdAndIota.fromJson(json['id'] as Map<String, dynamic>),
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    shipToName: CommonShipToNameFull.fromJson(
        json['shipToName'] as Map<String, dynamic>),
    source: json['source'] as Map<String, dynamic>,
    type: json['type'] as String,
    paymentStatus: json['paymentStatus'] as String,
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'creator': instance.creator,
      'currency': instance.currency,
      'customer': instance.customer,
      'dateCreated': instance.dateCreated,
      'id': instance.id,
      'terms': instance.terms,
      'shipToName': instance.shipToName,
      'source': instance.source,
      'type': instance.type,
      'paymentStatus': instance.paymentStatus,
      'href': instance.href,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) {
  return CustomerDetails(
    id: CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
    humanName:
        CompleteHumanThName.fromJson(json['humanName'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'humanName': instance.humanName,
      'href': instance.href,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    total: (json['total'] as num).toDouble(),
    pv: json['pv'] as int,
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'total': instance.total,
      'pv': instance.pv,
    };
