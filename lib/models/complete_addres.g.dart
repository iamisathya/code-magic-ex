// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_addres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteAddressResponse _$CompleteAddressResponseFromJson(
    Map<String, dynamic> json) {
  return CompleteAddressResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => CompleteAddress.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$CompleteAddressResponseToJson(
        CompleteAddressResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

CompleteAddress _$CompleteAddressFromJson(Map<String, dynamic> json) {
  return CompleteAddress(
    cityNative: json['city_native'] as String,
    cityRoman: json['city_roman'] as String,
    countryCode: json['country_code'] as String,
    id: json['id'] as int,
    priority: json['priority'] as String?,
    returnAddressNative: json['return_address_native'] as String,
    returnAddressRoman: json['return_address_roman'] as String,
    searchAddressNative: json['search_address_native'] as String,
    searchAddressRoman: json['search_address_roman'] as String,
    sub1Native: json['sub1_native'] as String,
    sub1Roman: json['sub1_roman'] as String,
    sub2Native: json['sub2_native'] as String,
    sub2Roman: json['sub2_roman'] as String,
    sub3Native: json['sub3_native'] as String,
    sub3Roman: json['sub3_roman'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$CompleteAddressToJson(CompleteAddress instance) =>
    <String, dynamic>{
      'city_native': instance.cityNative,
      'city_roman': instance.cityRoman,
      'country_code': instance.countryCode,
      'id': instance.id,
      'priority': instance.priority,
      'return_address_native': instance.returnAddressNative,
      'return_address_roman': instance.returnAddressRoman,
      'search_address_native': instance.searchAddressNative,
      'search_address_roman': instance.searchAddressRoman,
      'sub1_native': instance.sub1Native,
      'sub1_roman': instance.sub1Roman,
      'sub2_native': instance.sub2Native,
      'sub2_roman': instance.sub2Roman,
      'sub3_native': instance.sub3Native,
      'sub3_roman': instance.sub3Roman,
      'zip': instance.zip,
    };
