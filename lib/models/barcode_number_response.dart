import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode_number_response.g.dart';

@JsonSerializable()
class BarcodeNumberResponse {
  @JsonKey(name: "items")
  List<String> items;



  BarcodeNumberResponse({required this.items});

  factory BarcodeNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$BarcodeNumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeNumberResponseToJson(this);

  Map<String, dynamic> toMap() => {'items': items};
}