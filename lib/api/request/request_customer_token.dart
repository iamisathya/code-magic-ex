import 'package:json_annotation/json_annotation.dart';
part 'request_customer_token.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestPostCustomerToken {
  @JsonKey(name: 'namespace')
  String namespace;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  String value;

  RequestPostCustomerToken(
      {required this.namespace, required this.type, required this.value});

  factory RequestPostCustomerToken.fromJson(Map<String, dynamic> json) =>
      _$RequestPostCustomerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostCustomerTokenToJson(this);
}
