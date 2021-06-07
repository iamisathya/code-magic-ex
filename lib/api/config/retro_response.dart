import 'package:json_annotation/json_annotation.dart';

part 'retro_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RetroResponse {
  @JsonKey(name: 'code')
  int code;

  RetroResponse({required this.code});

  factory RetroResponse.fromJson(Map<String, dynamic> json) =>
      _$RetroResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RetroResponseToJson(this);
}
