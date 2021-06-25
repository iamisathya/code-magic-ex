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
    this.index = 0,
    this.item = const CommonUserIdString(),
    this.catalogSlide = const CommonCatalogSlideContent(),
    this.terms = const CommonTermsEach(),
    this.order = const Orderitem(),
  });

  factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderLineItemToJson(this);
}

@JsonSerializable()
class Orderitem {
  @JsonKey(name: "id")
  final CommonIdWithCountryCode id;
  @JsonKey(name: "terms")
  final TermsPeriod terms;
  @JsonKey(name: "customer")
  final CommonUserIdIntObject customer;
  @JsonKey(name: "href")
  final String href;

  const Orderitem({
    this.id = const CommonIdWithCountryCode(),
    this.terms = const TermsPeriod(),
    this.customer = const CommonUserIdIntObject(),
    this.href = "",
  });

  factory Orderitem.fromJson(Map<String, dynamic> json) =>
      _$OrderitemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderitemToJson(this);
}

class ClassOne {
  ClassTwo secend;
  ClassOne({this.secend = const ClassTwo(value: "another value")});
}

class ClassTwo {
  final String value;
  const ClassTwo({this.value = "default"});
}
