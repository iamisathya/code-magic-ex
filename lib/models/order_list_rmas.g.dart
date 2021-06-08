// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_rmas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersAndRmas _$OrdersAndRmasFromJson(Map<String, dynamic> json) {
  return OrdersAndRmas(
    items: (json['items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrdersAndRmasToJson(OrdersAndRmas instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    creator:
        CommonHumanFullName.fromJson(json['creator'] as Map<String, dynamic>),
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
