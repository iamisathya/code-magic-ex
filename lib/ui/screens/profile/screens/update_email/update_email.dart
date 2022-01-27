import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/profile/screens/update_email/widgets/body.dart';
import 'package:flutter/material.dart';

class UpdateEmailScreen extends StatelessWidget {
  static const String routeName = "/updateEmailScreen";
  const UpdateEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: const Body(),
    );
  }
}
