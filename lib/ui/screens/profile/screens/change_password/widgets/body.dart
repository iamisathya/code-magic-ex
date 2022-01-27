import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(title: "barcode_tracker".tr),
      ],
    );
  }
}
