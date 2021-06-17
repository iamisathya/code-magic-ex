import 'package:json_annotation/json_annotation.dart';

part 'common_methods.g.dart';

//*  GenericHref example
//*  "profilePicture": {
//*    "href": "https://hydra.unicity.net/v5a/customers/blah-blah"
//*   },

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


//*  HumanNameFull example
//*  "humanName": {
//*    "firstName": "Lord",
//*    "lastName": "Voldemort",
//*    "fullName": "Lord Voldemort",
//*    "fullName@th": "ซื้อ 1000 ครั้ง ปลดล๊อกสกินเขียว"
//*  },

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


//*  "id": {
//*    "unicity": "XX-123456",
//*  },
@JsonSerializable()
class CommonUserIdCountry {
  @JsonKey(name: "id")
  CommonIdWithCountryCode id;

  CommonUserIdCountry({
    required this.id,
  });

  factory CommonUserIdCountry.fromJson(Map<String, dynamic> json) =>
      _$CommonUserIdCountryFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserIdCountryToJson(this);
}

//* "unicity": "XX-123456",
@JsonSerializable()
class CommonIdWithCountryCode {
  @JsonKey(name: "unicity")
  CommonIdTypeString unicity;

  CommonIdWithCountryCode({
    required this.unicity,
  });

  factory CommonIdWithCountryCode.fromJson(Map<String, dynamic> json) =>
      _$CommonIdWithCountryCodeFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdWithCountryCodeToJson(this);
}


//*  "id": {
//*    "unicity": "123456",
//*  },
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

//*    "unicity": "123456",
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


//*  HumanNameFull example
//*  "humanName": {
//*    "fullName": "Thailand DSC Training"
//*  }

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

//*  HumanNameFull example
//*  "fullName": "Thailand DSC Training"
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

//*  HumanNameFull example
//*  "fullName": "Thailand DSC Training"
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

//*  CompleteHumanThName example
//*  "humanName": {
//*    "firstName": "walaa",
//*    "lastName": "bushakhar",
//*    "fullName": "walaa bushakhar",
//*    "firstName@th": "walaa",
//*    "lastName@th": "fawzi bushakhar",
//*    "fullName@th": "walaa fawzi bushakhar"
//*  }
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

//*  CompleteHumanThName example
//*  "humanName": {
//*    "firstName": "walaa",
//*    "lastName": "bushakhar",
//*    "fullName": "walaa bushakhar",
//*  }
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

//* "content": {
//*   "description": "Easyship 100HN Rev1 TH"
//* }

@JsonSerializable()
class CommonCatalogSlideContent {
  @JsonKey(name: "content")
  ContentDescription content;

  CommonCatalogSlideContent({required this.content});


  factory CommonCatalogSlideContent.fromJson(Map<String, dynamic> json) =>
      _$CommonCatalogSlideContentFromJson(json);

  Map<String, dynamic> toJson() => _$CommonCatalogSlideContentToJson(this);
}

//* "description": "Easyship 100HN Rev1 TH"
@JsonSerializable()
class CommonContentDescription {
  @JsonKey(name: "description")
  String description;

  CommonContentDescription({
    required this.description,
  });


  factory CommonContentDescription.fromJson(Map<String, dynamic> json) =>
      _$CommonContentDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$CommonContentDescriptionToJson(this);
}

//* "terms": {
//*   "priceEach": 7080,
//*   "pvEach": 101
//* }
@JsonSerializable()
class CommonTermsEach {
  @JsonKey(name: "priceEach")
  double priceEach;
  @JsonKey(name: "pvEach")
  int pvEach;

  CommonTermsEach({
    required this.pvEach,
    required this.priceEach,
  });

  factory CommonTermsEach.fromJson(Map<String, dynamic> json) => _$CommonTermsEachFromJson(json);

  Map<String, dynamic> toJson() => _$CommonTermsEachToJson(this);
}

//* "terms": {
//*   "period": "2020-12"
//* }
@JsonSerializable()
class TermsPeriod {
  @JsonKey(name: "period")
  String period;

  TermsPeriod({
    required this.period,
  });

  factory TermsPeriod.fromJson(Map<String, dynamic> json) => _$TermsPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$TermsPeriodToJson(this);
}

//* "customer": {
//*   "href": "https://hydra.unicity.net/v5a/customers/7db0b8ee213916d87bca8c57aa6a0c65",
//*   "id": {
//*       "unicity": 3011266
//*   }
//* }
@JsonSerializable()
class CommonCustomerIdHref {
  @JsonKey(name: "href")
  String href;

  TermsPeriod({
    required this.period,
  });

  factory TermsPeriod.fromJson(Map<String, dynamic> json) => _$TermsPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$TermsPeriodToJson(this);
}



//*  "id": {
//*    "unicity": 123456,
//*  },
@JsonSerializable()
class CommonUserIdIntObject {
  @JsonKey(name: "id")
  CommonIdTypeInt id;

  CommonUserIdIntObject({
    required this.id,
  });

  factory CommonUserIdIntObject.fromJson(Map<String, dynamic> json) =>
      _$CommonUserIdIntObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserIdIntObjectToJson(this);
}

//*    "unicity": 123456,
@JsonSerializable()
class CommonIdTypeInt {
  @JsonKey(name: "unicity")
  int unicity;

  CommonIdTypeInt({
    required this.unicity,
  });

  factory CommonIdTypeInt.fromJson(Map<String, dynamic> json) =>
      _$CommonIdTypeIntFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdTypeIntToJson(this);
}


