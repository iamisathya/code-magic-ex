import 'package:json_annotation/json_annotation.dart';

part 'guest_info_error.g.dart';

@JsonSerializable()
class GuestInfoError {
  @JsonKey(name: "error")
  ErrorObject error;

  GuestInfoError({
    required this.error,
  });

  factory GuestInfoError.fromJson(Map<String, dynamic> json) =>
      _$GuestInfoErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GuestInfoErrorToJson(this);
}

@JsonSerializable()
class ErrorObject {
  @JsonKey(name: "code")
  String code;
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
