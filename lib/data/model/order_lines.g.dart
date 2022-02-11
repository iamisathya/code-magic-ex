// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_lines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLines _$OrderLinesFromJson(Map<String, dynamic> json) => OrderLines(
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderLineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderLinesToJson(OrderLines instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

OrderLineItem _$OrderLineItemFromJson(Map<String, dynamic> json) =>
    OrderLineItem(
      index: json['index'] as int? ?? 0,
      item: json['item'] == null
          ? const CommonUserIdString()
          : CommonUserIdString.fromJson(json['item'] as Map<String, dynamic>),
      catalogSlide: json['catalogSlide'] == null
          ? const CommonCatalogSlideContent()
          : CommonCatalogSlideContent.fromJson(
              json['catalogSlide'] as Map<String, dynamic>),
      terms: json['terms'] == null
          ? const CommonTermsEach()
          : CommonTermsEach.fromJson(json['terms'] as Map<String, dynamic>),
      order: json['order'] == null
          ? const Orderitem()
          : Orderitem.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderLineItemToJson(OrderLineItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'item': instance.item,
      'catalogSlide': instance.catalogSlide,
      'terms': instance.terms,
      'order': instance.order,
    };

Orderitem _$OrderitemFromJson(Map<String, dynamic> json) => Orderitem(
      id: json['id'] == null
          ? const CommonIdWithCountryCode()
          : CommonIdWithCountryCode.fromJson(
              json['id'] as Map<String, dynamic>),
      terms: json['terms'] == null
          ? const TermsPeriod()
          : TermsPeriod.fromJson(json['terms'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? const CommonUserIdIntObject()
          : CommonUserIdIntObject.fromJson(
              json['customer'] as Map<String, dynamic>),
      href: json['href'] as String? ?? "",
    );

Map<String, dynamic> _$OrderitemToJson(Orderitem instance) => <String, dynamic>{
      'id': instance.id,
      'terms': instance.terms,
      'customer': instance.customer,
      'href': instance.href,
    };
