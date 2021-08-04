// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_log_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseLogRequestData _$PurchaseLogRequestDataFromJson(
    Map<String, dynamic> json) {
  return PurchaseLogRequestData(
    customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    lines: ProductLines.fromJson(json['lines'] as Map<String, dynamic>),
    shipToName: ShipToName.fromJson(json['shipToName'] as Map<String, dynamic>),
    shipToPhone: json['shipToPhone'] as String,
    shipToEmail: json['shipToEmail'] as String,
    shipToAddress: UserShipToAddress.fromJson(
        json['shipToAddress'] as Map<String, dynamic>),
    shippingMethod:
        Customer.fromJson(json['shippingMethod'] as Map<String, dynamic>),
    notes: json['notes'] as String,
    terms: ProductTerms.fromJson(json['terms'] as Map<String, dynamic>),
    transactions:
        Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PurchaseLogRequestDataToJson(
        PurchaseLogRequestData instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'lines': instance.lines,
      'shipToName': instance.shipToName,
      'shipToPhone': instance.shipToPhone,
      'shipToEmail': instance.shipToEmail,
      'shipToAddress': instance.shipToAddress,
      'shippingMethod': instance.shippingMethod,
      'notes': instance.notes,
      'terms': instance.terms,
      'transactions': instance.transactions,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'href': instance.href,
    };

ProductLines _$ProductLinesFromJson(Map<String, dynamic> json) {
  return ProductLines(
    items: (json['items'] as List<dynamic>)
        .map((e) => ProductLineItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductLinesToJson(ProductLines instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

ProductLineItem _$ProductLineItemFromJson(Map<String, dynamic> json) {
  return ProductLineItem(
    item: Customer.fromJson(json['item'] as Map<String, dynamic>),
    quantity: json['quantity'] as String,
  );
}

Map<String, dynamic> _$ProductLineItemToJson(ProductLineItem instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'quantity': instance.quantity,
    };

ShipToName _$ShipToNameFromJson(Map<String, dynamic> json) {
  return ShipToName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  );
}

Map<String, dynamic> _$ShipToNameToJson(ShipToName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

UserShipToAddress _$UserShipToAddressFromJson(Map<String, dynamic> json) {
  return UserShipToAddress(
    city: json['city'] as String,
    country: json['country'] as String,
    state: json['state'] as String,
    address1: json['address1'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$UserShipToAddressToJson(UserShipToAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'address1': instance.address1,
      'zip': instance.zip,
    };

ProductTerms _$ProductTermsFromJson(Map<String, dynamic> json) {
  return ProductTerms(
    period: json['period'] as String,
  );
}

Map<String, dynamic> _$ProductTermsToJson(ProductTerms instance) =>
    <String, dynamic>{
      'period': instance.period,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return Transactions(
    items: (json['items'] as List<dynamic>)
        .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) {
  return TransactionItem(
    amount: json['amount'] as String,
    type: json['type'] as String,
    method: json['method'] as String,
  );
}

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
      'method': instance.method,
    };
