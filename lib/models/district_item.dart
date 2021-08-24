
import 'package:json_annotation/json_annotation.dart';

part 'district_item.g.dart';

@JsonSerializable()
class DisctrictItem {
  @JsonKey(name: "AMPHUR_ID")
  String amphurId;
  @JsonKey(name: "DISTRICT_CODE")
  String districtCode;
  @JsonKey(name: "DISTRICT_ID")
  String districtId;
  @JsonKey(name: "DISTRICT_NAME")
  String districtName;
  @JsonKey(name: "DISTRICT_NAME_ENG")
  String districtNameEn;
  @JsonKey(name: "GEO_ID")
  String geoId;
  @JsonKey(name: "PROVINCE_ID")
  String provinceId;

  DisctrictItem({
    required this.amphurId,
    required this.districtCode,
    required this.districtId,
    required this.districtName,
    required this.districtNameEn,
    required this.geoId,
    required this.provinceId,
  });


  factory DisctrictItem.fromJson(Map<String, dynamic> json) => _$DisctrictItemFromJson(json);

  Map<String, dynamic> toJson() => _$DisctrictItemToJson(this);
}
