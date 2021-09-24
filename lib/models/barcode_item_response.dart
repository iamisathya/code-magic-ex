import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode_item_response.g.dart';

@JsonSerializable()
class BarCodeItemsResponse {
  @JsonKey(name: "items")
  List<BarcodeItem> items;
  @JsonKey(name: "user")
  String user;

  BarCodeItemsResponse({required this.items, required this.user});

  factory BarCodeItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$BarCodeItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BarCodeItemsResponseToJson(this);

  Map<String, dynamic> toMap() => {'items': items, 'user': user};
}

@JsonSerializable()
class BarcodeItem {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "desc")
  String desc;
  @JsonKey(name: "qty")
  int qty;
  @JsonKey(name: "remain")
  int remain;
  @JsonKey(name: "require")
  bool require;
  @JsonKey(name: "scan")
  int scan;

  BarcodeItem(
      {required this.code,
      required this.desc,
      required this.qty,
      required this.remain,
      required this.require,
      required this.scan});

  factory BarcodeItem.fromJson(Map<String, dynamic> json) =>
      _$BarcodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeItemToJson(this);

  Map<String, dynamic> toMap() => {
        'code': code,
        'desc': desc,
        'qty': qty,
        'remain': remain,
        'require': require,
        'scan': scan
      };
}
