import 'package:json_annotation/json_annotation.dart';

import 'common_methods.dart';

part 'order_list_rmas.g.dart';

@JsonSerializable()
class OrdersAndRmas {
  @JsonKey(name: "orders")
  final List<AllOrders> orders;
  @JsonKey(name: "rmas")
  final List<AllRma> rmas;

  const OrdersAndRmas({
    this.orders = const <AllOrders>[],
    this.rmas = const <AllRma>[],
  });

  factory OrdersAndRmas.fromJson(Map<String, dynamic> json) =>
      _$OrdersAndRmasFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersAndRmasToJson(this);
}

@JsonSerializable()
class RmaItem {
  @JsonKey(name: "creator")
  final CommonHumanNameObject creator;
  @JsonKey(name: "customer")
  final CustomerDetails customer;
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "order")
  final OrderData order;
  @JsonKey(name: "terms")
  final Terms terms;
  @JsonKey(name: "dateCreated")
  final String dateCreated;
  @JsonKey(name: "id")
  final CommonIdAndIota id;
  @JsonKey(name: "shipToName")
  final CommonShipToNameFull shipToName;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "href")
  final String href;

  const RmaItem({
    this.creator = const CommonHumanNameObject(),
    this.customer = const CustomerDetails(),
    this.currency = "",
    this.order = const OrderData(),
    this.terms = const Terms(),
    this.dateCreated = "",
    this.id = const CommonIdAndIota(),
    this.shipToName = const CommonShipToNameFull(),
    this.type = "",
    this.href = "",
  });

  factory RmaItem.fromJson(Map<String, dynamic> json) =>
      _$RmaItemFromJson(json);

  Map<String, dynamic> toJson() => _$RmaItemToJson(this);
}

@JsonSerializable()
class OrderData {
  @JsonKey(name: "id")
  final CommonIdAndIota id;
  @JsonKey(name: "href")
  final String href;

  const OrderData({
    this.id = const CommonIdAndIota(),
    this.href = "",
  });

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

@JsonSerializable()
class AllOrders {
  @JsonKey(name: "items")
  final List<OrderItem> items;

  const AllOrders({
    this.items = const <OrderItem>[],
  });

  factory AllOrders.fromJson(Map<String, dynamic> json) =>
      _$AllOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$AllOrdersToJson(this);
}

@JsonSerializable()
class AllRma {
  @JsonKey(name: "items")
  final List<RmaItem> items;

  const AllRma({
    this.items = const <RmaItem>[],
  });

  factory AllRma.fromJson(Map<String, dynamic> json) => _$AllRmaFromJson(json);

  Map<String, dynamic> toJson() => _$AllRmaToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: "creator")
  final CommonHumanNameObject creator;
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "customer")
  final CustomerDetails customer;
  @JsonKey(name: "dateCreated")
  final String dateCreated;
  @JsonKey(name: "id")
  final CommonIdAndIota id;
  @JsonKey(name: "terms")
  final Terms terms;
  @JsonKey(name: "shipToName")
  final CommonShipToNameFull shipToName;
  @JsonKey(name: "source")
  final Map<String, dynamic> source;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "paymentStatus")
  final String paymentStatus;
  @JsonKey(name: "href")
  final String href;

  const OrderItem({
    this.creator = const CommonHumanNameObject(),
    this.currency = "",
    this.customer = const CustomerDetails(),
    this.dateCreated = "",
    this.id = const CommonIdAndIota(),
    this.terms = const Terms(),
    this.shipToName = const CommonShipToNameFull(),
    this.source = const <String, dynamic>{},
    this.type = "",
    this.paymentStatus = "",
    this.href = "",
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class CustomerDetails {
  @JsonKey(name: "id")
  final CommonIdTypeString id;
  @JsonKey(name: "humanName")
  final CompleteHumanThName humanName;
  @JsonKey(name: "href")
  final String href;

  const CustomerDetails({
    this.id = const CommonIdTypeString(),
    this.humanName = const CompleteHumanThName(),
    this.href = "",
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "total")
  final double total;
  @JsonKey(name: "pv")
  final int pv;

  const Terms({
    this.total = 0.0,
    this.pv = 0,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
