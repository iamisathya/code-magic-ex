import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/order_entry_body.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class OrderEntryTable extends StatelessWidget {
  static const String routeName = '/orderEntryTablePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPageBackground,
        appBar: const TransAppBar(
          title: "Order Entry",
        ),
        body: OrderEntryBody());
  }
}
