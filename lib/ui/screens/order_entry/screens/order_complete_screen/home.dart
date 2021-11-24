import 'package:flutter/material.dart';

import '../../../open_po/order_create/component/app_bar.dart';
import 'components/body.dart';

class OrderEntryComplete extends StatelessWidget {
  static const String routeName = '/orderEntryCompletePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: Body(),
    );
  }
}
