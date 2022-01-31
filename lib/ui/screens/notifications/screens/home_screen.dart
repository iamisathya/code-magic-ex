import 'package:flutter/material.dart';

import '../../open_po/order_create/component/app_bar.dart';
import '../widgets/body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: const Body(),
    );
  }
}
