import 'package:json_annotation/json_annotation.dart';

part 'country_details.g.dart';

@JsonSerializable()
class CountryDetails {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "alpha3Code")
  String? alpha3Code;
  @JsonKey(name: "capital")
  String? capital;
  @JsonKey(name: "region")
  String? region;
  @JsonKey(name: "currency")
  Currency? currency;
  @JsonKey(name: "language")
  Language? language;
  @JsonKey(name: "flag")
  String? flag;
  @JsonKey(name: "dialling_code")
  String? diallingCode;

  CountryDetails(
      {this.name,
      this.code,
      this.alpha3Code,
      this.capital,
      this.region,
      this.currency,
      this.language,
      this.flag,
      this.diallingCode});

  factory CountryDetails.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDetailsToJson(this);
}

@JsonSerializable()
class Currency {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "symbol")
  String? symbol;

  Currency({this.code, this.name, this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}

@JsonSerializable()
class Language {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;

  Language({this.code, this.name});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
