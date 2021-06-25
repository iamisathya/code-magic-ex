import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';

final CustomerToken _emptyToken = CustomerToken(
  href: '',
  token: '',
  whoami: WhoMeHref(href: ""),
  customer: CustomerHref(href: ""),
);


class LoginPageState {
  CustomerToken customerToken;
  UserInfo userInfo;
  final bool hasError;
  final bool isLoading;

  LoginPageState({
    required this.customerToken,
    required this.userInfo,
    this.hasError = false,
    this.isLoading = false,
  });

  factory LoginPageState.initial() =>
      LoginPageState(customerToken: _emptyToken, userInfo: UserInfo());

  factory LoginPageState.loading() => LoginPageState(
        customerToken: _emptyToken,
        userInfo: UserInfo(),
        isLoading: true,
      );

  factory LoginPageState.error() => LoginPageState(
        customerToken: _emptyToken,
        userInfo: UserInfo(),
        hasError: true,
      );
}
