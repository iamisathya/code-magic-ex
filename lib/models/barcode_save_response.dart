import 'package:json_annotation/json_annotation.dart';

part 'barcode_save_response.g.dart';

@JsonSerializable()
class BarCodeSaveResponse {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "errorMessages")
  List<String>? errorMessages;
  @JsonKey(name: "infoMessages")
  List<String>? infoMessages;
  @JsonKey(name: "validateResult")
  ValidateResult? validateResult;
  @JsonKey(name: "orderItems")
  List<OrderItems> orderItems;
  @JsonKey(name: "message")
  String? message;

  BarCodeSaveResponse(
      {required this.success,
      this.errorMessages,
      this.infoMessages,
      required this.orderItems,
      this.validateResult,
      this.message});

  factory BarCodeSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$BarCodeSaveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BarCodeSaveResponseToJson(this);

  Map<String, dynamic> toMap() => {
        'success': success,
        'errorMessages': errorMessages,
        'infoMessages': infoMessages,
        'validateResult': validateResult
      };
}

@JsonSerializable()
class ValidateResult {
  @JsonKey(name: "success")
  String success;
  @JsonKey(name: "infoMessages")
  List<String>? infoMessages;
  @JsonKey(name: "errorMessages")
  List<String>? errorMessages;
  @JsonKey(name: "errorBarcodes")
  List<dynamic>? errorBarcodes;
  @JsonKey(name: "validBarcodes")
  List<String>? validBarcodes;

  ValidateResult(
      {required this.success,
      this.infoMessages,
      this.errorMessages,
      this.errorBarcodes,
      this.validBarcodes});

  factory ValidateResult.fromJson(Map<String, dynamic> json) =>
      _$ValidateResultFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateResultToJson(this);
}

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "item_code")
  String itemCode;
  @JsonKey(name: "item_code_parent")
  String itemCodeParent;
  @JsonKey(name: "item_name")
  String itemName;
  @JsonKey(name: "qty")
  int qty;
  @JsonKey(name: "require_scan")
  int requireScan;
  @JsonKey(name: "count_barcode")
  int countBarcode;
  @JsonKey(name: "complete")
  int complete;
  @JsonKey(name: "stamp_created")
  String stampCreated;
  @JsonKey(name: "stamp_updated")
  String stampUpdated;
  @JsonKey(name: "note")
  String? note;

  OrderItems(
      {required this.id,
      required this.orderId,
      required this.itemCode,
      required this.itemCodeParent,
      required this.itemName,
      required this.qty,
      required this.requireScan,
      required this.countBarcode,
      required this.complete,
      required this.stampCreated,
      required this.stampUpdated,
      this.note});

  factory OrderItems.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemsToJson(this);
}
