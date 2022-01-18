import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class CreateOpenPoOrderResult extends StatelessWidget {
  static const String routeName = '/createOpenPoOrderResult';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(leading: "empty"),
      body: Body(),
    );
  }
}
