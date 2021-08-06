import 'package:json_annotation/json_annotation.dart';

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
