import 'package:json_annotation/json_annotation.dart';

part 'provience_item.g.dart';

@JsonSerializable()
class ProvinceItem {
  @JsonKey(name: "0")
  String proId;
  @JsonKey(name: "PROVINCE_ID")
  String provienceId;

  @JsonKey(name: "1")
  String proCode;
  @JsonKey(name: "PROVINCE_CODE")
  String provienceCode;

  @JsonKey(name: "2")
  String proName;
  @JsonKey(name: "PROVINCE_NAME")
  String provienceName;

  @JsonKey(name: "3")
  String proNameEn;
  @JsonKey(name: "PROVINCE_NAME_ENG")
  String provienceNameEn;

  @JsonKey(name: "4")
  String gId;
  @JsonKey(name: "GEO_ID")
  String geoId;

  ProvinceItem({
    required this.proId,
    required this.provienceId,
    required this.proCode,
    required this.provienceCode,
    required this.proName,
    required this.provienceName,
    required this.proNameEn,
    required this.provienceNameEn,
    required this.gId,
    required this.geoId,
  });

  factory ProvinceItem.fromJson(Map<String, dynamic> json) =>
      _$ProvinceItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceItemToJson(this);
}
