import 'package:json_annotation/json_annotation.dart';

part 'complete_addres.g.dart';

@JsonSerializable()
class CompleteAddressResponse {
  @JsonKey(name: "data")
  List<CompleteAddress>? data;
  @JsonKey(name: "success")
  bool? success;

  CompleteAddressResponse({this.data, this.success});

  factory CompleteAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteAddressResponseToJson(this);
}

@JsonSerializable()
class CompleteAddress {
  @JsonKey(name: "city_native")
  String cityNative;
  @JsonKey(name: "city_roman")
  String cityRoman;
  @JsonKey(name: "country_code")
  String countryCode;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "priority")
  String? priority;
  @JsonKey(name: "return_address_native")
  String returnAddressNative;
  @JsonKey(name: "return_address_roman")
  String returnAddressRoman;
  @JsonKey(name: "search_address_native")
  String searchAddressNative;
  @JsonKey(name: "search_address_roman")
  String searchAddressRoman;
  @JsonKey(name: "sub1_native")
  String sub1Native;
  @JsonKey(name: "sub1_roman")
  String sub1Roman;
  @JsonKey(name: "sub2_native")
  String sub2Native;
  @JsonKey(name: "sub2_roman")
  String sub2Roman;
  @JsonKey(name: "sub3_native")
  String sub3Native;
  @JsonKey(name: "sub3_roman")
  String sub3Roman;
  @JsonKey(name: "zip")
  String zip;

  CompleteAddress({
    required this.cityNative,
    required this.cityRoman,
    required this.countryCode,
    required this.id,
    required this.priority,
    required this.returnAddressNative,
    required this.returnAddressRoman,
    required this.searchAddressNative,
    required this.searchAddressRoman,
    required this.sub1Native,
    required this.sub1Roman,
    required this.sub2Native,
    required this.sub2Roman,
    required this.sub3Native,
    required this.sub3Roman,
    required this.zip,
  });

  factory CompleteAddress.fromJson(Map<String, dynamic> json) =>
      _$CompleteAddressFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteAddressToJson(this);
}
