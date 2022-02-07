import 'package:json_annotation/json_annotation.dart';

part 'request_get_user_info.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchuserInfo {
  @JsonKey(name: 'namespace')
  String namespace;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  String value;

  SearchuserInfo(
      {required this.namespace, required this.type, required this.value});

  factory SearchuserInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchuserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchuserInfoToJson(this);
}
