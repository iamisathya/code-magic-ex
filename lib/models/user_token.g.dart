// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerToken _$CustomerTokenFromJson(Map<String, dynamic> json) {
  return CustomerToken(
    customer: CustomerHref.fromJson(json['customer'] as Map<String, dynamic>),
    href: json['href'] as String,
    token: json['token'] as String,
    whoami: WhoMeHref.fromJson(json['whoami'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerTokenToJson(CustomerToken instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'href': instance.href,
      'token': instance.token,
      'whoami': instance.whoami,
    };

CustomerHref _$CustomerHrefFromJson(Map<String, dynamic> json) {
  return CustomerHref(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerHrefToJson(CustomerHref instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

WhoMeHref _$WhoMeHrefFromJson(Map<String, dynamic> json) {
  return WhoMeHref(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$WhoMeHrefToJson(WhoMeHref instance) => <String, dynamic>{
      'href': instance.href,
    };
