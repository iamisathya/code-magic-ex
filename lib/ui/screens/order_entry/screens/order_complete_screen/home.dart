import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:flutter/material.dart';

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
