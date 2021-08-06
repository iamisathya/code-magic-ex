import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginPage';  
   
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
