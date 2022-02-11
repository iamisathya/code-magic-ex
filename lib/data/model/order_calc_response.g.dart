// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_calc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCalculationResponse _$OrderCalculationResponseFromJson(
        Map<String, dynamic> json) =>
    OrderCalculationResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderCalculationResponseToJson(
        OrderCalculationResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

OrderedItem _$OrderedItemFromJson(Map<String, dynamic> json) => OrderedItem(
      addedLines:
          AddedLineItems.fromJson(json['added_lines'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      lines: ProductLines.fromJson(json['lines'] as Map<String, dynamic>),
      terms: TermsItem.fromJson(json['terms'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderedItemToJson(OrderedItem instance) =>
    <String, dynamic>{
      'added_lines': instance.addedLines,
      'currency': instance.currency,
      'lines': instance.lines,
      'terms': instance.terms,
    };

AddedLineItems _$AddedLineItemsFromJson(Map<String, dynamic> json) =>
    AddedLineItems(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductItemBaseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddedLineItemsToJson(AddedLineItems instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

TermsItem _$TermsItemFromJson(Map<String, dynamic> json) => TermsItem(
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
      freight: Discount.fromJson(json['freight'] as Map<String, dynamic>),
      pv: json['pv'] as int,
      subtotal: json['subtotal'] as int,
      tax: TaxItem.fromJson(json['tax'] as Map<String, dynamic>),
      taxableTotal: (json['taxableTotal'] as num).toDouble(),
      total: json['total'] as int,
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$TermsItemToJson(TermsItem instance) => <String, dynamic>{
      'discount': instance.discount,
      'freight': instance.freight,
      'pv': instance.pv,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'taxableTotal': instance.taxableTotal,
      'total': instance.total,
      'weight': instance.weight,
    };

TaxItem _$TaxItemFromJson(Map<String, dynamic> json) => TaxItem(
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$TaxItemToJson(TaxItem instance) => <String, dynamic>{
      'amount': instance.amount,
    };
