import 'package:json_annotation/json_annotation.dart';

part 'common_methods.g.dart';

// GenericHref example
// "profilePicture": {
//   "href": "https://hydra.unicity.net/v5a/customers/blah-blah"
//  },

@JsonSerializable()
class CommonGenericHref {
  @JsonKey(name: "href")
  String href;

  CommonGenericHref({
    required this.href,
  });
  
  factory CommonGenericHref.fromJson(Map<String, dynamic> json) =>
      _$CommonGenericHrefFromJson(json);

  Map<String, dynamic> toJson() => _$CommonGenericHrefToJson(this);
}


// HumanNameFull example
// "humanName": {
//   "firstName": "Lord",
//   "lastName": "Voldemort",
//   "fullName": "Lord Voldemort",
//   "fullName@th": "ซื้อ 1000 ครั้ง ปลดล๊อกสกินเขียว"
// },

@JsonSerializable()
class CommonHumanNameFull {
  String firstName;
  String lastName;
  String fullName;
  @JsonKey(name: "fullName@th")
  String fullNameTh;

  CommonHumanNameFull(
      {required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.fullNameTh});

  factory CommonHumanNameFull.fromJson(Map<String, dynamic> json) =>
      _$CommonHumanNameFullFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHumanNameFullToJson(this);
}

// HumanNameFull example
// "id": {
//   "unicity": "123456",
// },

@JsonSerializable()
class CommonUserIdString {
  @JsonKey(name: "id")
  CommonIdTypeString id;

  CommonUserIdString({
    required this.id,
  });

  factory CommonUserIdString.fromJson(Map<String, dynamic> json) =>
      _$CommonUserIdStringFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserIdStringToJson(this);
}


@JsonSerializable()
class CommonIdTypeString {
  @JsonKey(name: "unicity")
  String unicity;

  CommonIdTypeString({
    required this.unicity,
  });

  factory CommonIdTypeString.fromJson(Map<String, dynamic> json) =>
      _$CommonIdTypeStringFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdTypeStringToJson(this);
}


// HumanNameFull example
// "humanName": {
//   "fullName": "Thailand DSC Training"
// }

@JsonSerializable()
class CommonHumanFullName {
  @JsonKey(name: "fullName")
  CommonFullNameOnly fullName;

  CommonHumanFullName({
    required this.fullName,
  });

  factory CommonHumanFullName.fromJson(Map<String, dynamic> json) =>
      _$CommonHumanFullNameFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHumanFullNameToJson(this);
}

// HumanNameFull example
// "fullName": "Thailand DSC Training"
@JsonSerializable()
class CommonFullNameOnly {
  @JsonKey(name: "fullName")
  String fullName;

  CommonFullNameOnly({
    required this.fullName,
  });

  factory CommonFullNameOnly.fromJson(Map<String, dynamic> json) =>
      _$CommonFullNameOnlyFromJson(json);

  Map<String, dynamic> toJson() => _$CommonFullNameOnlyToJson(this);
}

// HumanNameFull example
// "fullName": "Thailand DSC Training"
@JsonSerializable()
class CommonIdAndIota {
  @JsonKey(name: "unicity")
  String unicity;
  @JsonKey(name: "iota")
  String iota;

  CommonIdAndIota({
    required this.unicity,
    required this.iota,
  });

  factory CommonIdAndIota.fromJson(Map<String, dynamic> json) =>
      _$CommonIdAndIotaFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdAndIotaToJson(this);
}

// CompleteHumanThName example
// "humanName": {
//   "firstName": "walaa",
//   "lastName": "bushakhar",
//   "fullName": "walaa bushakhar",
//   "firstName@th": "walaa",
//   "lastName@th": "fawzi bushakhar",
//   "fullName@th": "walaa fawzi bushakhar"
// }
@JsonSerializable()
class CompleteHumanThName {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "fullName")
  String fullName;
  @JsonKey(name: "firstName@th")
  String firstNameTh;
  @JsonKey(name: "lastName@th")
  String lastNameTh;
  @JsonKey(name: "fullName@th")
  String fullNameTh;

  CompleteHumanThName({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.firstNameTh,
    required this.lastNameTh,
    required this.fullNameTh,
  });

  factory CompleteHumanThName.fromJson(Map<String, dynamic> json) =>
      _$CompleteHumanThNameFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteHumanThNameToJson(this);
}

// CompleteHumanThName example
// "humanName": {
//   "firstName": "walaa",
//   "lastName": "bushakhar",
//   "fullName": "walaa bushakhar",
// }
@JsonSerializable()
class CommonShipToNameFull {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "fullName")
  String fullName;

  CommonShipToNameFull({required this.firstName, required this.lastName, required this.fullName});

  factory CommonShipToNameFull.fromJson(Map<String, dynamic> json) =>
      _$CommonShipToNameFullFromJson(json);

  Map<String, dynamic> toJson() => _$CommonShipToNameFullToJson(this);
}



