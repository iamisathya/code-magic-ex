// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCustomer _$SearchCustomerFromJson(Map<String, dynamic> json) {
  return SearchCustomer(
    items: (json['items'] as List<dynamic>)
        .map((e) => Customer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SearchCustomerToJson(SearchCustomer instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'href': instance.href,
    };
