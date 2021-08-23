import 'package:json_annotation/json_annotation.dart';

part 'country_info.g.dart';

@JsonSerializable()
class AllMarkets {
  @JsonKey(name: "markets")
   List<Markets> markets;
  
  AllMarkets({ required this.markets});

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

  Markets(
      {required this.name,
      required this.languages,
      required this.languageIso,
      required this.code,
      required this.isoCode,
      required this.defaultLanguage});

  factory Markets.fromJson(Map<String, dynamic> json) =>
      _$MarketsFromJson(json);

  Map<String, dynamic> toJson() => _$MarketsToJson(this);
}

@JsonSerializable()
class Languages {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "transText")
  String transText;
  @JsonKey(name: "countryName")
  String countryName;

  Languages(
      {required this.code,
      required this.name,
      required this.transText,
      required this.countryName});

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
