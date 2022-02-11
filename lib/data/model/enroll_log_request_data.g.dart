// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_log_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollLogRequestData _$EnrollLogRequestDataFromJson(
        Map<String, dynamic> json) =>
    EnrollLogRequestData(
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      lines: ProductLines.fromJson(json['lines'] as Map<String, dynamic>),
      shipToName:
          ShipToName.fromJson(json['shipToName'] as Map<String, dynamic>),
      shipToPhone: json['shipToPhone'] as String,
      shipToEmail: json['shipToEmail'] as String,
      shipToAddress: UserShipToAddress.fromJson(
          json['shipToAddress'] as Map<String, dynamic>),
      shippingMethod:
          CustomerHref.fromJson(json['shippingMethod'] as Map<String, dynamic>),
      notes: json['notes'] as String,
      terms: ProductTerms.fromJson(json['terms'] as Map<String, dynamic>),
      transactions:
          Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnrollLogRequestDataToJson(
        EnrollLogRequestData instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'lines': instance.lines,
      'shipToName': instance.shipToName,
      'shipToPhone': instance.shipToPhone,
      'shipToEmail': instance.shipToEmail,
      'notes': instance.notes,
      'shipToAddress': instance.shipToAddress,
      'transactions': instance.transactions,
      'shippingMethod': instance.shippingMethod,
      'terms': instance.terms,
      'source': instance.source,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      mainAddress:
          MainAddress.fromJson(json['mainAddress'] as Map<String, dynamic>),
      humanName: HumanName.fromJson(json['humanName'] as Map<String, dynamic>),
      enroller: CustomerHref.fromJson(json['enroller'] as Map<String, dynamic>),
      sponsor: CustomerHref.fromJson(json['sponsor'] as Map<String, dynamic>),
      birthDate: json['birthDate'] as String,
      maritalStatus: json['maritalStatus'] as String,
      email: json['email'] as String,
      taxTerms: TaxTerms.fromJson(json['taxTerms'] as Map<String, dynamic>),
      homePhone: json['homePhone'] as String,
      mobilePhone: json['mobilePhone'] as String,
      entryPeriod: json['entryPeriod'] as String,
      gender: json['gender'] as String,
      password: Password.fromJson(json['password'] as Map<String, dynamic>),
      type: json['type'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'mainAddress': instance.mainAddress,
      'humanName': instance.humanName,
      'enroller': instance.enroller,
      'sponsor': instance.sponsor,
      'birthDate': instance.birthDate,
      'maritalStatus': instance.maritalStatus,
      'email': instance.email,
      'taxTerms': instance.taxTerms,
      'homePhone': instance.homePhone,
      'mobilePhone': instance.mobilePhone,
      'entryPeriod': instance.entryPeriod,
      'gender': instance.gender,
      'password': instance.password,
      'type': instance.type,
      'source': instance.source,
    };

MainAddress _$MainAddressFromJson(Map<String, dynamic> json) => MainAddress(
      city: json['city'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      zip: json['zip'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
    );

Map<String, dynamic> _$MainAddressToJson(MainAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'zip': instance.zip,
      'address1': instance.address1,
      'address2': instance.address2,
    };

HumanName _$HumanNameFromJson(Map<String, dynamic> json) => HumanName(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      firstNameTh: json['firstName@th'] as String,
      lastNameTh: json['lastName@th'] as String?,
    );

Map<String, dynamic> _$HumanNameToJson(HumanName instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'firstName@th': instance.firstNameTh,
      'lastName@th': instance.lastNameTh,
    };

CustomerHref _$CustomerHrefFromJson(Map<String, dynamic> json) => CustomerHref(
      href: json['href'] as String,
    );

Map<String, dynamic> _$CustomerHrefToJson(CustomerHref instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

TaxTerms _$TaxTermsFromJson(Map<String, dynamic> json) => TaxTerms(
      taxId: json['taxId'] as String,
    );

Map<String, dynamic> _$TaxTermsToJson(TaxTerms instance) => <String, dynamic>{
      'taxId': instance.taxId,
    };

Password _$PasswordFromJson(Map<String, dynamic> json) => Password(
      value: json['value'] as String,
    );

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
      'value': instance.value,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      agent: json['agent'] as String,
      campaign: json['campaign'],
      medium: json['medium'] as String,
      platform: json['platform'] as String,
      referrer: json['referrer'],
      version: json['version'],
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'agent': instance.agent,
      'campaign': instance.campaign,
      'medium': instance.medium,
      'platform': instance.platform,
      'referrer': instance.referrer,
      'version': instance.version,
    };

ProductLines _$ProductLinesFromJson(Map<String, dynamic> json) => ProductLines(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductLineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductLinesToJson(ProductLines instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

ProductLineItem _$ProductLineItemFromJson(Map<String, dynamic> json) =>
    ProductLineItem(
      item: CustomerHref.fromJson(json['item'] as Map<String, dynamic>),
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$ProductLineItemToJson(ProductLineItem instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'quantity': instance.quantity,
    };

ShipToName _$ShipToNameFromJson(Map<String, dynamic> json) => ShipToName(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ShipToNameToJson(ShipToName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

UserShipToAddress _$UserShipToAddressFromJson(Map<String, dynamic> json) =>
    UserShipToAddress(
      city: json['city'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      zip: json['zip'] as String,
    );

Map<String, dynamic> _$UserShipToAddressToJson(UserShipToAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'address1': instance.address1,
      'address2': instance.address2,
      'zip': instance.zip,
    };

ProductTerms _$ProductTermsFromJson(Map<String, dynamic> json) => ProductTerms(
      period: json['period'] as String,
    );

Map<String, dynamic> _$ProductTermsToJson(ProductTerms instance) =>
    <String, dynamic>{
      'period': instance.period,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      items: (json['items'] as List<dynamic>)
          .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    TransactionItem(
      amount: json['amount'] as String,
      type: json['type'] as String,
      method: json['method'] as String,
    );

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
      'method': instance.method,
    };
