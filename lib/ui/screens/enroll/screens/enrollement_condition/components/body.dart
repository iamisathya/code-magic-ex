import 'package:flutter/material.dart';

import '../../../../inventory/component/page_title.dart';

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
