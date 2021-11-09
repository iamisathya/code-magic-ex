import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: const [
          PageTitle(title: "Terms & conditions"),
        ],
      )),
    );
  }
}
