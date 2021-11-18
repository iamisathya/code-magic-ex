import 'package:json_annotation/json_annotation.dart';

part 'enrolment_payment_methods.g.dart';

@JsonSerializable(anyMap: true)
class EnrolmentPaymentMethods {
  List<Markets> markets;

  EnrolmentPaymentMethods({required this.markets});

  factory EnrolmentPaymentMethods.fromJson(Map<String, dynamic> json) =>
      _$EnrolmentPaymentMethodsFromJson(json);

  Map<String, dynamic> toJson() => _$EnrolmentPaymentMethodsToJson(this);
}

@JsonSerializable(anyMap: true)
class Markets {
  String countryCode;
	List<PaymentModes> paymentModes;

  Markets({required this.countryCode, required this.paymentModes});

  factory Markets.fromJson(Map<String, dynamic> json) =>
      _$MarketsFromJson(json);

  Map<String, dynamic> toJson() => _$MarketsToJson(this);
}

@JsonSerializable(anyMap: true)
class PaymentModes {
  String id;
  String name;
  bool status;
  List<NameValuePairs>? details;

  PaymentModes(
      {required this.id,
      required this.name,
      required this.status,
      this.details});

  factory PaymentModes.fromJson(Map<String, dynamic> json) =>
      _$PaymentModesFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModesToJson(this);
}

@JsonSerializable(anyMap: true)
class NameValuePairs {
  String? name;
  String? value;

  NameValuePairs({this.name = "", this.value = ""});

  factory NameValuePairs.fromJson(Map<String, dynamic> json) =>
      _$NameValuePairsFromJson(json);

  Map<String, dynamic> toJson() => _$NameValuePairsToJson(this);
}
