import 'package:json_annotation/json_annotation.dart';

import 'package:code_magic_ex/models/common_methods.dart';

part 'order_list_rmas.g.dart';

@JsonSerializable()
class OrdersAndRmas {
  @JsonKey(name: "orders")
  List<AllOrders> orders;
  @JsonKey(name: "rmas")
  List<AllRma> rmas;

  OrdersAndRmas({
    required this.orders,
    required this.rmas,
  });

  factory OrdersAndRmas.fromJson(Map<String, dynamic> json) =>
      _$OrdersAndRmasFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersAndRmasToJson(this);
}

@JsonSerializable()
class RmaItem {
  @JsonKey(name: "creator")
  CommonHumanNameObject creator;
  @JsonKey(name: "customer")
  CustomerDetails customer;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "order")
  OrderData order;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "id")
  CommonIdAndIota id;
  @JsonKey(name: "shipToName")
  CommonShipToNameFull shipToName;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "href")
  String href;

  RmaItem({
    required this.creator,
    required this.customer,
    required this.currency,
    required this.order,
    required this.terms,
    required this.dateCreated,
    required this.id,
    required this.shipToName,
    required this.type,
    required this.href,
  });

  factory RmaItem.fromJson(Map<String, dynamic> json) =>
      _$RmaItemFromJson(json);

  Map<String, dynamic> toJson() => _$RmaItemToJson(this);
}

@JsonSerializable()
class OrderData {
  @JsonKey(name: "id")
  CommonIdAndIota id;
  @JsonKey(name: "href")
  String href;

  OrderData({
    required this.id,
    required this.href,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}


@JsonSerializable()
class AllOrders {
  @JsonKey(name: "items")
  List<OrderItem> items;

  AllOrders({
    required this.items,
  });

  factory AllOrders.fromJson(Map<String, dynamic> json) =>
      _$AllOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$AllOrdersToJson(this);
}


@JsonSerializable()
class AllRma {
  @JsonKey(name: "items")
  List<RmaItem> items;

  AllRma({
    required this.items,
  });

  factory AllRma.fromJson(Map<String, dynamic> json) =>
      _$AllRmaFromJson(json);

  Map<String, dynamic> toJson() => _$AllRmaToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: "creator")
  CommonHumanNameObject creator;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "customer")
  CustomerDetails customer;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "id")
  CommonIdAndIota id;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "shipToName")
  CommonShipToNameFull shipToName;
  @JsonKey(name: "source")
  Map<String, dynamic> source;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "paymentStatus")
  String paymentStatus;
  @JsonKey(name: "href")
  String href;

  OrderItem({
    required this.creator,
    required this.currency,
    required this.customer,
    required this.dateCreated,
    required this.id,
    required this.terms,
    required this.shipToName,
    required this.source,
    required this.type,
    required this.paymentStatus,
    required this.href,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class CustomerDetails {
  @JsonKey(name: "id")
  CommonIdTypeString id;
  @JsonKey(name: "humanName")
  CompleteHumanThName humanName;
  @JsonKey(name: "href")
  String href;

  CustomerDetails({
    required this.id,
    required this.humanName,
    required this.href,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "pv")
  int pv;

  Terms({
    required this.total,
    required this.pv,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
