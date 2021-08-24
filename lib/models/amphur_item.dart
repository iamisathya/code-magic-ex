import 'package:json_annotation/json_annotation.dart';

part 'amphur_item.g.dart';

@JsonSerializable()
class AmphurItem {
  @JsonKey(name: "AMPHUR_CODE")
  String amphurCode;
  @JsonKey(name: "AMPHUR_ID")
  String amphurId;
  @JsonKey(name: "AMPHUR_NAME")
  String amphurName;
  @JsonKey(name: "AMPHUR_NAME_ENG")
  String amphurNameEn;
  @JsonKey(name: "GEO_ID")
  String gioId;
  @JsonKey(name: "PROVINCE_ID")
  String provinceId;

  AmphurItem({
    required this.amphurCode,
    required this.amphurId,
    required this.amphurName,
    required this.amphurNameEn,
    required this.gioId,
    required this.provinceId,
  });

  factory AmphurItem.fromJson(Map<String, dynamic> json) =>
      _$AmphurItemFromJson(json);

  Map<String, dynamic> toJson() => _$AmphurItemToJson(this);
}
