import 'package:json_annotation/json_annotation.dart';

part 'verify_each_barcode_response.g.dart';

@JsonSerializable()
class VerifyEachBarcodeResponse {
  @JsonKey(name: "pass")
  String pass;
  @JsonKey(name: "error")
  List<ErrorMessage>? error;
  @JsonKey(name: "scan")
  List<Scan> scan;


  VerifyEachBarcodeResponse({
    required this.pass,
    this.error,
    required this.scan,
  });

  factory VerifyEachBarcodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEachBarcodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEachBarcodeResponseToJson(this);

  Map<String, dynamic> toMap() =>
      {'pass': pass, 'error': error, 'scan': scan};
}

@JsonSerializable()
class Scan {
  @JsonKey(name: "item")
  String item;
  @JsonKey(name: "pass")
  bool pass;

  Scan({required this.item, required this.pass});

    factory Scan.fromJson(Map<String, dynamic> json) =>
      _$ScanFromJson(json);

  Map<String, dynamic> toJson() => _$ScanToJson(this);
}

@JsonSerializable()
class ErrorMessage {
  @JsonKey(name: "msg")
  String msg;

  ErrorMessage({required this.msg});

    factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);
}