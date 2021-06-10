import 'package:code_magic_ex/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/global/widgets/activity_indicators.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginHomePage';
  const LoginScreen({required Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // loginBloc.getLoginToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: StreamBuilder<CustomerToken>(
              stream: loginBloc.subject.stream,
              builder: (context, AsyncSnapshot<CustomerToken> snapshot) {
                return ElevatedButton(
                  onPressed: () => loginBloc.getLoginToken(context),
                  child: const Text("Rock & Roll"),
                );
                ActivityIndicator(
                    loadingStream: loginBloc.activityIndicatorStream);
              }),
        ));
  }
}
