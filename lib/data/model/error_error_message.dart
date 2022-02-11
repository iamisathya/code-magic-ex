import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_error_message.g.dart';

@JsonSerializable()
class ErrorMessage {
  @JsonKey(name: "error")
  ErrorObject error;

  ErrorMessage({required this.error});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);
}

@JsonSerializable()
class ErrorObject {
  @JsonKey(name: "error_message")
  String? errorMessage;
  @JsonKey(name: "error")
  String? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "code")
  int? code;

  ErrorObject(
      {this.errorMessage = "",
      this.error = "",
      this.message = "",
      this.code = 0});

  factory ErrorObject.fromJson(Map<String, dynamic> json) =>
      _$ErrorObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorObjectToJson(this);
}
