// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateOrder _$CalculateOrderFromJson(Map<String, dynamic> json) =>
    CalculateOrder(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductLineItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalculateOrderToJson(CalculateOrder instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

ProductLines _$ProductLinesFromJson(Map<String, dynamic> json) => ProductLines(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductLinesToJson(ProductLines instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      items: ProductItemBaseInfo.fromJson(json['item'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      terms: ProductTerms.fromJson(json['terms'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'item': instance.items,
      'quantity': instance.quantity,
      'terms': instance.terms,
    };

ProductItemBaseInfo _$ProductItemBaseInfoFromJson(Map<String, dynamic> json) =>
    ProductItemBaseInfo(
      href: json['href'] as String,
      id: Id.fromJson(json['id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductItemBaseInfoToJson(
        ProductItemBaseInfo instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      id: json['id'] as String,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'id': instance.id,
    };

ProductTerms _$ProductTermsFromJson(Map<String, dynamic> json) => ProductTerms(
      priceEach: json['priceEach'] as int,
      subtotal: json['subtotal'] as int,
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductTermsToJson(ProductTerms instance) =>
    <String, dynamic>{
      'priceEach': instance.priceEach,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
    };

ProductLineItems _$ProductLineItemsFromJson(Map<String, dynamic> json) =>
    ProductLineItems(
      lines: ProductLines.fromJson(json['lines'] as Map<String, dynamic>),
      addedLines:
          AddedLines.fromJson(json['added_lines'] as Map<String, dynamic>),
      terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$ProductLineItemsToJson(ProductLineItems instance) =>
    <String, dynamic>{
      'lines': instance.lines,
      'added_lines': instance.addedLines,
      'terms': instance.terms,
      'currency': instance.currency,
    };

AddedLines _$AddedLinesFromJson(Map<String, dynamic> json) => AddedLines(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductLines.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddedLinesToJson(AddedLines instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'amount': instance.amount,
    };

Freight _$FreightFromJson(Map<String, dynamic> json) => Freight(
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$FreightToJson(Freight instance) => <String, dynamic>{
      'amount': instance.amount,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) => Terms(
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
      freight: Freight.fromJson(json['freight'] as Map<String, dynamic>),
      pv: json['pv'] as int,
      subtotal: json['subtotal'] as int,
      tax: Tax.fromJson(json['tax'] as Map<String, dynamic>),
      taxableTotal: (json['taxableTotal'] as num).toDouble(),
      total: json['total'] as int,
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'discount': instance.discount,
      'freight': instance.freight,
      'pv': instance.pv,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'taxableTotal': instance.taxableTotal,
      'total': instance.total,
      'weight': instance.weight,
    };

Tax _$TaxFromJson(Map<String, dynamic> json) => Tax(
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'amount': instance.amount,
    };
