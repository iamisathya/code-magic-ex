// {"customer":{"href":"https://hydra.unicity.net/v5a/customers?unicity=2970466"},"lines":{"items":[{"item":{"href":"https://hydra.unicity.net/v5a/items?id.unicity=17532"},"quantity":"1"}]},"shipToName":{"firstName":"Ushop Training","lastName":""},"shipToPhone":"1","shipToEmail":"none@unicity.com","shipToAddress":{"city":"Bangkok","country":"TH","state":"","address1":"202, Rachadaphisek Road Huaykwang","zip":"10320"},"shippingMethod":{"href":"https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"},"notes":"shopping|dsc|pc web|tha||2970466|","terms":{"period":"2021-08"},"transactions":{"items":[{"amount":6000,"type":"record","method":"Cash"}]}}

import 'package:json_annotation/json_annotation.dart';

part 'purchase_log_request_data.g.dart';

@JsonSerializable()
class PurchaseLogRequestData {
  @JsonKey(name: "customer")
  Customer customer;
  @JsonKey(name: "lines")
  ProductLines lines;
  @JsonKey(name: 'shipToName')
  ShipToName shipToName;
  @JsonKey(name: 'shipToPhone')
  String shipToPhone;
  @JsonKey(name: 'shipToEmail')
  String shipToEmail;
  @JsonKey(name: 'shipToAddress')
  UserShipToAddress shipToAddress;
  @JsonKey(name: 'shippingMethod')
  Customer shippingMethod;
  @JsonKey(name: 'notes')
  String notes;
  @JsonKey(name: 'terms')
  ProductTerms terms;
  @JsonKey(name: 'transactions')
  Transactions transactions;

  PurchaseLogRequestData(
      {required this.customer,
      required this.lines,
      required this.shipToName,
      required this.shipToPhone,
      required this.shipToEmail,
      required this.shipToAddress,
      required this.shippingMethod,
      required this.notes,
      required this.terms,
      required this.transactions});

  Map<String, dynamic> toMap() => {
        'customer': customer,
        'lines': lines,
        'shipToName': shipToName,
        'shipToPhone': shipToPhone,
        'shipToEmail': shipToEmail,
        'shipToAddress': shipToAddress,
        'shippingMethod': shippingMethod,
        'notes': notes,
        'terms': terms,
        'transactions': transactions,
      };

  factory PurchaseLogRequestData.fromJson(Map<String, dynamic> json) =>
      _$PurchaseLogRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseLogRequestDataToJson(this);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: "href")
  String href;

  Customer({required this.href});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductLines {
  @JsonKey(name: 'items')
  List<ProductLineItem> items;

  ProductLines({required this.items});

  factory ProductLines.fromJson(Map<String, dynamic> json) =>
      _$ProductLinesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLinesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductLineItem {
  @JsonKey(name: 'item')
  Customer item;
  @JsonKey(name: 'quantity')
  String quantity;

  ProductLineItem({required this.item, required this.quantity});

  factory ProductLineItem.fromJson(Map<String, dynamic> json) =>
      _$ProductLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipToName {
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;

  ShipToName({required this.firstName, required this.lastName});

  factory ShipToName.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipToAddress {
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'address1')
  String address1;
  @JsonKey(name: 'zip')
  String zip;

  UserShipToAddress(
      {required this.city,
      required this.country,
      required this.state,
      required this.address1,
      required this.zip});

  factory UserShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$UserShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserShipToAddressToJson(this);
}

@JsonSerializable()
class ProductTerms {
  @JsonKey(name: 'period')
  String period;

  ProductTerms({
    required this.period,
  });

  factory ProductTerms.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTermsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Transactions {
  @JsonKey(name: 'items')
  List<TransactionItem> items;

  Transactions({required this.items});

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TransactionItem {
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'method')
  String method;

  TransactionItem(
      {required this.amount, required this.type, required this.method});

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}
