import 'package:json_annotation/json_annotation.dart';

part 'country_info.g.dart';

@JsonSerializable()
class AllMarkets {
  @JsonKey(name: "markets")
  List<Markets> markets;

  AllMarkets({required this.markets});

  factory AllMarkets.fromJson(Map<String, dynamic> json) =>
      _$AllMarketsFromJson(json);

  Map<String, dynamic> toJson() => _$AllMarketsToJson(this);
}

@JsonSerializable()
class Markets {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "languages")
  List<Languages> languages;
  @JsonKey(name: "languageISO")
  List<String> languageIso;
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "isoCode")
  String isoCode;
  @JsonKey(name: "defaultLanguage")
  String defaultLanguage;
  @JsonKey(name: "currency")
  String currency;

  Markets(
      {required this.name,
      required this.languages,
      required this.languageIso,
      required this.code,
      required this.isoCode,
      required this.defaultLanguage,
      required this.currency});

  factory Markets.fromJson(Map<String, dynamic> json) =>
      _$MarketsFromJson(json);

  Map<String, dynamic> toJson() => _$MarketsToJson(this);
}

@JsonSerializable()
class Languages {
  @JsonKey(name: "value")
  String value;
  @JsonKey(name: "iso")
  String iso;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "transText")
  String transText;
  @JsonKey(name: "countryName")
  String countryName;
  @JsonKey(name: "icon")
  String icon;

  Languages(
      {required this.value,
      required this.title,
      required this.transText,
      required this.countryName,
      required this.iso,
      required this.icon});

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
