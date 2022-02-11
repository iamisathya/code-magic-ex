// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'govt_id_verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovtIdVerify _$GovtIdVerifyFromJson(Map<String, dynamic> json) => GovtIdVerify(
      success: json['Success'] as String,
      message: json['Message'],
    );

Map<String, dynamic> _$GovtIdVerifyToJson(GovtIdVerify instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Message': instance.message,
    };

VerificationMesaage _$VerificationMesaageFromJson(Map<String, dynamic> json) =>
    VerificationMesaage(
      errMessage: json['err_no'] as String,
    );

Map<String, dynamic> _$VerificationMesaageToJson(
        VerificationMesaage instance) =>
    <String, dynamic>{
      'err_no': instance.errMessage,
    };
