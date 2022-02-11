import 'package:json_annotation/json_annotation.dart';

part 'guest_info_error.g.dart';

@JsonSerializable()
class ErrorMap {
  @JsonKey(name: "error")
  ErrorObject error;

  ErrorMap({
    required this.error,
  });

  factory ErrorMap.fromJson(Map<String, dynamic> json) =>
      _$ErrorMapFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMapToJson(this);
}

@JsonSerializable()
class ErrorObject {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error_code")
  String errorCode;
  @JsonKey(name: "error_message")
  String errorMessage;

  ErrorObject({
    required this.code,
    required this.message,
    required this.errorCode,
    required this.errorMessage,
  });

  factory ErrorObject.fromJson(Map<String, dynamic> json) =>
      _$ErrorObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorObjectToJson(this);
}
