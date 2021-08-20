import 'package:flutter/material.dart';

import '../../global/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'components/body.dart';

class BarcodeHomeScreen extends StatelessWidget {
  static const String routeName = '/barcodeHomePage';
  static TextEditingController searchConntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TransAppBar(
          title: "BarCode",
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
