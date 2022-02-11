import 'package:flutter/material.dart';

import '../order_create/component/app_bar.dart';
import 'components/body.dart';

class CreateOpenPoOrderResult extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(leading: "empty"),
      body: Body(),
    );
  }
}
