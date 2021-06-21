import 'package:json_annotation/json_annotation.dart';

part 'user_token.g.dart';

@JsonSerializable()
class CustomerToken {
  final CustomerHref customer;
  final String href;
  final String token;
  final WhoMeHref whoami;

  CustomerToken(): customer = CustomerHref(), href = "", token  = "", whoami = WhoMeHref();

  factory CustomerToken.fromJson(Map<String, dynamic> json) => _$CustomerTokenFromJson(json);
  
  Map<String, dynamic> toJson() => _$CustomerTokenToJson(this);

  String get getCustomerToken => token;

  Map<String, dynamic> toMap() => {
        'customer': customer,
        'href': href,
        'token': token,
        'whoami': whoami
      };
}

@JsonSerializable()
class CustomerHref {
  final String href;

  CustomerHref({this.href = ""});

  factory CustomerHref.fromJson(Map<String, dynamic> json) => _$CustomerHrefFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerHrefToJson(this);
}

@JsonSerializable()
class WhoMeHref {
  final String href;

  WhoMeHref({this.href = ""});

  factory WhoMeHref.fromJson(Map<String, dynamic> json) => _$WhoMeHrefFromJson(json);

  Map<String, dynamic> toJson() => _$WhoMeHrefToJson(this);
}



