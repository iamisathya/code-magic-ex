// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllMarkets _$AllMarketsFromJson(Map<String, dynamic> json) {
  return AllMarkets(
    markets: (json['markets'] as List<dynamic>)
        .map((e) => Markets.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllMarketsToJson(AllMarkets instance) =>
    <String, dynamic>{
      'markets': instance.markets,
    };

Markets _$MarketsFromJson(Map<String, dynamic> json) {
  return Markets(
    name: json['name'] as String,
    languages: (json['languages'] as List<dynamic>)
        .map((e) => Languages.fromJson(e as Map<String, dynamic>))
        .toList(),
    languageIso:
        (json['languageISO'] as List<dynamic>).map((e) => e as String).toList(),
    code: json['code'] as String,
    isoCode: json['isoCode'] as String,
    defaultLanguage: json['defaultLanguage'] as String,
    currencyCode: json['currencyCode'] as String,
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$MarketsToJson(Markets instance) => <String, dynamic>{
      'name': instance.name,
      'languages': instance.languages,
      'languageISO': instance.languageIso,
      'code': instance.code,
      'isoCode': instance.isoCode,
      'defaultLanguage': instance.defaultLanguage,
      'currency': instance.currency,
      'currencyCode': instance.currencyCode,
    };

Languages _$LanguagesFromJson(Map<String, dynamic> json) {
  return Languages(
    value: json['value'] as String,
    title: json['title'] as String,
    transText: json['transText'] as String,
    countryName: json['countryName'] as String,
    iso: json['iso'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'value': instance.value,
      'iso': instance.iso,
      'title': instance.title,
      'transText': instance.transText,
      'countryName': instance.countryName,
      'icon': instance.icon,
    };
