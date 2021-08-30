import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
