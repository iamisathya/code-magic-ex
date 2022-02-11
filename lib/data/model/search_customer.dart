import 'package:json_annotation/json_annotation.dart';

part 'search_customer.g.dart';

@JsonSerializable()
class SearchCustomer {
  @JsonKey(name: "items")
  List<Customer> items;

  SearchCustomer({required this.items});

  factory SearchCustomer.fromJson(Map<String, dynamic> json) =>
      _$SearchCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCustomerToJson(this);

  Map<String, dynamic> toMap() => {
        'items': items,
      };
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
