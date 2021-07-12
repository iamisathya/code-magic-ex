
import 'package:json_annotation/json_annotation.dart';

part 'amphur_item.g.dart';

@JsonSerializable()
class DisctrictItem {
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

  DisctrictItem({
    required this.amphurCode,
    required this.amphurId,
    required this.amphurName,
    required this.amphurNameEn,
    required this.gioId,
    required this.provinceId,
  });
  
  factory DisctrictItem.fromJson(Map<String, dynamic> json) => _$DisctrictItemFromJson(json);

  Map<String, dynamic> toJson() => _$DisctrictItemToJson(this);
}
