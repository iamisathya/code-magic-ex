import 'package:json_annotation/json_annotation.dart';

part 'zip_code_response.g.dart';

@JsonSerializable()
class ZipCodeResponse {
  @JsonKey(name: "district_code")
  String districtCode;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "zipcode")
  String zipCode;

  ZipCodeResponse({
    required this.districtCode,
    required this.id,
    required this.zipCode,
  });

  factory ZipCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ZipCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ZipCodeResponseToJson(this);

  Map<String, dynamic> toMap() =>
      {'districtCode': districtCode, 'id': id, 'zipCode': zipCode};
}
