// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_rmas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersAndRmas _$OrdersAndRmasFromJson(Map<String, dynamic> json) =>
    OrdersAndRmas(
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => AllOrders.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AllOrders>[],
      rmas: (json['rmas'] as List<dynamic>?)
              ?.map((e) => AllRma.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AllRma>[],
    );

Map<String, dynamic> _$OrdersAndRmasToJson(OrdersAndRmas instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'rmas': instance.rmas,
    };

RmaItem _$RmaItemFromJson(Map<String, dynamic> json) => RmaItem(
      creator: json['creator'] == null
          ? const CommonHumanNameObject()
          : CommonHumanNameObject.fromJson(
              json['creator'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? const CustomerDetails()
          : CustomerDetails.fromJson(json['customer'] as Map<String, dynamic>),
      currency: json['currency'] as String? ?? "",
      order: json['order'] == null
          ? const OrderData()
          : OrderData.fromJson(json['order'] as Map<String, dynamic>),
      terms: json['terms'] == null
          ? const Terms()
          : Terms.fromJson(json['terms'] as Map<String, dynamic>),
      dateCreated: json['dateCreated'] as String? ?? "",
      id: json['id'] == null
          ? const CommonIdAndIota()
          : CommonIdAndIota.fromJson(json['id'] as Map<String, dynamic>),
      shipToName: json['shipToName'] == null
          ? const CommonShipToNameFull()
          : CommonShipToNameFull.fromJson(
              json['shipToName'] as Map<String, dynamic>),
      type: json['type'] as String? ?? "",
      href: json['href'] as String? ?? "",
    );

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

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      id: json['id'] == null
          ? const CommonIdAndIota()
          : CommonIdAndIota.fromJson(json['id'] as Map<String, dynamic>),
      href: json['href'] as String? ?? "",
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
    };

AllOrders _$AllOrdersFromJson(Map<String, dynamic> json) => AllOrders(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OrderItem>[],
    );

Map<String, dynamic> _$AllOrdersToJson(AllOrders instance) => <String, dynamic>{
      'items': instance.items,
    };

AllRma _$AllRmaFromJson(Map<String, dynamic> json) => AllRma(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => RmaItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RmaItem>[],
    );

Map<String, dynamic> _$AllRmaToJson(AllRma instance) => <String, dynamic>{
      'items': instance.items,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      creator: json['creator'] == null
          ? const CommonHumanNameObject()
          : CommonHumanNameObject.fromJson(
              json['creator'] as Map<String, dynamic>),
      currency: json['currency'] as String? ?? "",
      customer: json['customer'] == null
          ? const CustomerDetails()
          : CustomerDetails.fromJson(json['customer'] as Map<String, dynamic>),
      dateCreated: json['dateCreated'] as String? ?? "",
      id: json['id'] == null
          ? const CommonIdAndIota()
          : CommonIdAndIota.fromJson(json['id'] as Map<String, dynamic>),
      terms: json['terms'] == null
          ? const Terms()
          : Terms.fromJson(json['terms'] as Map<String, dynamic>),
      shipToName: json['shipToName'] == null
          ? const CommonShipToNameFull()
          : CommonShipToNameFull.fromJson(
              json['shipToName'] as Map<String, dynamic>),
      source:
          json['source'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      type: json['type'] as String? ?? "",
      paymentStatus: json['paymentStatus'] as String? ?? "",
      href: json['href'] as String? ?? "",
    );

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

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      id: json['id'] == null
          ? const CommonIdTypeString()
          : CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
      humanName: json['humanName'] == null
          ? const CompleteHumanThName()
          : CompleteHumanThName.fromJson(
              json['humanName'] as Map<String, dynamic>),
      href: json['href'] as String? ?? "",
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'humanName': instance.humanName,
      'href': instance.href,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) => Terms(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      pv: json['pv'] as int? ?? 0,
    );

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'total': instance.total,
      'pv': instance.pv,
    };
