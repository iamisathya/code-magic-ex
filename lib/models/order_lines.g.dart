// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_lines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLines _$OrderLinesFromJson(Map<String, dynamic> json) {
  return OrderLines(
    items: (json['items'] as List<dynamic>)
        .map((e) => OrderLineItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderLinesToJson(OrderLines instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

OrderLineItem _$OrderLineItemFromJson(Map<String, dynamic> json) {
  return OrderLineItem(
    index: json['index'] as int,
    item: CommonUserIdString.fromJson(json['item'] as Map<String, dynamic>),
    catalogSlide: CommonCatalogSlideContent.fromJson(
        json['catalogSlide'] as Map<String, dynamic>),
    terms: CommonTermsEach.fromJson(json['terms'] as Map<String, dynamic>),
    order: Orderitem.fromJson(json['order'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderLineItemToJson(OrderLineItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'item': instance.item,
      'catalogSlide': instance.catalogSlide,
      'terms': instance.terms,
      'order': instance.order,
    };

Orderitem _$OrderitemFromJson(Map<String, dynamic> json) {
  return Orderitem(
    index: CommonUserIdCountry.fromJson(json['id'] as Map<String, dynamic>),
    terms: TermsPeriod.fromJson(json['terms'] as Map<String, dynamic>),
    customer: CommonUserIdIntObject.fromJson(
        json['customer'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$OrderitemToJson(Orderitem instance) => <String, dynamic>{
      'id': instance.index,
      'terms': instance.terms,
      'customer': instance.customer,
      'href': instance.href,
    };
