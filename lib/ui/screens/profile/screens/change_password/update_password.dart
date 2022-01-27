import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/profile/screens/change_password/widgets/body.dart';
import 'package:flutter/material.dart';

class UpdatePasswordScreen extends StatelessWidget {
  static const String routeName = "/updatePasswordScreen";
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: const Body(),
    );
  }
}
