// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerToken _$CustomerTokenFromJson(Map<String, dynamic> json) {
  return CustomerToken();
}

Map<String, dynamic> _$CustomerTokenToJson(CustomerToken instance) =>
    <String, dynamic>{};

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
