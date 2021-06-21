import 'package:code_magic_ex/models/user_token.dart';

final CustomerToken _emptyToken = CustomerToken(
  href: '',
  token: '',
  whoami: WhoMeHref(href: ""),
  customer: CustomerHref(href: ""),
);

class LoginPageState {
  CustomerToken customerToken;
  final bool hasError;
  final bool isLoading;

  LoginPageState({
    required this.customerToken,
    this.hasError = false,
    this.isLoading = false,
  });

  factory LoginPageState.initial() =>
      LoginPageState(customerToken: _emptyToken);

  factory LoginPageState.loading() =>
      LoginPageState(customerToken: _emptyToken, isLoading: true);

  factory LoginPageState.error() => LoginPageState(
        customerToken: _emptyToken,
        hasError: true,
      );
}
