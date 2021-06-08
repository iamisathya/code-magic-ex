import 'package:json_annotation/json_annotation.dart';

part 'calculate_order.g.dart';

@JsonSerializable()
class CalculateOrder {
  @JsonKey(name: 'items')
  List<ProductLineItems> items;

  CalculateOrder({required this.items});

  factory CalculateOrder.fromJson(Map<String, dynamic> json) =>
      _$CalculateOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateOrderToJson(this);
}

@JsonSerializable()
class ProductLines {
  @JsonKey(name: 'items')
  List<ProductItem> items;

  ProductLines({required this.items});

  factory ProductLines.fromJson(Map<String, dynamic> json) =>
      _$ProductLinesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLinesToJson(this);
}

@JsonSerializable()
class ProductItem {
  @JsonKey(name: 'item')
  ProductItemBaseInfo items;
  @JsonKey(name: 'quantity')
  int quantity;
  @JsonKey(name: 'terms')
  ProductTerms terms;

  ProductItem({
    required this.items,
    required this.quantity,
    required this.terms,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class ProductItemBaseInfo {
  @JsonKey(name: 'href')
  String href;
  @JsonKey(name: 'id')
  Id id;

  ProductItemBaseInfo({
    required this.href,
    required this.id,
  });

  factory ProductItemBaseInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductItemBaseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemBaseInfoToJson(this);
}

@JsonSerializable()
class Id {
  @JsonKey(name: 'id')
  String id;

  Id({
    required this.id,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class ProductTerms {
  @JsonKey(name: 'priceEach')
  int priceEach;
  @JsonKey(name: 'subtotal')
  int subtotal;
  @JsonKey(name: 'discount')
  Discount discount;

  ProductTerms({
    required this.priceEach,
    required this.subtotal,
    required this.discount,
  });

  factory ProductTerms.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTermsToJson(this);
}

@JsonSerializable()
class ProductLineItems {
  @JsonKey(name: 'lines')
  ProductLines lines;
  @JsonKey(name: 'added_lines')
  AddedLines addedLines;
  @JsonKey(name: 'terms')
  Terms terms;
  @JsonKey(name: 'currency')
  String currency;

  ProductLineItems(
      {required this.lines, required this.addedLines, required this.terms, required this.currency});

  factory ProductLineItems.fromJson(Map<String, dynamic> json) =>
      _$ProductLineItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLineItemsToJson(this);
}

@JsonSerializable()
class AddedLines {
  List<ProductLines> items;

  AddedLines({
    required this.items,
  });

  factory AddedLines.fromJson(Map<String, dynamic> json) =>
      _$AddedLinesFromJson(json);

  Map<String, dynamic> toJson() => _$AddedLinesToJson(this);
}

@JsonSerializable()
class Discount {
  @JsonKey(name: 'amount')
  int amount;

  Discount({required this.amount});
  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class Freight {
  @JsonKey(name: 'amount')
  int amount;

  Freight({required this.amount});
  factory Freight.fromJson(Map<String, dynamic> json) =>
      _$FreightFromJson(json);

  Map<String, dynamic> toJson() => _$FreightToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: 'discount')
  Discount discount;
  @JsonKey(name: 'freight')
  Freight freight;
  @JsonKey(name: 'pv')
  int pv;
  @JsonKey(name: 'subtotal')
  int subtotal;
  @JsonKey(name: 'tax')
  Tax tax;
  @JsonKey(name: 'taxableTotal')
  double taxableTotal;
  @JsonKey(name: 'total')
  int total;
  @JsonKey(name: 'weight')
  double weight;

  Terms(
      {required this.discount,
      required this.freight,
      required this.pv,
      required this.subtotal,
      required this.tax,
      required this.taxableTotal,
      required this.total,
      required this.weight});

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class Tax {
  double amount;

  Tax({required this.amount});

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}
