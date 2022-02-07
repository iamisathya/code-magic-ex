import 'package:flutter/material.dart';

import '../order_create/component/app_bar.dart';
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
