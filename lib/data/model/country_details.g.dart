// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDetails _$CountryDetailsFromJson(Map<String, dynamic> json) =>
    CountryDetails(
      name: json['name'] as String?,
      code: json['code'] as String?,
      alpha3Code: json['alpha3Code'] as String?,
      capital: json['capital'] as String?,
      region: json['region'] as String?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      flag: json['flag'] as String?,
      diallingCode: json['dialling_code'] as String?,
    );

Map<String, dynamic> _$CountryDetailsToJson(CountryDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'alpha3Code': instance.alpha3Code,
      'capital': instance.capital,
      'region': instance.region,
      'currency': instance.currency,
      'language': instance.language,
      'flag': instance.flag,
      'dialling_code': instance.diallingCode,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      code: json['code'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
