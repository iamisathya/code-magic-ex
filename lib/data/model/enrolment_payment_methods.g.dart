// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolment_payment_methods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolmentPaymentMethods _$EnrolmentPaymentMethodsFromJson(Map json) =>
    EnrolmentPaymentMethods(
      markets: (json['markets'] as List<dynamic>)
          .map((e) => Markets.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$EnrolmentPaymentMethodsToJson(
        EnrolmentPaymentMethods instance) =>
    <String, dynamic>{
      'markets': instance.markets,
    };

Markets _$MarketsFromJson(Map json) => Markets(
      countryCode: json['countryCode'] as String,
      paymentModes: (json['paymentModes'] as List<dynamic>)
          .map(
              (e) => PaymentModes.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$MarketsToJson(Markets instance) => <String, dynamic>{
      'countryCode': instance.countryCode,
      'paymentModes': instance.paymentModes,
    };

PaymentModes _$PaymentModesFromJson(Map json) => PaymentModes(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as bool,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              NameValuePairs.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$PaymentModesToJson(PaymentModes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'details': instance.details,
    };

NameValuePairs _$NameValuePairsFromJson(Map json) => NameValuePairs(
      name: json['name'] as String? ?? "",
      value: json['value'] as String? ?? "",
    );

Map<String, dynamic> _$NameValuePairsToJson(NameValuePairs instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
