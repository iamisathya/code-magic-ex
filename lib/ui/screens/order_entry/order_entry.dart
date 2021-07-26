import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/home/components/body.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class OrderEntryHomeScreen extends StatelessWidget {
  static const String routeName = '/orderEntryHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPageBackground,
        appBar: const TransAppBar(
          title: "Order Entry",
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
