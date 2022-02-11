import 'package:json_annotation/json_annotation.dart';

import 'common_methods.dart';

part 'general_models.g.dart';

@JsonSerializable()
class GetPeriodLogResponse {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "idLog")
  int idLog;

  GetPeriodLogResponse({
    required this.status,
    required this.idLog,
  });

  factory GetPeriodLogResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPeriodLogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPeriodLogResponseToJson(this);
}

@JsonSerializable()
class ClearOrderCacheResponse {
  @JsonKey(name: "message")
  String message;

  ClearOrderCacheResponse({
    required this.message,
  });

  factory ClearOrderCacheResponse.fromJson(Map<String, dynamic> json) =>
      _$ClearOrderCacheResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClearOrderCacheResponseToJson(this);
}

@JsonSerializable()
class VerifyOrderResponse {
  @JsonKey(name: "code")
  dynamic code;
  @JsonKey(name: "require")
  List<String> require;
  @JsonKey(name: "un_require")
  bool unRequire;
  @JsonKey(name: "updated")
  bool updated;
  @JsonKey(name: "user")
  dynamic user;

  VerifyOrderResponse({
    required this.code,
    required this.require,
    required this.unRequire,
    required this.updated,
    required this.user,
  });

  factory VerifyOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOrderResponseToJson(this);
}

@JsonSerializable()
class SendOrderOnlineResponse {
  @JsonKey(name: "status")
  bool status;

  SendOrderOnlineResponse({
    required this.status,
  });

  factory SendOrderOnlineResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOrderOnlineResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendOrderOnlineResponseToJson(this);
}

@JsonSerializable()
class PasswordResetResponse {
  @JsonKey(name: "affectedRows")
  int affectedRows;

  PasswordResetResponse({
    required this.affectedRows,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetResponseToJson(this);
}

@JsonSerializable()
class NameValueType {
  String name;
  String value;

  NameValueType({
    required this.name,
    required this.value,
  });
}

@JsonSerializable()
class OrderCompleteArguments {
  String orderId;
  String userId;
  bool orderStatus;

  OrderCompleteArguments({
    this.orderId = "",
    this.userId = "",
    this.orderStatus = false,
  });

  factory OrderCompleteArguments.fromJson(Map<String, dynamic> json) =>
      _$OrderCompleteArgumentsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCompleteArgumentsToJson(this);
}

@JsonSerializable()
class PasswordUpdateModel {
  String value;

  PasswordUpdateModel({
    this.value = "",
  });

  factory PasswordUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordUpdateModelToJson(this);
}

@JsonSerializable()
class EmailUpdateResponse {
  @JsonKey(name: "id")
  CommonIdTypeInt? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "href")
  String? href;

  EmailUpdateResponse({this.id, this.email, this.href});

  factory EmailUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmailUpdateResponseToJson(this);
}

@JsonSerializable()
class PasswordResetRequest {
  @JsonKey(name: "customer")
  CommonCustomerIdHref customer;
  @JsonKey(name: "email")
  String email;

  PasswordResetRequest({required this.customer, required this.email});

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetRequestToJson(this);
}
