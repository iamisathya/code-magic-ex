import 'package:json_annotation/json_annotation.dart';

import 'package:code_magic_ex/models/common_methods.dart';

part 'order_lines.g.dart';

@JsonSerializable()
class OrderLines {
  @JsonKey(name: "items")
  List<OrderLineItem> items;

  OrderLines({
    required this.items,
  });

  factory OrderLines.fromJson(Map<String, dynamic> json) =>
      _$OrderLinesFromJson(json);

  Map<String, dynamic> toJson() => _$OrderLinesToJson(this);
}

@JsonSerializable()
class OrderLineItem {
  @JsonKey(name: "index")
  int index;
  @JsonKey(name: "item")
  CommonUserIdString item;
  @JsonKey(name: "catalogSlide")
  CommonCatalogSlideContent catalogSlide;
  @JsonKey(name: "terms")
  CommonTermsEach terms;
  @JsonKey(name: "order")
  Orderitem order;

  OrderLineItem({
    required this.index,
    required this.item,
    required this.catalogSlide,
    required this.terms,
    required this.order,
  });

  factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderLineItemToJson(this);
}


@JsonSerializable()
class Orderitem {
  @JsonKey(name: "id")
  CommonIdWithCountryCode id;
  @JsonKey(name: "terms")
  TermsPeriod terms;
  @JsonKey(name: "customer")
  CommonUserIdIntObject customer;
  @JsonKey(name: "href")
  String href;

  Orderitem({
    required this.id,
    required this.terms,
    required this.customer,
    required this.href,
  });

  factory Orderitem.fromJson(Map<String, dynamic> json) =>
      _$OrderitemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderitemToJson(this);
}

