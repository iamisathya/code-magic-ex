import 'package:freezed_annotation/freezed_annotation.dart';

import 'place_order.dart';

part 'order_calc_response.g.dart';

@JsonSerializable()
class OrderCalculationResponse {
  @JsonKey(name: "items")
  List<OrderedItem> items;

  OrderCalculationResponse({required this.items});

  Map<String, dynamic> toMap() => {
        'items': items,
      };

  factory OrderCalculationResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderCalculationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCalculationResponseToJson(this);
}

@JsonSerializable()
class OrderedItem {
  @JsonKey(name: "added_lines")
  AddedLineItems addedLines;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "lines")
  ProductLines lines;
  @JsonKey(name: "terms")
  TermsItem terms;

  OrderedItem(
      {required this.addedLines,
      required this.currency,
      required this.lines,
      required this.terms});

  Map<String, dynamic> toMap() => {
        'addedLines': addedLines,
        'currency': currency,
        'lines': lines,
        'terms': terms
      };

  factory OrderedItem.fromJson(Map<String, dynamic> json) =>
      _$OrderedItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderedItemToJson(this);
}

@JsonSerializable()
class AddedLineItems {
  @JsonKey(name: 'items')
  List<ProductItemBaseInfo> items;

  AddedLineItems({required this.items});

  factory AddedLineItems.fromJson(Map<String, dynamic> json) =>
      _$AddedLineItemsFromJson(json);

  Map<String, dynamic> toJson() => _$AddedLineItemsToJson(this);
}

@JsonSerializable()
class TermsItem {
  Discount discount;
  Discount freight;
  int pv;
  int subtotal;
  TaxItem tax;
  double taxableTotal;
  int total;
  double weight;

  TermsItem(
      {required this.discount,
      required this.freight,
      required this.pv,
      required this.subtotal,
      required this.tax,
      required this.taxableTotal,
      required this.total,
      required this.weight});

  Map<String, dynamic> toMap() => {
        'discount': discount,
        'freight': freight,
        'pv': pv,
        'subtotal': subtotal,
        'tax': tax,
        'taxableTotal': taxableTotal,
        'total': total,
        'weight': weight,
      };

  factory TermsItem.fromJson(Map<String, dynamic> json) =>
      _$TermsItemFromJson(json);

  Map<String, dynamic> toJson() => _$TermsItemToJson(this);
}

@JsonSerializable()
class TaxItem {
  double amount;

  TaxItem({required this.amount});

  Map<String, dynamic> toMap() => {
        'amount': amount,
      };

  factory TaxItem.fromJson(Map<String, dynamic> json) =>
      _$TaxItemFromJson(json);

  Map<String, dynamic> toJson() => _$TaxItemToJson(this);
}
