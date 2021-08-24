import 'package:json_annotation/json_annotation.dart';

part 'govt_id_verify.g.dart';

@JsonSerializable()
class GovtIdVerify {
  @JsonKey(name: "Success")
  String success;
  @JsonKey(name: "Message")
  dynamic message;

  GovtIdVerify({
    required this.success,
    required this.message,
  });

  factory GovtIdVerify.fromJson(Map<String, dynamic> json) =>
      _$GovtIdVerifyFromJson(json);

  Map<String, dynamic> toJson() => _$GovtIdVerifyToJson(this);
}

@JsonSerializable()
class VerificationMesaage {
  @JsonKey(name: "err_no")
  String errMessage;

  VerificationMesaage({
    required this.errMessage,
  });

  factory VerificationMesaage.fromJson(Map<String, dynamic> json) =>
      _$VerificationMesaageFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationMesaageToJson(this);
}
